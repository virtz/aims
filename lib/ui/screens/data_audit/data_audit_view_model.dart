import 'dart:developer';

import 'package:aims/base_model.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:aims/core/services/asset_service.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';
// import 'package:aims/utils/utils.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataAuditViewModel extends BaseModel {
  final AssetService _assetService = locator<AssetService>();
  final AuthService _authService = locator<AuthService>();
  CapturedData cd = CapturedData();
  bool productExists = false;
  bool locationMatches = false;

  Future<String> scanParentCode() async {
    try {
      final result = await BarcodeScanner.scan();

      return result.rawContent;
    } on PlatformException catch (e) {
      return e.toString();
    }
  }

  dataAudit(String? barcode) async {
    setBusy(true);
    var payload = {"barcode": barcode ?? ""};
    final result = await _assetService.dataAuditSertvice(payload);
    if (result is ErrorModel) {
      setBusy(false);
      if (result.error.toString() == "Data not found") {
        productExists = false;
        notifyListeners();
        log(productExists.toString());
      }
      // showErrorToast(result.error.toString());
    }
    if (result is SuccessModel) {
      productExists = true;
      notifyListeners();
      setBusy(false);
      cd = result.data;
      log(cd.toString());
      notifyListeners();
      if (cd.location == _authService.currentUser!.location) {
        locationMatches = true;
        notifyListeners();
      }
      locationMatches = false;
      notifyListeners();
      print(locationMatches);
    }
  }

  Future<T> showDialogue<T>(BuildContext context, child) async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return child;
      },
    );
    return result;
  }
}
