import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:arrivederci/shared/Constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = "", _name = "", _password = "", _confirmPassword = "";
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Center(
            child: Container(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "CADASTRAR",
                        style: TextStyles.pageTitle,
                      ),
                      SizedBox(height: 80.0),
                      Container(
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
                            labelText: 'Nome',
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
                              return "Por favor preencha o campo de e-mail";
                            }
                            return null;
                          },
                          onChanged: (value) async {
                            setState(() {
                              _email = value.trim();
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'E-mail',
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
                          onChanged: (value) async {
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
                      SizedBox(height: 20.0),
                      Container(
                        width: size.width * 0.8,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Por favor preencha o campo de confirmação de senha";
                            }
                            return null;
                          },
                          onChanged: (value) async {
                            setState(() {
                              _confirmPassword = value.trim();
                            });
                          },
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
                          onPressed: () async {
                            try {
                              if (_password == _confirmPassword) {
                                if (_formKey.currentState!.validate()) {
                                  await auth
                                      .createUserWithEmailAndPassword(
                                          email: _email, password: _password)
                                      .then(
                                        (UserCredential result) => {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text("Campos vazios"),
                                            ),
                                          ),
                                          result.user!.updateDisplayName(_name),
                                          Navigator.of(context)
                                              .pushNamed(LOGIN_SCREEN)
                                        },
                                      );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Campos vazios"),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("As senhas não correspondem"),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Erro ao fazer cadastro"),
                                ),
                              );
                            }
                          },
                          child: Text('CADASTRAR'),
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
                          child: Text('JÁ POSSUI CONTA?'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).pushNamed(LOGIN_SCREEN);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
