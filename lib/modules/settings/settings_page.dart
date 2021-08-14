import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/footer/app_footer.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Configurações"),
      ),
      backgroundColor: AppColors.white,
      body: Stack(children: [
        Center(
          child: Container(
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 140,
                      child: Text(
                        "Alterar Nome",
                        style: TextStyles.textBlack,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Novo Nome',
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
                      child: Text('ALTERAR'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 140,
                      child: Text(
                        "Alterar Email",
                        style: TextStyles.textBlack,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Novo Email',
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
                      child: Text('ALTERAR'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 140,
                      child: Text(
                        "Alterar Senha",
                        style: TextStyles.textBlack,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nova Senha',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Confirmar senha',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    width: size.width * 0.8,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.primary, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {},
                      child: Text('ALTERAR'),
                    ),
                  ),
                ],
              ),
            )
          ),
        )
      ]),
      bottomNavigationBar: AppFooter(),
    );
  }
}
