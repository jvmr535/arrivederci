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
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.library_books),
            title: Text("Meus roteiros"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Criar roteiro"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Compartilhar roteiro"),
            onTap: () {},
          ),
          Divider(
            color: AppColors.black,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text("Sair"),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(LOGIN_SCREEN);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Sobre"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
