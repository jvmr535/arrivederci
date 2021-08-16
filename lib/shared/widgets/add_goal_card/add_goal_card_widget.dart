import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/models/place_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:arrivederci/shared/widgets/select_itinerary_list/select_itinerary_list_widget.dart';
import 'package:flutter/material.dart';

class AddGoalCard extends StatelessWidget {
  final Place place;

  AddGoalCard({Key? key, required this.place}) : super(key: key);
  final apiKey = GOOGLE_API_KEY;

  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Selecione o roteiro'),
          content: SelectItineraryList(
            place: place,
          ),
        ),
      );
    }

    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Arrivederci"),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    this.place.name,
                    style: TextStyles.textBlack,
                  ),
                ),
                ListTile(
                  subtitle: Text(this.place.address),
                ),
                Image.network(
                  '$GOOGLE_API_IMAGE${this.place.photo}&key=$apiKey',
                  width: size.width,
                  height: size.height * 0.4,
                ),
                Text("Avaliação: ${this.place.rating}"),
                TextButton(
                  onPressed: () {
                    _showDialog();
                  },
                  child: Text(
                    "+ ADICIONAR AO ROTEIRO",
                    style: TextStyle(color: AppColors.primary),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
