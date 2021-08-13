import 'package:arrivederci/shared/themes/app_colors.dart';
import 'package:arrivederci/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:arrivederci/shared/Constants.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    "CADASTRAR",
                    style: TextStyles.pageTitle,
                  ),
                  SizedBox(height: 80.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
            )
          ),
        )
      ]),
    );
  }
}
