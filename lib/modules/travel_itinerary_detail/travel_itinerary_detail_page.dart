import 'package:arrivederci/shared/models/travel_itinerary_detail_model.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TravelDetailPage extends StatelessWidget {
  //final TravelItinerary edit;
  
  const TravelDetailPage({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arrivederci"),
      ),
      body: Center(
        child: Card(
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.7,
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                ListTile(
                  title: Text(
                    "this.place.name",
                    style: TextStyles.textBlack,
                  ),
                ),
                ListTile(
                  subtitle: Text("this.place.address"),
                ),
                Image.network(
                  '/assets/images/logo.png',
                  width: size.width,
                  height: size.height * 0.4,
                ),
                Text("Avaliação: \$ {this.place.rating}"),
                TextButton(
                  onPressed: () {
                    print("teste");
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
      bottomNavigationBar: AppFooter.footer,
    );
  }
}