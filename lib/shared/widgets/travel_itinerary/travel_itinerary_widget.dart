import 'package:arrivederci/modules/travel_itinerary_detail/travel_itinerary_detail_page.dart';
import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class TravelItineraryCard extends StatelessWidget {
  final TravelItinerary travelItinerary;

  TravelItineraryCard({Key? key, required this.travelItinerary})
      : super(key: key);

  final apiKey = GOOGLE_API_KEY;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Card(
          child: Container(
            width: size.width * 0.9,
            height: 500,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    this.travelItinerary.name,
                    style: TextStyles.textBlack,
                  ),
                ),
                Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${this.travelItinerary.photo}&key=$apiKey',
                  width: size.width,
                  height: 300,
                ),
                Container(
                  child: Text(this.travelItinerary.description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TravelDetailPage(),
                          ),
                        );
                      },
                      child: Text(
                        "EDITAR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("teste");
                      },
                      child: Text(
                        "EXCLUIR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
