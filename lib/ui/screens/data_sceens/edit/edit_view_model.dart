import 'dart:convert';
import 'dart:io';

import 'package:aims/base_model.dart';
import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_condition.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/control.dart';
import 'package:aims/core/models/drop1_data_model.dart';
import 'package:aims/core/models/drop2_data_model.dart';
import 'package:aims/core/models/drop3_data_model.dart';
import 'package:aims/core/models/misc.dart';
import 'package:aims/core/models/parameter_setup.dart';
import 'package:aims/core/models/site_status.dart';
import 'package:aims/core/services/auth_service.dart';
// import 'package:aims/core/models/error_model.dart';
import 'dart:async';
// import 'dart:io' show Platform;

// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:aims/core/services/constants.dart';
import 'package:aims/locator.dart';
import 'package:aims/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class EditDataViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  bool firstpage = true;
  bool secondpage = false;
  bool thirdPage = false;

  bool firstImageSelected = false;
  bool secondImageSelected = false;
  bool thirdImageSelected = false;
  bool fourthImageSelected = false;

  AssetCategory? selectedPrdtCat;
  AssetSubCategory? selectedPrdtSubCat;
  AssetType? selectedAssetType;
  AssetName? selectedAssetName;
  String? selectedContiion;
  String? selectedStatus;
  String? drop1SelectedValue;
  String? drop2SelectedValue;
  String? drop3SelectedValue;

  var categoryList = <AssetCategory>[];
  var subCategoryList = <AssetSubCategory>[];
  var assetTypeList = <AssetType>[];
  var assetNameList = <AssetName>[];
  var assetConditionList = <AssetCondition>[];
  var siteIssues = <Status>[];
  var parameterList = <ParameterSetUp>[];
  var controlList = <Control>[];
  var capturedData = <CapturedData>[];
  var drop1DataList = <Drop1DataModel>[];
  var drop2DataList = <Drop2DataModel>[];
  var drop3DataList = <Drop3DataModel>[];
  Misc? misc;

  late String image1;
  late String image2;
  late String image3;
  late String image4;

  bool showLevel2 = true;
  bool showLevel3 = true;
  bool showLevel4 = true;

  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setFirstPage(val) {
    firstpage = val;
    notifyListeners();
  }

  setSecondPage(val) {
    secondpage = val;
    notifyListeners();
  }

  setThirdPage(val) {
    thirdPage = val;
    notifyListeners();
  }

  getCategories() {
    final box = Hive.box<AssetCategory>(assetCategoryBoxName);
    if (box.isOpen && box.isNotEmpty) {
      categoryList = box.values.toList();
      notifyListeners();
    }
  }

  getSubCategories() {
    final box = Hive.box<AssetSubCategory>(assetSubCatogoryBoxName);
    if (box.isOpen && box.isNotEmpty) {
      subCategoryList = box.values.toList();
      notifyListeners();
    }
  }

  getAssetTypes() {
    final box = Hive.box<AssetType>(assetTypeBoxName);
    if (box.isOpen && box.isNotEmpty) {
      assetTypeList = box.values.toList();
      notifyListeners();
    }
  }

  getAssetNames() {
    final box = Hive.box<AssetName>(assetNameBoxName);
    if (box.isOpen && box.isNotEmpty) {
      assetNameList = box.values.toList();
      notifyListeners();
    }
  }

  getCapturedData() {
    final box = Hive.box<CapturedData>(captuedDataBoxName);
    if (box.isOpen && box.isNotEmpty) {
      capturedData = box.values.toList();
      notifyListeners();
    }
  }

  bool iterateForSimilarBarcode(String barcode) {
    print(capturedData);
    var contains = capturedData
        .where((element) =>
            element.barcode == barcode ||
            element.parentBarcode == barcode ||
            element.serialNo == barcode)
        .toList();
    if (contains.isNotEmpty) {
      showErrorToast('Barcode already exists please use another');
      return true;
    } else {
      return false;
    }
  }

  selectCategory(val) {
    selectedPrdtCat = val;
    notifyListeners();
    var selectedCat = categoryList
        .firstWhere((element) => element.caption == selectedPrdtCat!.caption);
    selectedPrdtSubCat = null;
    notifyListeners();
    getSubCategory(selectedCat.code);
  }

  selectedSubcategory(val) {
    selectedPrdtSubCat = val;
    notifyListeners();
    var selectedSubcat = subCategoryList.firstWhere(
        (element) => element.caption == selectedPrdtSubCat!.caption);
    selectedAssetType = null;
    notifyListeners();
    getAssetType(selectedSubcat.p_Code);
  }

  selectAssetType(val) {
    selectedAssetType = val;
    notifyListeners();
    var selectedssetType = assetTypeList
        .firstWhere((element) => element.caption == selectedAssetType!.caption);
    notifyListeners();
    selectedAssetName = null;
    getAssetName(selectedssetType.p_Code);
  }

  getSubCategory(String? categoryCode) {
    final box = Hive.box<AssetSubCategory>(assetSubCatogoryBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<AssetSubCategory> subcatList = box.values.toList();
      subCategoryList = subcatList
          .where((element) => element.cat_Code == categoryCode)
          .toList();
      if (subCategoryList.isEmpty) {
        subCategoryList = [];
        notifyListeners();
      }

      print(subCategoryList);
      notifyListeners();
    }
  }

  getAssetType(String? subcatCode) {
    final box = Hive.box<AssetType>(assetTypeBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<AssetType> assetTypes = box.values.toList();
      assetTypeList = assetTypes
          .where((element) => element.subCat_Code == subcatCode)
          .toList();
      print(assetTypeList);
      notifyListeners();
    }
  }

  getAssetName(String? assetTypeCode) {
    final box = Hive.box<AssetName>(assetNameBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<AssetName> assetNames = box.values.toList();
      assetNameList = assetNames
          .where((element) => element.parentCode == assetTypeCode)
          .toList();
      print(assetNameList);
      notifyListeners();
    }
  }

//!!!!!!
  getMiscData(String productName) {
    final box = Hive.box<Misc>(miscBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<Misc> miscList = box.values.toList();

      misc =
          miscList.firstWhere((element) => element.productCode == productName);
      notifyListeners();
    }
  }

  hideFields() {
    var i = parameterList[0].assetLevelCount;
    switch (i) {
      case 1:
        showLevel2 = false;
        showLevel3 = false;
        showLevel4 = false;
        notifyListeners();
        break;
      case 2:
        showLevel2 = true;
        showLevel3 = false;
        showLevel4 = false;
        break;
      case 3:
        showLevel2 = true;
        showLevel3 = true;
        showLevel4 = false;
        break;
      case 4:
        showLevel2 = true;
        showLevel3 = true;
        showLevel4 = true;
    }
  }

  decideWhatToshow() {
    var i = parameterList[0].assetLevelCount;
    switch (i) {
      case 1:
        final box = Hive.box<AssetName>(assetNameBoxName);
        if (box.isOpen && box.isNotEmpty) {
          List<AssetName> assetNames = box.values.toList();
          assetNameList = assetNames;
          print(assetNameList);
          notifyListeners();
        }
        break;
      case 2:
        final box = Hive.box<AssetType>(assetTypeBoxName);
        if (box.isOpen && box.isNotEmpty) {
          List<AssetType> assetTypes = box.values.toList();
          assetTypeList = assetTypes;

          print(assetTypeList);
          notifyListeners();
        }
        break;
      case 3:
        final box = Hive.box<AssetSubCategory>(assetSubCatogoryBoxName);
        if (box.isOpen && box.isNotEmpty) {
          List<AssetSubCategory> subcatList = box.values.toList();
          subCategoryList = subcatList;

          if (subCategoryList.isEmpty) {
            subCategoryList = [];
            notifyListeners();
          }

          print(subCategoryList);
          notifyListeners();
        }
        break;
      case 4:
        getCategories();
        break;
    }
  }

  Future<File> convertBase64ToFile(String file) async {
    final decodedBytes = base64Decode(file);
    final directory = await getApplicationDocumentsDirectory();
    var fileImg = File('${directory.path}/image.png');
    print(fileImg.path);
    fileImg.writeAsBytesSync(List.from(decodedBytes));
    return fileImg;
  }

  Future<String> scanBarcode() async {
    try {
      final result = await BarcodeScanner.scan();
      var option = iterateForSimilarBarcode(result.rawContent);
      if (option) {
        return '';
      }
      return result.rawContent;
    } on PlatformException catch (e) {
      return e.toString();
    }
  }

  getAssetCondition() {
    final box = Hive.box<AssetCondition>(assetConditionBoxName);

    if (box.isOpen && box.isNotEmpty) {
      List<AssetCondition> conditionList = box.values.toList();
      assetConditionList = conditionList;
      print(assetConditionList);
      notifyListeners();
    }
  }

  getParameterSetup() {
    final box = Hive.box<ParameterSetUp>(parameterBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<ParameterSetUp> paramtlst = box.values.toList();
      parameterList = paramtlst;
      print(parameterList);
      notifyListeners();
    }
  }

  getControl() {
    final box = Hive.box<Control>(controlBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<Control> ctrl = box.values.toList();
      controlList = ctrl;
      print(controlList);
      notifyListeners();
    }
  }

  getSiteIssues() {
    final box = Hive.box<Status>(siteIssuesBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<Status> siteIs = box.values.toList();
      siteIssues = siteIs;
      print(assetConditionList);
      notifyListeners();
    }
  }

  Future<File> selextImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    return File(pickedImage!.path);
  }

  String convertImageToBase64(String path) {
    File file = File(path);
    print('File is = ' + file.toString());
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    print(fileInBase64);
    return fileInBase64;
  }

  formateDate(DateTime dateTime) {
    // DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(dateTime);
    return formattedDate;
  }

  getDrop1() {
    final box = Hive.box<Drop1DataModel>(drop1DataBoxName);
    if (box.isOpen && box.isNotEmpty) {
      drop1DataList = box.values.toList();
      notifyListeners();
    }
  }

  getDrop2() {
    final box = Hive.box<Drop2DataModel>(drop2DataBoxName);
    if (box.isOpen && box.isNotEmpty) {
      drop2DataList = box.values.toList();
      notifyListeners();
    }
  }

  getDrop3() {
    final box = Hive.box<Drop3DataModel>(drop3DataBoxName);
    if (box.isOpen && box.isNotEmpty) {
      drop3DataList = box.values.toList();
      notifyListeners();
    }
  }

  bool saveCaptureData({
    String? barcode,
    String? serialNo,
    String? comment,
    String? isParent,
    parentBarcode,
    String? owner,
    String? barcodeExtra1,
    String? barcodeExtra2,
    String? dropDown1,
    String? dropDown2,
    String? dropDown3,
    String? manufacturer,
    String? chasisNo,
    String? text1,
    String? text2,
    String? text3,
    String? text4,
    String? text5,
    String? text6,
    String? text7,
    String? text8,
    String? photo1,
    String? photo2,
    String? photo3,
    String? photo4,
    String? mode,
  }) {
    // setB Typusy(true);sh
    if (selectedPrdtSubCat == null) {
      showErrorToast("Asset category cannot be empty");
      return false;
    }
    if (selectedAssetType == null) {
      showErrorToast("Asset type cannot be empty");
      return false;
    }

    if (selectedAssetName == null) {
      showErrorToast('Asset name cannot be empty');
      return false;
    }
    if (selectedContiion == null) {
      showErrorToast("Please select condition");
      return false;
    }
    if (selectedStatus == null) {
      showErrorToast("Please select status");
      return false;
    }
    var slt = assetNameList
        .firstWhere((element) => element.caption == selectedAssetName!.caption);
    // DateTime dateToday = DateTime(DateTime.now().year);
    var dateCaptured = formateDate(DateTime.now());
    var lastUpdated = formateDate(DateTime.now());

    CapturedData cd = CapturedData(
        product: slt.p_Code,
        location: _authService.currentUser!.address,
        barcode: barcode,
        year: "2018",
        dateCaptured: dateCaptured,
        lastUpdated: lastUpdated,
        updatedBy: _authService.currentUser!.name,
        serialNo: serialNo,
        condition: selectedContiion ?? "",
        message: " ",
        siteName: _authService.currentUser!.location,
        siteAddress: _authService.currentUser!.locationSelectedValue,
        costCenter: _authService.currentUser!.costCenterValue,
        latitude: _authService.currentUser!.lat.toString(),
        longitude: _authService.currentUser!.long.toString(),
        mapShape: "",
        comment: comment,
        capturedBy: _authService.currentUser!.name,
        status: selectedStatus,
        client: _authService.currentUser!.client,
        isParent: isParent ?? "Asset is Child Item",
        parentBarcode: parentBarcode,
        person: owner,
        brExtra1: barcodeExtra1,
        brExtra2: barcodeExtra2,
        drop1: drop1SelectedValue ?? "",
        drop2: drop2SelectedValue ?? "",
        drop3: drop3SelectedValue ?? "",
        text1: text1,
        text2: text2,
        text3: text3,
        text4: text4,
        text5: text5,
        text6: text6,
        text7: text7,
        text8: text8,
        photo1: photo1 ?? "",
        photo2: photo2 ?? "",
        photo3: photo3 ?? "",
        photo4: photo4 ?? "",
        mode: " ");
    print(cd.toJson());

    final box = Hive.box<CapturedData>(captuedDataBoxName);
    var dup = box.get(
      cd.barcode,
    );
    if (dup != null) {
      if (dup.barcode == cd.barcode && dup.product == cd.product) {
        box.delete(cd.barcode);
      }
    }

    box.put(cd.barcode, cd);

    Misc misc = Misc(selectedAssetName, selectedPrdtCat, selectedPrdtSubCat,
        manufacturer, chasisNo, selectedAssetType!, cd.product);
    final box2 = Hive.box<Misc>(miscBoxName);
    box2.put(misc.productCode, misc);

    // setBusy(false);
    showToast('Data saved');

    getCapturedData();
    selectedContiion = null;
    selectedStatus = null;
    drop1SelectedValue = null;
    drop2SelectedValue = null;
    drop3SelectedValue = null;
    firstImageSelected = false;
    secondImageSelected = false;
    thirdImageSelected = false;
    fourthImageSelected = false;
    notifyListeners();
    showFirstPage();
    return true;
    // print(box.values.first.toJson());
  }

  showFirstPage() {
    setFirstPage(true);
    setSecondPage(false);
    setThirdPage(false);
  }

  lookUpProductWithCode(String code) {
    selectedAssetName = assetNameList.firstWhere(
        (element) => element.p_Code == code,
        orElse: () => AssetName());
    notifyListeners();
    print(selectedAssetName);
    // if (selectedAssetName == AssetName) {
    //   selectedAssetName == null;
    //   notifyListeners();
    // }

    if (selectedAssetName!.parentCode != null)
      lookUpAssetTypewithParentCode(selectedAssetName!.parentCode!);
    if (selectedAssetType != null && selectedAssetType!.subCat_Code != null)
      lookUpAssetSubCatWithParentCode(selectedAssetType!.subCat_Code!);
    if (selectedPrdtSubCat != null && selectedPrdtSubCat!.cat_Code != null)
      lookUpAssetcategoryWithParentCode(selectedPrdtSubCat!.cat_Code!);
  }

  lookUpAssetTypewithParentCode(String code) {
    selectedAssetType = assetTypeList.firstWhere(
        (element) => element.p_Code == code,
        orElse: () => AssetType());
    notifyListeners();
  }

  lookUpAssetSubCatWithParentCode(String code) {
    selectedPrdtSubCat = subCategoryList.firstWhere(
        (element) => element.p_Code == code,
        orElse: () => AssetSubCategory());
    notifyListeners();
  }

  lookUpAssetcategoryWithParentCode(String code) {
    selectedPrdtCat = categoryList.firstWhere((element) => element.code == code,
        orElse: () => AssetCategory());
    notifyListeners();
  }
}
