import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/widgets/travel_itinerary/travel_itinerary_widget.dart';
import 'package:flutter/material.dart';

class MyTravelItineraries extends StatefulWidget {
  const MyTravelItineraries({Key? key}) : super(key: key);

  @override
  _MyTravelItinerariesState createState() => _MyTravelItinerariesState();
}

class _MyTravelItinerariesState extends State<MyTravelItineraries> {
  List travelIntinerariesData() {
    TravelItinerary ti1 = TravelItinerary(
        name: "Viagem para a França",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        places: []);
    TravelItinerary ti2 = TravelItinerary(
        name: "Viagem para a Italia",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
        places: []);

    List data = [ti1, ti2];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    final travelItinerary = travelIntinerariesData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Meus roteiros"),
      ),
      body: ListView.builder(
        itemCount: travelItinerary.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: TravelItineraryCard(
                  travelItinerary: travelItinerary[index],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
