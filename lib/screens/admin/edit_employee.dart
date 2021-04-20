import 'dart:io';
import 'dart:convert';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'admin_drawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:employees/models/employee.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditEmployee extends StatefulWidget {
  static String id = "EditEmployee";
  Employee employee;
  EditEmployee({@required this.employee});
  @override
  EditEmployeeState createState() => EditEmployeeState();
}

class EditEmployeeState extends State<EditEmployee> {

  DbHelper databaseHelper = new DbHelper();
  TextEditingController nameController = new TextEditingController();
  TextEditingController codeController = new TextEditingController();
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
      widget.employee.image=_image.path;
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      nameController.text = widget.employee.name;
      codeController.text = widget.employee.code.toString();
    });
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Modifier l'coach",
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
            onTap:getImage,
            child: Column(children: [
              CircleAvatar(
                backgroundImage: widget.employee.image !=''? FileImage(new File(widget.employee.image),) : AssetImage('assets/images/person.png'),
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
              onChanged: (value)
              {
                setState(() {
                  widget.employee.name = nameController.text;
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
            padding: EdgeInsets.only(left: 20,right: 20,top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: codeController,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value)
              {
                setState(() {
                  widget.employee.code = int.parse(codeController.text);
                });
              },
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
                  borderRadius: BorderRadius.circular(5)
              ),
              onPressed: ()
              {
                setState(() {
                  widget.employee.image=_image!=null? _image.path: widget.employee.image;
                  save();
                });
              },
              child: Text("sauver",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void save()async {
    int result;
    if (widget.employee.id !=null)
    {
      result = await databaseHelper.updateEmployee(widget.employee);
    }
    if(result !=0){_showAlertDialog('Statut','Enregistré avec succès');}
    else{_showAlertDialog('Statut','Problème de sauvegarde');}
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
