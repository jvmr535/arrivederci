import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/widgets/place_details/place_details_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TravelDetailPage extends StatefulWidget {
  final String? travelItineraryUid;
  const TravelDetailPage({Key? key, this.travelItineraryUid}) : super(key: key);

  @override
  _TravelDetailPageState createState() =>
      _TravelDetailPageState(travelItineraryUid!);
}

class _TravelDetailPageState extends State<TravelDetailPage> {
  final String travelItineraryUid;
  _TravelDetailPageState(this.travelItineraryUid);

  final _dataBase = FirebaseDatabase.instance.reference();
  final _auth = FirebaseAuth.instance;
  List<Place> _places = [];
  TravelItinerary _travelItinerary =
      TravelItinerary(uid: "", name: "", description: "", places: []);

  void _getTravelItineraryData() {
    _dataBase
        .child(
            "users/${_auth.currentUser!.uid}/travelItineraries/$travelItineraryUid")
        .onValue
        .listen((event) {
      if (mounted) {
        final response = event.snapshot.value;
        setState(
          () {
            _travelItinerary.uid = travelItineraryUid;
            _travelItinerary.name = response["name"];
          },
        );
        List<Place> places = [];
        for (final item in response["places"].keys) {
          places.add(
            Place(
                uid: item,
                name: response["places"][item]["name"],
                address: response["places"][item]["address"],
                rating: response["places"][item]["rating"],
                photo: response["places"][item]["photo"]),
          );
        }
        setState(() {
          _places = places;
        });
        setState(() {
          _travelItinerary.places = _places;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getTravelItineraryData();
  }

  @override
  Widget build(BuildContext context) {
    void _showDetailDialog(Place place, String travelItineraryUid) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(place.name),
          content: PlaceDetails(
            place: place,
            travelItineraryUid: travelItineraryUid,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(_travelItinerary.name),
      ),
      body: ListView.builder(
        itemCount: _travelItinerary.places!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(_travelItinerary.places![index].name),
                onTap: () {
                  _showDetailDialog(
                      _travelItinerary.places![index], _travelItinerary.uid);
                },
              ),
              Divider(
                color: AppColors.primary,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
