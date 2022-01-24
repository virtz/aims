import 'dart:developer';
import 'dart:io';

import 'package:aims/base_model.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/misc.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:aims/core/services/asset_service.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/core/services/constants.dart';
import 'package:aims/locator.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:aims/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:csv/csv.dart';

class PendingDataViewModel extends BaseModel {
  final AssetService _assetService = locator<AssetService>();
  final AuthService _authService = locator<AuthService>();

  var dataList = <CapturedData>[];
  var filteredList = <CapturedData>[];
  bool isLoading = false;
  bool serverLoading = false;
  bool isSearching = false;
  int? dataCount;

  late List<List<dynamic>> capturedData;

  Misc? misc;

  setIsLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setServerLoading(val) {
    serverLoading = val;
    notifyListeners();
  }

  setIsSearching() {
    isSearching = !isSearching;
    dataCount = null;
    notifyListeners();
  }

  getCapturedData() async {
    final box = Hive.box<CapturedData>(captuedDataBoxName);
    List<CapturedData> data = box.values.toList();
    dataList = data;
    notifyListeners();
    if (dataList.isEmpty) {
      showErrorToast('No captured data');
    }
    notifyListeners();
  }

  search(String value) {
    filteredList = dataList
        .where((element) =>
            element.product!.contains(value) ||
            element.barcode!.contains(value))
        .toList();
    notifyListeners();
    if (filteredList.isEmpty) {
      dataCount = 0;
      notifyListeners();
    }
  }

  sendToServer() async {
    for (var data in dataList) {
      print(data.toJson());
      data.status = "Submitted";
      log(data.toJson().toString());
      setServerLoading(true);

      var duplicateResult = await findCopy(data.barcode);
      if (duplicateResult != null &&
          duplicateResult is SuccessModel &&
          duplicateResult.data == true) {
        showErrorToast('An entity with this barcode already exists');
        setServerLoading(false);
        continue;
      }

      final result = await _assetService.submitDataToServer(data.toJson());

      if (result is ErrorModel) {
        setServerLoading(false);
        showErrorToast(result.error.toString());
      } else if (result is SuccessModel) {
        setServerLoading(false);
        showToast('Data upload successful');
        final box = Hive.box<CapturedData>(captuedDataBoxName);
        box.delete(data.barcode);
        List<CapturedData> data1 = box.values.toList();
        dataList = data1;
        notifyListeners();
      }
      // print(dataList.length);
      // showToast(payload.toString())

    }
  }

  sortCSV() {
    capturedData = List<List<dynamic>>.empty(growable: true);
    List<dynamic> row = List.empty(growable: true);

    row.add("product");
    row.add("capturedBy");
    row.add("location");
    row.add("barcode");
    row.add("year");
    row.add("dateCaptured");
    row.add("lastUpdated");
    row.add("updatedBy");
    row.add("serialNo");
    row.add("condition");
    row.add("message");
    row.add("siteName");
    row.add("siteAddress");
    row.add("costCenter");
    row.add("latitude");
    row.add("longitude");
    row.add("mapShape");
    row.add("comment");
    row.add("status");
    row.add("client");
    row.add("isParent");
    row.add("parentBarcode");
    row.add("person");
    row.add("brExtra1");
    row.add("brExtra2");
    row.add("drop1");
    row.add("drop2");
    row.add("drop3");
    row.add("text1");
    row.add("text2");
    row.add("text2");
    row.add("text3");
    row.add("text4");
    row.add("text5");
    row.add("text6");
    row.add("text7");
    row.add("text8");
    row.add('photo1');
    row.add('photo2');
    row.add("photo3");
    row.add("photo4");
    row.add("mode");

    capturedData.add(row);

    for (var item in dataList) {
      List<dynamic> row = List.empty(growable: true);

      row.add(item.product);
      row.add(item.capturedBy);
      row.add(item.location);
      row.add(item.barcode);
      row.add(item.year);
      row.add(item.dateCaptured);
      row.add(item.lastUpdated);
      row.add(item.updatedBy);
      row.add(item.serialNo);
      row.add(item.condition);
      row.add(item.message);
      row.add(item.siteName);
      row.add(item.siteAddress);
      row.add(item.costCenter);
      row.add(item.latitude);
      row.add(item.longitude);
      row.add(item.mapShape);
      row.add(item.comment);
      row.add(item.status);
      row.add(item.client);
      row.add(item.isParent);
      row.add(item.parentBarcode);
      row.add(item.person);
      row.add(item.brExtra1);
      row.add(item.brExtra2);
      row.add(item.drop1);
      row.add(item.drop2);
      row.add(item.drop3);
      row.add(item.text1);
      row.add(item.text2);
      row.add(item.text2);
      row.add(item.text3);
      row.add(item.text4);
      row.add(item.text5);
      row.add(item.text6);
      row.add(item.text7);
      row.add(item.text8);
      // row.add(item.photo1);
      // row.add(item.photo2);
      // row.add(item.photo3);
      // row.add(item.photo4);
      row.add(item.mode);

      capturedData.add(row);
      notifyListeners();
    }
  }

  saveToCSV() async {
    setIsLoading(true);
    sortCSV();
    if (await Permission.storage.request().isGranted) {
      // String dir =
      //     (await getExternalStorageDirectory())!.path + "data_capture.csv";
      // String file = "$dir";
      // File f = new File(file);

      // String csv = const ListToCsvConverter().convert(capturedData);
      // f.writeAsString(csv);
      // setIsLoading(false);
      // showToast(f.path);
      // showToast('file saved to ${f.path}');

      String folderName = "Aims Csv Files";
      var path = "storage/emulated/0/$folderName";

      Directory dir = await new Directory(path).create();

      String file = dir.path + "/AimsAssets.csv";

      File f = new File(file);

      String csv = const ListToCsvConverter().convert(capturedData);
      f.writeAsString(csv);
      setIsLoading(false);
      showToast(f.path);
      // showToast('file saved to ${f.path}');
    } else {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }

  navigateToEdit(CapturedData data, context) {
    AutoRouter.of(context).push(Edit(data: data));
  }

  findCopy(String? barcode) async {
    var payload = {
      "client": _authService.currentUser!.client,
      "barcode": barcode
    };
    final result = await _assetService.findDuplocate(payload);
    if (result is ErrorModel) {
      // showErrorToast(result.error);
      return ErrorModel(result.error);
    }
    if (result is SuccessModel) {
      var data = result.data['message'];
      return SuccessModel(data);
    }
  }

  getMiscData(String productName) {
    final box = Hive.box<Misc>(miscBoxName);
    if (box.isOpen && box.isNotEmpty) {
      List<Misc> miscList = box.values.toList();

      misc =
          miscList.firstWhere((element) => element.productCode == productName);
      // notifyListeners();
    }
  }
}
