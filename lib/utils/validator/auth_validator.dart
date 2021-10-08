import 'package:aims/utils/validator/index.dart';

class AuthValidator extends Validators {
  String? name(value) {
    return isEmpty(value) ?? limit(value, min: 4);
  }

  String? firstName(value) {
    return isEmptyFirstName(value) ?? limit(value, min: 2);
  }

  String? lastName(value) {
    return isEmptyLastName(value) ?? limit(value, min: 2);
  }

  String? mobileNumber(value) {
    return numberValidator(value) ??
        limit(value, min: 2) ??
        isEmptyMobileNumber(value);
  }

  String? optValidator(value) {
    return isEmpty(value) ?? numberValidator(value);
  }

  String? regNumber(value) {
    return numberValidator(value) ??
        limit(value, min: 2) ??
        isEmptyRegNumber(value);
  }

  String? userName(value) {
    return isEmptyUserName(value) ?? limit(value, min: 2);
  }

  String? email(value) {
    return isEmptyEmail(value) ?? isEmail(value);
  }

  String? otp(value) {
    return isEmpty(value) ?? isNumeric(value) ?? limit(value, min: 2);
  }

  String? password(value) {
    return isEmptyPassword(value) ?? limit(value, min: 8);
  }

  String? confirmPassword(value, confirmValue, key) {
    return isEmptyPassword(value) ?? confirm(value, confirmValue, key);
  }
}
