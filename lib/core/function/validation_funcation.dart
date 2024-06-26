import 'package:flutter/material.dart';
import '../resources/validation_manger.dart';

class RagularExpression {
  static RegExp passwordPattern = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[A-Za-z\d!@#$%^&*()_+]{8,}$',
  );

  static RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,}$');
}

class VilidationApp {
  //? validatio any text form filed
  String? validator(String value) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else {
      return null;
    }
  }

//? validation any drop dowan form filed
  String? validateDropdownFormField(dynamic value) {
    if (value == null) {
      return ValidationWords.requiredField;
    }
    return null;
  }

//? validation to password
  String? validatorPassword(String value, BuildContext context) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (value.length < 6) {
      return ValidationWords.passwordLength;
    }
    // else if (!RagularExpression.passwordPattern.hasMatch(value)) {
    //   return ValidationWords.ensurePasssword;
    // }
    return null;
  }

//? vilidation for phone number
  String? validatorPhone(String value) {
    if (value.isEmpty) {
      return ValidationWords.requiredField;
    } else if (!RagularExpression.phoneRegex.hasMatch(value)) {
      return ValidationWords.phoneNumber;
    }
    return null;
  }
}
