import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: FractionalOffset.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed(SETTINGS_SCREEN);
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              // width: 83,
              child: Text(
                auth.currentUser!.displayName!,
                style: TextStyles.textProfile,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 170,
              child: Text(
                auth.currentUser!.email!,
                style: TextStyles.textContact,
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(HOME_SCREEN);
            },
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text("Meus roteiros"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(MY_TRAVEL_ITINERARY);
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Criar roteiro"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(CREATE_TRAVEL_ITINERARY);
            },
          ),
          Divider(
            color: AppColors.black,
            height: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text("Sair"),
            onTap: () {
              try {
                auth.signOut();
                Navigator.pop(context);
                Navigator.of(context).pushNamed(LOGIN_SCREEN);
              } catch (e) {
                print("Falha ao realizar signout");
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Sobre"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(ABOUT_SCREEN);
            },
          )
        ],
      ),
    );
  }
}
