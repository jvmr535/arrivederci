import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/widgets/add_goal_card/add_goal_card_widget.dart';
import 'package:arrivederci/shared/widgets/location_search/location_search_widget.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:arrivederci/shared/widgets/navigation_drawer/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arrivederci"),
      ),
      drawer: NavigationDrawer(),
      body: LocationSearch(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: AppColors.primary,
          height: 50.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sobre - Arrivederci © 2021", style: TextStyles.textWhite),
            ],
          ),
        ),
      ),
    );
  }
}
