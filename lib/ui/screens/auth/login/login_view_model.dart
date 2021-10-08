import 'dart:convert';

import 'package:aims/base_model.dart';
import 'package:aims/core/models/client.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/success._model.dart';

import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:aims/utils/utils.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();
  var clientList = <ClientModel>[];
  String? selectedClient;
  bool isBusy = false;
  bool? loginSuccessful;

  setBusy(val) {
    isBusy = val;
    notifyListeners();
  }

  setLoginSuccess(val) {
    loginSuccessful = val;
    notifyListeners();
  }

  getClientList() async {
    final result = await _authService.getClientList();
    if (result is ErrorModel) {
      showErrorToast(result.error);
    } else {
      var data = result.data;
      List<ClientModel> clients =
          List.from(data.map((item) => ClientModel.fromJson(item)));
      clientList = clients.where((element)=>element.status=="Active").toList();
      notifyListeners();
    }
  }

  String? fetchClientfromList(String name) {
    var result = clientList.firstWhere((element) => element.clientName == name);

    return result.clientCode;
  }

  login(String name, password, context) async {
    if (selectedClient == null) {
      showErrorToast('Select client');
      return;
    }
    setBusy(true);
    var payload = {"name": name, "password": password};
    final result = await _authService.login(payload);
    if (result is ErrorModel) {
      setBusy(false);
      showErrorToast(result.error);
      setLoginSuccess(false);
    }
    if (result is SuccessModel) {
      var client = fetchClientfromList(selectedClient!);
      _authService.currentUser!.name = name;
      _authService.currentUser!.password = password;
      _authService.currentUser!.client = client;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var s = json.encode(_authService.currentUser);
      await prefs.setString('profile', s);

      setBusy(false);

      showToast('Login Successful');
      setLoginSuccess(true);
      AutoRouter.of(context)
          .pushAndPopUntil(const Start(), predicate: (route) => false);
    }
  }
}
