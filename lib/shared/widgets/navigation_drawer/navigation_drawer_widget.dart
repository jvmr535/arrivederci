import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.home_filled,
              // color: AppColors.primary,
            ),
            title: Text(
              "Home",
              // style: TextStyle(
              //   color: AppColors.primary,
              // ),
            ),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.of(context).pushNamed(HOME_SCREEN);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.library_books,
              // color: AppColors.primary,
            ),
            title: Text(
              "Meus roteiros",
              // style: TextStyle(
              //   color: AppColors.primary,
              // ),
            ),
            onTap: () {
              Navigator.pop(context);
              // Navigator.of(context).pushNamed();
            },
          ),
        ],
      ),
    );
  }
}
