import 'dart:convert';

import 'package:aims/core/models/control.dart';
import 'package:aims/core/models/cost_center_model.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/location_model.dart';
import 'package:aims/core/models/parameter_setup.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:aims/core/models/user.dart';
import 'package:aims/core/services/constants.dart';
import 'package:aims/core/services/index.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:aims/utils/paths.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User? currentUser = User();
  late AuthModel _token;
  AuthModel get token => _token;

  alreadyLoggedIn(context) async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    var d = prefs.getString('profile');
    User user = User.fromJson(json.decode(d!));
    currentUser = user;
    print(currentUser!.name);
    var t = prefs.getString('token');
    final AuthModel auth = AuthModel.fromJson(t!);
    print("TOKEN AGBA::::::::: ${auth.token}");
    _token = auth;
    AutoRouter.of(context)
        .pushAndPopUntil(const Start(), predicate: (route) => false);
  }

  getClientList() async {
    try {
      final result = await http.get(Paths.GET_CLIENTLIST);

      if (result is ErrorModel) {
        return ErrorModel(result.error);
      } else if (result is SuccessModel) {
        return SuccessModel(result.data);
      }
    } catch (e) {
      print(e.toString());
      return ErrorModel(e);
    }
  }

  login(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.LOG_IN, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      final AuthModel auth = AuthModel.fromJson(result.data['token']);
      print("Toekn:::::${auth.token}");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', auth.token);
      var s = json.encode(currentUser);
      await prefs.setString('profile', s);
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getCostCenters(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_COST_CENTER, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<ConstCenter> costcenters =
          List.from(data.map((item) => ConstCenter.fromJson(item)));
      var costCenter = Hive.box<ConstCenter>(costcenterBoxName);
      // costCenter.addAll(costcenters);
      for (var costCt in costcenters) {
        costCenter.put(costCt.id, costCt);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getLocation(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_LOCATION, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<LocationModel> locatiopns =
          List.from(data.map((item) => LocationModel.fromJson(item)));
      var location = Hive.box<LocationModel>(locationBoxName);
      // location.addAll(locatiopns);
      for (var lc in locatiopns) {
        location.put(lc.ID, lc);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getParameters(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_PARAMETERS, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<ParameterSetUp> parameters =
          List.from(data.map((item) => ParameterSetUp.fromJson(item)));
      var parameter = Hive.box<ParameterSetUp>(parameterBoxName);
      parameter.addAll(parameters);
      // for (var prm in parameters){
      //   parameter.put(prm., value)
      // }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getControls(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_CONTROL, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<Control> controls =
          List.from(data.map((item) => Control.fromJson(item)));
      var control = Hive.box<Control>(controlBoxName);
      control.addAll(controls);
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }
}
