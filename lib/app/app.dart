import 'package:cowin_registration_app/controllers/data.dart';
import 'package:cowin_registration_app/views/home.dart';
import 'package:cowin_registration_app/views/signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  DataController _dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => _dataController.loggedIn.value ? HomeScreen() : SignIn());
  }
}
