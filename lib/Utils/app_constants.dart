import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Widgets/stepper_widget.dart';

class AppConstants {
  static List<StepperWidget> stepperWidgets = [];

  //Todo for password validation
  static String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    // Check password length
    if (value.length < 8) {
      return 'At least 8 characters long';
    }
    // Check for at least one number
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'At least one number';
    }
    // Check for at least one special character
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'At least one special character';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must include at least one capital letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must include at least one small letter';
    }

    return null; // Password is valid
  }

  //Todo for email validation
  static String? emailValidation(String? value) {
    bool isValidEmail(String value) {
      final emailRegex = RegExp(
          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
          caseSensitive: false);

      return emailRegex.hasMatch(value);
    }

    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    // Custom email validation logic
    if (!isValidEmail(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  //TODO name validation
  static String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(value)) {
      return "Only letters, spaces, and hyphens are allowed in first name";
    }
    return null;
  }

  static errorToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static successToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

extension EmptySpace on num {
  SizedBox get ht => SizedBox(height: toDouble().h);
  SizedBox get wd => SizedBox(width: toDouble().w);
}
