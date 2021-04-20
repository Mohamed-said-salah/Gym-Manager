import 'package:employees/screens/admin/admin_home.dart';
import 'package:employees/screens/start_screen.dart';
import 'package:employees/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatelessWidget {
  final adminPassword = "007";
  static String id = "AdminLogin";
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Builder(
      builder: (context) => ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _height * 0.1,
              ),
              Container(
                height: _height * 0.2,
                child: Image(
                  image: AssetImage("assets/images/starter.png"),
                ),
              ),
              SizedBox(
                height: _height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(children: [
                  Text(
                    "Votre mot de passe",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ]),
              ),
              SizedBox(
                height: _height * 0.005,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: CustomTextFields(
                  password: password,
                  hint: "Veuillez entrer le mot de passe",
                  icon: Icons.lock,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ButtonTheme(
                height: _height * 0.09,
                minWidth: _width * 0.5,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  child: Text(
                    "S'identifier",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    if (password.text == adminPassword) {
                      Navigator.pushNamed(context, AdminHome.id);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          "Mot de passe incorrect",
                        ),
                      ));
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Se connecter en tant que ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, StartScreen.id);
                    },
                    child: Text(
                      "Coach",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
