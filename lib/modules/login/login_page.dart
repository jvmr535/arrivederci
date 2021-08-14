import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arrivederci/shared/Constants.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "", _password = "";
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(children: [
        Center(
          child: Container(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: TextStyles.pageTitle,
                    ),
                    SizedBox(height: 80.0),
                    Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor preencha o campo de e-mail";
                          }
                          return null;
                        },
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
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor preencha o campo de senha";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Senha',
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
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              await auth
                                  .signInWithEmailAndPassword(
                                      email: _email, password: _password)
                                  .then((_) => {
                                        Navigator.of(context)
                                            .pushNamed(HOME_SCREEN)
                                      });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Campos vazios"),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Erro ao fazer login"),
                              ),
                            );
                          }
                        },
                        child: Text('ENTRAR'),
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
                          Navigator.of(context).pushNamed(REGISTER_SCREEN);
                        },
                        child: Text('CADASTRAR'),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: AppColors.primary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(FORGOT_PASSWORD_SCREEN);
                      },
                      child: Text("Esqueceu a senha?"),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
