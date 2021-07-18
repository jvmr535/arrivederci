import 'package:arrivederci/modules/forgot_password/forgot_password_page.dart';
import 'package:arrivederci/modules/splash/splash_page.dart';
import 'package:arrivederci/modules/home/home_page.dart';
import 'package:arrivederci/modules/settings/settings_page.dart';
import 'package:arrivederci/modules/login/login_page.dart';
import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:arrivederci/modules/register/register_page.dart';
import 'modules/about/about_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arrivederci',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: AppColors.primary,
      ),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => Home(),
        LOGIN_SCREEN: (BuildContext context) => Login(),
        REGISTER_SCREEN: (BuildContext context) => Register(),
        FORGOT_PASSWORD_SCREEN: (BuildContext context) => ForgotPassword(),
        ABOUT_SCREEN: (BuildContext context) => About(),
      },
    );
  }
}
