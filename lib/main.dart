import 'package:cowin_registration_app/app/app.dart';
import 'package:cowin_registration_app/controllers/data.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder.put(() => DataController()),
      debugShowCheckedModeBanner: false,
      title: 'Cowin Registration',
      home: App(),
    );
  }
}
