import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
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
        title: Text("Home"),
      ),
      drawer: NavigationDrawer(),

      bottomNavigationBar: AppFooter.footer,
    );
  }
}
