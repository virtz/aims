

import 'package:aims/base_model.dart';
import 'package:aims/core/models/user.dart';
import 'package:aims/core/services/auth_service.dart';
import 'package:aims/locator.dart';

class WelcomeViewModel extends BaseModel{
final AuthService _authService = locator<AuthService>();

  User? get currentUser => _authService.currentUser;
}