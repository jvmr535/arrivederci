import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CreateTravelItinerary extends StatefulWidget {
  @override
  _CreateTravelItineraryState createState() => _CreateTravelItineraryState();
}

class _CreateTravelItineraryState extends State<CreateTravelItinerary> {
  final auth = FirebaseAuth.instance;
  String _travelItineraryName = "";
  String _travelItineraryDescription = "";

  Future setTravelItinerary(
      String travelItineraryName, String travelItineraryDescription) async {
    try {
      await FirebaseDatabase.instance
          .reference()
          .child("users/${auth.currentUser!.uid}/travelItineraries/")
          .push()
          .set(
        {
          "name": travelItineraryName,
          "description": travelItineraryDescription
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Roteiro criado com sucesso!"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao criar roteiro"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Criar roteiro"),
      ),
      body: Stack(children: [
        Center(
          child: Container(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Criar roteiro",
                    style: TextStyles.pageTitle,
                  ),
                  SizedBox(height: 80.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _travelItineraryName = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Nome do roteiro',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _travelItineraryDescription = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Descrição do roteiro',
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
                        await setTravelItinerary(
                            _travelItineraryName, _travelItineraryDescription);
                      },
                      child: Text('Criar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
      bottomNavigationBar: AppFooter(),
    );
  }
}
