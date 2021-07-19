import 'dart:ui';

import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TravelDetailPage extends StatelessWidget {
  final TravelItinerary edit;
  
  const TravelDetailPage({ Key? key, required this.edit }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arrivederci"),
      ),
      body: Center(
        child: Card(
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.7,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    //this.place.name,
                    "Torre de Eiffel",
                    textAlign: TextAlign.center,
                    style: TextStyles.textBlack,
                  ),
                ),
                Image.network(
                  //'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${this.place.photo}&key=$apiKey',
                  'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/aa/fc.jpg',
                  width: size.width,
                  height: size.height * 0.25,
                  fit: BoxFit.fitWidth,
                ),
                Row(
                  children: [
                    Container(
                      
                      
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        //"Avaliação: ${this.place.rating}"
                        "Avaliação: 5.0",
                        style: TextStyles.textDetails,
                      )
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("CONFIRMAR_teste");
                      },
                      child: Text(
                        "CONFIRMAR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("EXCLUIR_teste");
                      },
                      child: Text(
                        "EXCLUIR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppFooter.footer,
    );
  }
}