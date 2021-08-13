import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:arrivederci/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(
                () {
                  _email = value.trim();
                },
              );
            },
          ),
          TextField(
            onChanged: (value) {
              setState(
                () {
                  _password = value.trim();
                },
              );
            },
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    await auth.signInWithEmailAndPassword(
                        email: _email, password: _password);
                    print("Deu certo");
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } catch (e) {
                    print("Deu errado");
                  }
                },
                child: Text("Sign-in"),
              ),
              ElevatedButton(
                onPressed: () {
                  auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text("Sign-up"),
              )
            ],
          )
        ],
      ),
    );
  }
}
