import 'package:arrivederci/shared/themes/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:arrivederci/shared/widgets/navigation_drawer/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:20.0, left: 20.0, right: 20.0),
            child:Text(
            "Trabalho da disciplina de Programação para Dispositivos Móveis",
            style: TextStyles.textAbout,
            textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:20.0, left: 20.0, right: 20.0),
            child:Text(
            "Alunos:",
            style: TextStyles.textAbout,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:20.0, left: 20.0, right: 20.0),
            child:Text(
            "Alan Queiroz Pinho \n"+
            "Ângelo T. Bittencourt Todeschini\n"+
            "João Vitor de Moura Rosa",
            style: TextStyles.textAbout,
            ),
          )
        ],
      ),
      bottomNavigationBar: AppFooter.footer,
    );
  }
}
