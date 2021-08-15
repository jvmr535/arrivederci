import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/widgets/travel_itinerary/travel_itinerary_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MyTravelItineraries extends StatefulWidget {
  @override
  _MyTravelItinerariesState createState() => _MyTravelItinerariesState();
}

class _MyTravelItinerariesState extends State<MyTravelItineraries> {
  final _dataBase = FirebaseDatabase.instance.reference();
  final _auth = FirebaseAuth.instance;
  List<TravelItinerary> _travelItineraries = [];

  void _getTravelItineraries() {
    _dataBase
        .child("users/${_auth.currentUser!.uid}/travelItineraries")
        .onValue
        .listen(
      (event) {
        final response = event.snapshot.value;
        for (final item in response.keys) {
          setState(
            () {
              _travelItineraries = [
                ..._travelItineraries,
                TravelItinerary(
                    uid: item,
                    name: response[item]["name"],
                    description: response[item]["description"]),
              ];
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getTravelItineraries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Meus roteiros"),
      ),
      body: ListView.builder(
        itemCount: _travelItineraries.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: TravelItineraryCard(
                  travelItinerary: _travelItineraries[index],
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
