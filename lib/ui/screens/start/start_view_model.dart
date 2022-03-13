import 'package:aims/base_model.dart';
import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_condition.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
import 'package:aims/core/models/control.dart';
import 'package:aims/core/models/cost_center_model.dart';
import 'package:aims/core/models/drop1_data_model.dart';
import 'package:aims/core/models/drop2_data_model.dart';
import 'package:aims/core/models/drop3_data_model.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/location_model.dart';
import 'package:aims/core/models/parameter_setup.dart';
import 'package:aims/core/models/site_status.dart';
import 'package:aims/core/services/asset_service.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:aims/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class StartViewModel extends BaseModel {
  bool positionIsLoading = false;

  bool addressIsLoading = false;
  var costCenter = <ConstCenter>[];
  var locations = <LocationModel>[];
  var parameters = <ParameterSetUp>[];
  var control = <Control>[];
  var assetcategoryList = <AssetCategory>[];
  var assetSubCatList = <AssetSubCategory>[];
  var assetTypeList = <AssetType>[];
  var assetNameList = <AssetName>[];
  var assetConditionList = <AssetCondition>[];
  var siteIssuesList = <Status>[];
  var drop1DataList = <Drop1DataModel>[];
  var drop2DataList = <Drop2DataModel>[];
  var drop3DataList = <Drop3DataModel>[];

  String? selectedCostCenter;
  String? selectedLocation;

  setPositionIsLoading(val) {
    positionIsLoading = val;
    notifyListeners();
  }

  setAddressIsLoading(val) {
    addressIsLoading = false;
    notifyListeners();
  }

  final Geolocator geolocator = Geolocator();
  Position? currentPosition;
  String? currentAddress;

  final AuthService _authService = locator<AuthService>();
  final AssetService _assetService = locator<AssetService>();

  getCostCenters() async {
    var payload = {"client": _authService.currentUser!.client};
    final result = await _authService.getCostCenters(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<ConstCenter> centers =
          List.from(data.map((item) => ConstCenter.fromJson(item)));

      costCenter = centers;
      notifyListeners();
    }
  }

  getPosition() async {
    setPositionIsLoading(true);
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setPositionIsLoading(false);
      showErrorToast('Location service is disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      getPosition();
      if (permission == LocationPermission.denied) {
        setPositionIsLoading(false);
        showErrorToast('Location permissions are denied');
      }
    } else {
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          forceAndroidLocationManager: true);
      print(currentPosition);
      setPositionIsLoading(false);
      notifyListeners();
      _getAddressFromLatLng();
    }
  }

  // getPosition() async {
  //   currentPosition = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best,
  //       forceAndroidLocationManager: true);
  //   print(currentPosition);
  //   notifyListeners();
  //   _getAddressFromLatLng();
  // }

  _getAddressFromLatLng() async {
    setAddressIsLoading(true);
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition!.latitude, currentPosition!.longitude);

      Placemark place = placemarks[0];

      currentAddress =
          "${place.subLocality}, ${place.locality}, ${place.country}";
      setAddressIsLoading(false);
      notifyListeners();
    } catch (e) {
      setAddressIsLoading(false);
      print(e);
    }
  }

  getLocations() async {
    var payload = {
      "client": _authService.currentUser!.client,
      "name": _authService.currentUser!.name
    };
    final result = await _authService.getLocation(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<LocationModel> location =
          List.from(data.map((item) => LocationModel.fromJson(item)));

      locations = location;
      notifyListeners();
    }
  }

  ConstCenter getCostCenterValue(String description) {
    var cs =
        costCenter.firstWhere((element) => element.description == description);
    return cs;
  }

  LocationModel getLocationValue(String s) {
    var ls = locations.firstWhere((element) => element.address == s);
    return ls;
  }

  setValues(context) {
    if (selectedLocation == null) {
      showErrorToast('Select Location');
      return;
    }
    if (selectedCostCenter == null) {
      showErrorToast('Select Cost Center');
      return;
    }
    // if (currentAddress == null) {
    //   showErrorToast('Current Address cannot be empty');
    //   return;
    // }
    var slC = getCostCenterValue(selectedCostCenter!);
    var lsC = getLocationValue(selectedLocation!);

    _authService.currentUser!.costCenter = selectedCostCenter;
    _authService.currentUser!.location = selectedLocation;
    _authService.currentUser!.lat = currentPosition?.latitude;
    _authService.currentUser!.long = currentPosition?.longitude;
    _authService.currentUser!.address = currentAddress ?? "N/A";
    _authService.currentUser!.costCenterValue = slC.code;
    _authService.currentUser!.locationSelectedValue = lsC.name;

    notifyListeners();
    print(_authService.currentUser);
    AutoRouter.of(context)
        .pushAndPopUntil(const Welcome(), predicate: (route) => false);
  }

  getParameters() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _authService.getParameters(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<ParameterSetUp> parameterList =
          List.from(data.map((item) => ParameterSetUp.fromJson(item)));

      parameters = parameterList;
      print("PARAMETERS $parameters");
      notifyListeners();
    }
  }

  getControl() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _authService.getControls(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<Control> controlList =
          List.from(data.map((item) => Control.fromJson(item)));

      control = controlList;
      print("CONTROL ::::$control");
      notifyListeners();
    }
  }

  getAssetCategory() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _assetService.getAssetCategory(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<AssetCategory> assetCategory =
          List.from(data.map((item) => AssetCategory.fromJson(item)));

      assetcategoryList = assetCategory;
      print(assetcategoryList);
      notifyListeners();
    }
  }

  getAssetSubCategory() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _assetService.getAssetSubCategory(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<AssetSubCategory> assetSubCategory =
          List.from(data.map((item) => AssetSubCategory.fromJson(item)));

      assetSubCatList = assetSubCategory;
      print(" subcatlist ::::$assetSubCatList");
      notifyListeners();
    }
  }

  getAssetType() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _assetService.getAssetType(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<AssetType> assetTypes =
          List.from(data.map((item) => AssetType.fromJson(item)));

      assetTypeList = assetTypes;
      print(" assetsubtypeList::::::$assetTypeList");
      notifyListeners();
    }
  }

  getAsssetName() async {
    var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _assetService.getAssetName(payload);
    
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<AssetName> assetNames =
          List.from(data.map((item) => AssetName.fromJson(item)));

      assetNameList = assetNames;
      print("assetName:::::$assetNameList");
      notifyListeners();
    }
  }

  getAssetCondition() async {
    final result = await _assetService.getAssetCondition();
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<AssetCondition> assetCtn =
          List.from(data.map((item) => AssetCondition.fromJson(item)));

      assetConditionList = assetCtn;
      print("assetName:::::$assetNameList");
      notifyListeners();
    }
  }

  getIssues() async {
        var payload = {
      "client": _authService.currentUser!.client,
    };
    final result = await _assetService.getSiteIssues(payload);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<Status> siteIssues =
          List.from(data.map((item) => Status.fromJson(item)));

      siteIssuesList = siteIssues;
      print("assetName:::::$assetNameList");
      notifyListeners();
    }
  }

  getDrop1() async {
    final result =
        await _assetService.getDrop1Data(_authService.currentUser!.client!);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<Drop1DataModel> drop1Data =
          List.from(data.map((item) => Drop1DataModel.fromJson(item)));

      drop1DataList = drop1Data;
      print("drop1Data:::::${drop1Data.length}");
      notifyListeners();
    }
  }

  getDrop2() async {
    final result =
        await _assetService.getDrop2Data(_authService.currentUser!.client!);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<Drop2DataModel> drop2Data =
          List.from(data.map((item) => Drop2DataModel.fromJson(item)));

      drop2DataList = drop2Data;
      print("drop1Data:::::$drop2Data");
      notifyListeners();
    }
  }

  getDrop3() async {
    final result =
        await _assetService.getDrop3Data(_authService.currentUser!.client!);
    if (result is ErrorModel) {
      showErrorToast(result.error.toString());
    } else {
      var data = result.data;
      List<Drop3DataModel> drop3Data =
          List.from(data.map((item) => Drop3DataModel.fromJson(item)));

      drop3DataList = drop3Data;
      print("drop1Data:::::$drop3Data");
      notifyListeners();
    }
  }
}
