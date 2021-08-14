import 'dart:convert';

import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/add_goal_card/add_goal_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LocationSearch extends StatefulWidget {
  @override
  _LocationSearchState createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  String _location = "";
  final apiKey = GOOGLE_API_KEY;

  Future searchLocalization() async {
    try {
      final response = await http.get(Uri.parse(
          "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=${_location}&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours&key=$apiKey"));

      if (jsonDecode(response.body)['status'] != "ZERO_RESULTS") {
        return Place(
          name: jsonDecode(response.body)['candidates'][0]['name'],
          address: jsonDecode(response.body)['candidates'][0]
              ['formatted_address'],
          rating:
              jsonDecode(response.body)['candidates'][0]['rating'].toString(),
          photo: jsonDecode(response.body)['candidates'][0]['photos'][0]
              ['photo_reference'],
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao buscar local"),
        ),
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
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80.0),
                    Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(
                            () {
                              _location = value;
                            },
                          );
                        },
                        decoration: InputDecoration(
                          labelText: 'Buscar localização',
                          border: OutlineInputBorder(),
                        ),
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
                          try {
                            final place = await searchLocalization();
                            if (place != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddGoalCard(place: place),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Erro ao buscar local"),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao buscar local"),
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
            ),
          )
        ],
      ),
    );
  }
}
