import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:aims/core/services/asset_service.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';
import 'package:aims/utils/utils.dart';

import '../../../../base_model.dart';

class SubmittedDataViewModel extends BaseModel {
  final AssetService _assetService = locator<AssetService>();
  final AuthService _authService = locator<AuthService>();

  var dataList = <CapturedData>[];

  getSubmitedData() async {
    setBusy(true);
    var payload = {
      "client": _authService.currentUser!.client,
      "user": _authService.currentUser!.name,
      "location": _authService.currentUser!.address
    };
    final result = await _assetService.fetchFromDataCapture(payload);
    if (result is ErrorModel) {
      setBusy(false);
      return showErrorToast(result.error);
    }
    if (result is SuccessModel) {
      setBusy(false);
      List<CapturedData> data = result.data;
      dataList =
          data.where((element) => element.status == "Submitted").toList();

      notifyListeners();
    }
  }
}
