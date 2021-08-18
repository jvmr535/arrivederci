import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/widgets/app_footer/app_footer_widget.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final auth = FirebaseAuth.instance;
  final _formNameKey = GlobalKey<FormState>();
  String _name = "";

  Future setName(String userName, GlobalKey<FormState> nameKey) async {
    try {
      if (nameKey.currentState!.validate()) {
        await auth.currentUser!.updateDisplayName(userName);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Nome Alterado com sucesso!"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao alterar o nome!"),
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
        title: Text("Configurações"),
      ),
      backgroundColor: AppColors.white,
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Form(
                  key: _formNameKey,
                  child: Container(
                    width: size.width * 0.8,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor preencha o campo de nome";
                        }
                        return null;
                      },
                      onChanged: (value) async {
                        setState(() {
                          _name = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Novo Nome',
                        border: OutlineInputBorder(),
                      ),
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
                      await setName(_name, _formNameKey).then((_) => {
                            Navigator.of(context).pop(),
                            Navigator.of(context).pushNamed(HOME_SCREEN)
                          });
                      ;
                    },
                    child: Text('ALTERAR'),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        )
      ]),
      bottomNavigationBar: AppFooter(),
    );
  }
}
