import 'dart:convert';

import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/add_goal_card/add_goal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationSearch extends StatefulWidget {
  const LocationSearch({Key? key}) : super(key: key);

  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  final searchTextController = new TextEditingController();

  final apiKey = GOOGLE_API_KEY;

  Future searchLocalization() async {
    final response = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${searchTextController.text}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours&key=$apiKey"));

    if (jsonDecode(response.body)['status'] != "ZERO_RESULTS") {
      final name = jsonDecode(response.body)['candidates'][0]['name'];
      final photo = jsonDecode(response.body)['candidates'][0]['photos'][0]
          ['photo_reference'];
      final rating =
          jsonDecode(response.body)['candidates'][0]['rating'].toString();
      final address =
          jsonDecode(response.body)['candidates'][0]['formatted_address'];

      return Place(name: name, address: address, rating: rating, photo: photo);
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Lugar não encontrado'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                      'O lugar que você pesquisou não foi encontrado na busca do google maps'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Tudo bem!',
                  style: TextStyle(color: AppColors.primary),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Buscar localização',
                        border: OutlineInputBorder(),
                      ),
                      controller: searchTextController,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: size.width * 0.8,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primary, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () async {
                        final place = await searchLocalization();
                        if (place != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddGoalCard(place: place),
                            ),
                          );
                        }
                      },
                      child: Text('Buscar'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
