import 'dart:io';
import 'dart:typed_data';
import 'package:employees/models/employee.dart';
import 'package:employees/screens/admin/admin_home.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:convert';

class AddEmployee extends StatefulWidget {
  static String id = "AddEmployee";

  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  DbHelper databaseHelper = new DbHelper();
  Employee employee = new Employee('Mohamed', 12345, 'Photo');
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Ajouter un coach",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: _height * 0.04,
          ),
          GestureDetector(
            onTap: getImage,
            child: Column(children: [
              CircleAvatar(
                backgroundImage: _image !=null? FileImage(_image) : AssetImage('assets/images/person.png'),
                radius: _height*0.05,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
            ]),
          ),
          Center(
              child: Text(
            "Télécharger une photo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.deepPurple),
          )),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: nameController,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                setState(() {
                  employee.name = nameController.text;
                });
              },
              decoration: InputDecoration(
                  labelText: 'Nom',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: codeController,
              onChanged: (value) {
                setState(() {
                  employee.code = int.parse(codeController.text);
                });
              },
              style: Theme.of(context).textTheme.subtitle1,
              decoration: InputDecoration(
                  labelText: 'Code',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          SizedBox(
            height: _height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                  setState(() {
                    employee.image = _image!=null? _image.path: '';
                    addEmployee();
                  });

              },
              child: Text(
                "Ajouter",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void addEmployee()async
  {
    int result =0;
    print(employee.name);
    print(employee.code);
    result = await databaseHelper.insertEmployee(employee);
    if(result != 0)
    {
      Navigator.pop(context);
      _showAlertDialog('Statut','Ajouté avec succès');
      varF();
    }else{
      _showAlertDialog('Statut','Ajout de problème');
    }
  }
  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}

