import 'package:arrivederci/shared/widgets/location_search/location_search_widget.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
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
      body: LocationSearch(),
      drawer: NavigationDrawer(),

      bottomNavigationBar: AppFooter.footer,
    );
  }
}
