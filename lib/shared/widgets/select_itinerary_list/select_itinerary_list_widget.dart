import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SelectItineraryList extends StatefulWidget {
  final Place place;
  const SelectItineraryList({Key? key, required this.place}) : super(key: key);
  @override
  _SelectItineraryListState createState() => _SelectItineraryListState(place);
}

class _SelectItineraryListState extends State<SelectItineraryList> {
  final Place place;
  _SelectItineraryListState(this.place);

  List<TravelItinerary> _travelItineraries = [];
  final _dataBase = FirebaseDatabase.instance.reference();
  final _auth = FirebaseAuth.instance;

  void _getTravelItineraries() {
    _dataBase
        .child("users/${_auth.currentUser!.uid}/travelItineraries")
        .onValue
        .listen((event) {
      if (this.mounted) {
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
      }
    });
  }

  void _setOnTravelItinerary(Place place, String travelItineraryUid) {
    FirebaseDatabase.instance
        .reference()
        .child(
            "users/${_auth.currentUser!.uid}/travelItineraries/$travelItineraryUid/places")
        .push()
        .set(
      {
        "name": place.name,
        "address": place.address,
        "rating": place.rating,
        "photo": place.photo,
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
    return Container(
      width: 100,
      height: 200,
      child: ListView.builder(
        itemCount: _travelItineraries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_travelItineraries[index].name),
            onTap: () {
              _setOnTravelItinerary(place, _travelItineraries[index].uid);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("O local foi adicionado ao roteiro"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
