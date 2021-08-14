import 'package:arrivederci/shared/Constants.dart';
import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final auth = FirebaseAuth.instance;
  String _email = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(children: [
        Center(
          child: Container(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RECUPERAÇÃO DE SENHA",
                  style: TextStyles.pageTitle,
                ),
                SizedBox(height: 80.0),
                Container(
                  width: size.width * 0.8,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
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
                        auth.sendPasswordResetEmail(email: _email).then((_) => {
                              Navigator.of(context).pop(),
                              Navigator.of(context).pushNamed(LOGIN_SCREEN)
                            });
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text('ENVIAR'),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: size.width * 0.8,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.white,
                      onPrimary: AppColors.primary,
                      side: BorderSide(color: AppColors.primary),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed(LOGIN_SCREEN);
                    },
                    child: Text('VOLTAR'),
                  ),
                ),
                SizedBox(height: 10.0)
              ],
            ),
          )),
        )
      ]),
    );
  }
}
