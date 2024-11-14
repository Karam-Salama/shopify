// validation.dart

import 'package:email_validator/email_validator.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  /// Validates the email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates the password to ensure it meets specific criteria.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length <= 8) {
      return 'Password cannot be less than 8 characters';
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    return null;
  }
}
