import 'package:flutter/material.dart';
import 'package:arrivederci/shared/Constants.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: AppColors.primary,
        height: 50.0,
        child: Container(
          alignment: FractionalOffset.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text("Sobre", style: TextStyles.textWhiteUnderlined),
                onTap: () {
                  Navigator.of(context).pushNamed(ABOUT_SCREEN);
                },
              ),
              Text(" - Arrivederci © 2021", style: TextStyles.textWhite),
            ],
          ),
        ),
      ),
    );
  }
}
