class ValidationMessages {
    static const String invalidName = 'Invalid name';
  static const String nameCharacterLength = 'Name must be at least 3 characters long';
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Invalid email';
  static const String invalidEmailMessage = 'Invalid email address';
  static const String passwordRequired = 'Password is required';
  static const String invalidPassword = 'Invalid password';
  static const String passwordConfirmRequired = 'Please confirm your password';
  static const String invalidPasswordLength = 'Password must be at least 6 characters long';
  static const String invalidPasswordDoNotMatch = 'Passwords do not match';
}

class NotificationMessages {
  static const authFailed = "Invalid email or password provided";
  static const authSuccess = "Authentication successful";
  static const authError = "An error occurred while authenticating";
  static const userExists = "User already exists";
  static const userDoesNotExist = "User does not exist";
  static const resetPasswordEmailSent = "Password reset email sent";
  static const passwordResetError = "An error occurred while resetting password";
  static const passwordResetSuccess = "Password reset successful";
}