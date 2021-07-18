import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:arrivederci/shared/widgets/navigation_drawer/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class AddGoalCard extends StatelessWidget {
  final Place place;

  AddGoalCard({Key? key, required this.place}) : super(key: key);
  final apiKey = GOOGLE_API_KEY;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arrivederci"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0),
              )
            ],
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  this.place.name,
                  style: TextStyles.textBlack,
                ),
              ),
              ListTile(
                subtitle: Text(this.place.address),
              ),
              Image.network(
                'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${this.place.photo}&key=$apiKey',
                width: size.width,
                height: size.height * 0.4,
              ),
              Text("Avaliação: ${this.place.rating}"),
              TextButton(
                onPressed: () {
                  print("teste");
                },
                child: Text(
                  "+ ADICIONAR AO ROTEIRO",
                  style: TextStyle(color: AppColors.primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
