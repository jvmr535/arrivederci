import 'dart:ui';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class TravelDetailPage extends StatelessWidget {
  // final TravelItinerary edit;

  const TravelDetailPage({Key? key}) : super(key: key);

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
            height: size.height * 0.8,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    //this.place.name,
                    "Viagem para França",
                    textAlign: TextAlign.center,
                    style: TextStyles.textBlack,
                  ),
                ),
                Image.network(
                  //'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${this.place.photo}&key=$apiKey',
                  'https://media.tacdn.com/media/attractions-splice-spp-674x446/06/74/aa/fc.jpg',
                  width: size.width,
                  height: size.height * 0.25,
                  fit: BoxFit.fitWidth,
                ),

                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                          child: Text(
                            "Torre Eiffel",
                            style: TextStyles.textBlack,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.close,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                Divider(
                  color: AppColors.primary,
                  indent: 10,
                  endIndent: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                          child: Text(
                            "Arco do Triunfo",
                            style: TextStyles.textBlack,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.close,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.primary,
                  indent: 10,
                  endIndent: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                          child: Text(
                            "Museu do Louvre",
                            style: TextStyles.textBlack,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.info_outline,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          child:Icon(
                            Icons.close,
                            color: AppColors.primary,
                            size: 26.0,
                          ),
                        ),
                      ],
                    ),
                    
                  ],
                ),
                Divider(
                  color: AppColors.primary,
                  indent: 10,
                  endIndent: 20,
                ),

                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          //"Avaliação: ${this.place.rating}"
                          "Roteiro da ultima viagem para a França",
                          style: TextStyles.textDetails,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("CONFIRMAR_teste");
                      },
                      child: Text(
                        "CONFIRMAR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        print("EXCLUIR_teste");
                      },
                      child: Text(
                        "EXCLUIR",
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
