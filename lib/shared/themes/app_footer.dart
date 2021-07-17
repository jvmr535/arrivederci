import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppFooter{
  static final footer = Container(
    color: AppColors.primary,
    height: 50.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sobre - Arrivederci © 2021",
          style: TextStyles.textWhite
        ),
      ],
    ),
  );
}