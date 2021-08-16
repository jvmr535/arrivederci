import 'package:arrivederci/modules/travel_itinerary_detail/travel_itinerary_detail_page.dart';
import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TravelItineraryCard extends StatelessWidget {
  final TravelItinerary travelItinerary;

  TravelItineraryCard({Key? key, required this.travelItinerary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Container(
              child: Text(
                this.travelItinerary.name,
                style: TextStyles.textBlack,
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Text(this.travelItinerary.description),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TravelDetailPage(
                              travelItineraryUid: travelItinerary.uid,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        "ACESSAR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        print("teste");
                      },
                      child: Text(
                        "EXCLUIR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
