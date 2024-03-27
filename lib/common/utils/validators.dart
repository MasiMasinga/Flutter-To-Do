import 'package:to_do/common/constants/app_messages.dart';

class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.invalidName;
    }
    if (value.length < 3) {
      return ValidationMessages.nameCharacterLength;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.invalidEmail;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return ValidationMessages.invalidEmailMessage;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.passwordRequired;
    } else if (value.length < 6) {
      return ValidationMessages.invalidPasswordLength;
    }
    return null;
  }

  static String? confirmPasswordValidator(
      String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return ValidationMessages.passwordConfirmRequired;
    }
    if (password != confirmPassword) {
      return ValidationMessages.invalidPasswordDoNotMatch;
    }
    return null;
  }
}
