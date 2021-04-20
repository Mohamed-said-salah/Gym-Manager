import 'package:employees/models/classes.dart';
import 'package:employees/screens/employess/written_classes.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ManageClasses extends StatefulWidget {
  static String id = 'ManageClasses';
  DayClasses dayClasses = new DayClasses('', '', '', '', '', '','');
  @override
  _ManageClassesState createState() => _ManageClassesState();
}

class _ManageClassesState extends State<ManageClasses> {
  String Samedi = 'Samedi';
  String Vendredi = 'Vendredi';
  String Jeudi = 'Jeudi';
  String Mercredi = 'Mercredi';
  String Mardi = 'Mardi';
  String Lundi = 'Lundi';
  DbHelper databaseHelper = new DbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Gestion des cours",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
        ),
        children: [
          GestureDetector(
            onTap: () async {
              widget.dayClasses = await databaseHelper.getClassesDay("Monday");
              setState(() {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WrittenClasses(pageTitle: Lundi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Lundi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              widget.dayClasses = await databaseHelper.getClassesDay("Tuesday");
              setState(() {});

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WrittenClasses(pageTitle: Mardi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Mardi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              widget.dayClasses =
                  await databaseHelper.getClassesDay("Wednesday");
              setState(() {});

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WrittenClasses(pageTitle: Mercredi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Mercredi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              widget.dayClasses =
                  await databaseHelper.getClassesDay("Thursday");
              setState(() {});
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WrittenClasses(pageTitle: Jeudi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Jeudi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              widget.dayClasses = await databaseHelper.getClassesDay("Friday");
              setState(() {});

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WrittenClasses(pageTitle: Vendredi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Vendredi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              widget.dayClasses =
                  await databaseHelper.getClassesDay("Saturday");
              setState(() {});

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WrittenClasses(pageTitle: Samedi,dayClasses: widget.dayClasses,)));
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                    child: Text(
                  Samedi,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
