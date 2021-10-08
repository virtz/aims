import 'package:aims/base_model.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';
import 'package:aims/router/app_router.gr.dart';
// import 'package:aims/ui/screens/auth/login/login.dart';
import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  moveToNextPage(context) async {
    assert(context != null);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token != ' ') {
      _authService.alreadyLoggedIn(context);
    }
    AutoRouter.of(context).replace(const Login());
  }
}
