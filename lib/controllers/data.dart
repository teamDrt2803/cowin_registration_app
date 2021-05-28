import 'dart:convert';

import 'package:cowin_registration_app/constants/strings.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cowin_registration_app/utility/extensions.dart';

class DataController extends GetxController {
  var txnId = ''.obs;
  var loggedIn = false.obs;
  var otpSent = false.obs;
  Future<void> generateOtp(String mobile) async {
    var body = {
      'mobile': mobile,
    };
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var response = await http.post(
        Uri.parse(GENERATEOTP),
        body: jsonEncode(body),
        headers: headers,
      );
      if (response.statusCode == 200) {
        txnId.value = Map.from(jsonDecode(response.body))['txnId'];
        otpSent.value = true;
      }
    } catch (e) {
      otpSent.value = false;
      print('Error occurres: $e');
    }
  }

  Future<void> validateOtp(String code) async {
    var body = {
      'otp': code.encrypt,
      'txnId': txnId.value,
    };
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    try {
      var response = await http.post(
        VALIDATEOTP.toUri,
        body: jsonEncode(body),
        headers: headers,
      );
      print(response.body);
      if (response.statusCode == 200) {
        loggedIn.value = true;
      }
    } catch (e) {
      print('Error occurres: $e');
      loggedIn.value = false;
    }
  }

  Future<void> getsessionsbypin() async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      var response = await http.get(SESSIONBYPIN.toUri, headers: headers);
      print(response.body);
    } catch (e) {}
  }
}
