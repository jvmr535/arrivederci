import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 70,
              child: CircleAvatar(
                radius: (25),
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      'https://imagem.natelinha.uol.com.br/grande/cdd428453207e15b76ac92aefde0b237.jpg'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 83,
              child: Text(
                "Aligator",
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
                "contato@eotchan.com.br",
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
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Compartilhar roteiro"),
            onTap: () {},
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
              Navigator.pop(context);
              Navigator.of(context).pushNamed(LOGIN_SCREEN);
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
