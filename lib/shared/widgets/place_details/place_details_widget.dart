import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';

class PlaceDetails extends StatefulWidget {
  final Place place;
  final String travelItineraryUid;
  const PlaceDetails(
      {Key? key, required this.place, required this.travelItineraryUid})
      : super(key: key);

  @override
  _PlaceDetailsState createState() =>
      _PlaceDetailsState(travelItineraryUid, place);
}

class _PlaceDetailsState extends State<PlaceDetails> {
  final travelItineraryUid;
  final Place place;
  _PlaceDetailsState(this.travelItineraryUid, this.place);
  final _dataBase = FirebaseDatabase.instance.reference();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final apiKey = GOOGLE_API_KEY;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(this.widget.place.address),
            SizedBox(
              height: 15,
            ),
            Image.network(
              '$GOOGLE_API_IMAGE${this.widget.place.photo}&key=$apiKey',
            ),
            SizedBox(
              height: 15,
            ),
            Text("Avaliação: ${this.widget.place.rating}"),
            TextButton(
              onPressed: () {
                _dataBase
                    .child(
                        "users/${_auth.currentUser!.uid}/travelItineraries/$travelItineraryUid/places/${place.uid}")
                    .remove();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("O local foi excluido"),
                  ),
                );
                Navigator.of(context).pop();
              },
              child: Text(
                "Remover",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
