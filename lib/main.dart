import 'package:flutter/material.dart';
import 'Application.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
  ));
  runApp(new Application());
}
