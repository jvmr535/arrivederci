import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Card(
        child: Container(
          height: size.height * 0.32,
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  //this.place.name,
                  "Trabalho da disciplina de Programação para Dispositivos Móveis",
                  textAlign: TextAlign.center,
                  style: TextStyles.textBlack,
                ),
              ),
              Divider(
                color: AppColors.primary,
                indent: 20,
                endIndent: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Alunos:",
                      style: TextStyles.textAbout,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                    child: Text(
                      "Alan Queiroz Pinho \n" +
                          "Ângelo T. Bittencourt Todeschini\n" +
                          "João Vitor de Moura Rosa",
                      style: TextStyles.textAbout,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppFooter(),
    );
  }
}
