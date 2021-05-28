import 'dart:convert';

import 'package:crypto/crypto.dart';

extension StringExtension on String? {
  bool get isEmail {
    var reg = RegExp(r'^(?=.{6,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)+$')
        .hasMatch(this!);
    return reg;
  }

  String? get isPasswordValid {
    if (this!.length < 8) {
      return 'Password should not be less than 8 characters';
    }
    if (!this!.contains(RegExp(r"[a-z]"))) {
      return 'Password should contain atleast 1 lowercase letter';
    }
    if (!this!.contains(RegExp(r"[A-Z]"))) {
      return 'Password should contain atleast 1 uppercase letter';
    }
    if (!this!.contains(RegExp(r"[0-9]"))) {
      return 'Password should contain atleast 1 digit';
    }
    if (!this!.contains(RegExp(r'[!@#$%^&£*(),.?":{}|<>]'))) {
      return 'Password should contain atleast 1 special character';
    }
    return null;
  }

  String get encrypt => sha256.convert(utf8.encode(this!)).toString();

  Uri get toUri => Uri.parse(this!);
}
