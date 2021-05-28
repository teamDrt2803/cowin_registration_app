import 'package:cowin_registration_app/controllers/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  DataController _dataController = Get.find();
  var mobileController = TextEditingController();
  var otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: mobileController,
              maxLength: 10,
              autofillHints: [AutofillHints.telephoneNumber],
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone',
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              onEditingComplete: () {
                _dataController.generateOtp(mobileController.text);
              },
            ),
            Obx(
              () => Visibility(
                visible: _dataController.otpSent.value,
                child: TextFormField(
                    controller: otpController,
                    maxLength: 10,
                    autofillHints: [AutofillHints.oneTimeCode],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    onEditingComplete: () {}),
              ),
            ),
            TextButton(
                onPressed: () {
                  _dataController.validateOtp(otpController.text);
                },
                child: Text('Verify'))
          ],
        ),
      ),
    );
  }
}
