import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:arrivederci/shared/themes/app_images.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/Constants.dart';

import 'package:flutter/material.dart';
import 'dart:async';
class Splash extends StatelessWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), (){
      // Navigator.pop(context);
      Navigator.of(context).pushNamed(HOME_SCREEN);

    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(children: [
        Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    AppImages.logo,
                    width: size.width * 0.7,
                ),
                Text(
                  "Arrivederci",
                  style: TextStyles.splashTitle,
                )
              ],
            ),
          )
        ,)
      ],),
    );
  }
}