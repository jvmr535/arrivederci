import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class CreateTravelItinerary extends StatefulWidget {
  const CreateTravelItinerary({Key? key}) : super(key: key);

  @override
  _CreateTravelItineraryState createState() => _CreateTravelItineraryState();
}

class _CreateTravelItineraryState extends State<CreateTravelItinerary> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar roteiro"),
      ),
      body: Stack(children: [
        Center(
          child: Container(
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
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome do roteiro',
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
                    onPressed: () {},
                    child: Text('Criar'),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
