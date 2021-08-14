import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
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
        backgroundColor: AppColors.primary,
        title: Text("Arrivederci"),
      ),
      body: Center(
        child: Card(
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
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
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
