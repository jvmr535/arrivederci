import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/widgets/navigation_drawer/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      drawer: NavigationDrawer(),
      
      bottomNavigationBar: AppFooter.footer,
    );
  }
}