import 'package:employees/models/classes.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WrittenClasses extends StatefulWidget {
  static String id = 'WrittenClasses';
  String pageTitle;
  DayClasses dayClasses = new DayClasses('', '', '', '', '', '', '');
  WrittenClasses({this.pageTitle, this.dayClasses});

  @override
  _WrittenClassesState createState() => _WrittenClassesState();
}

class _WrittenClassesState extends State<WrittenClasses> {
  DbHelper databaseHelper = new DbHelper();

  DayClasses _dayClasses = new DayClasses('', '', '', '', '', '', '');

  TextEditingController controller1 = new TextEditingController();

  TextEditingController controller2 = new TextEditingController();

  TextEditingController controller3 = new TextEditingController();

  TextEditingController controller4 = new TextEditingController();

  TextEditingController controller5 = new TextEditingController();

  TextEditingController controller6 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller1.text = widget.dayClasses.class1;
    controller2.text = widget.dayClasses.class2;
    controller3.text = widget.dayClasses.class3;
    controller4.text = widget.dayClasses.class4;
    controller5.text = widget.dayClasses.class5;
    controller6.text = widget.dayClasses.class6;

    switch (widget.pageTitle) {
      case 'Lundi':
        {
          _dayClasses.name = 'Monday';
        }
        break;
      case 'Mardi':
        {
          _dayClasses.name = 'Tuesday';
        }
        break;
      case 'Mercredi':
        {
          _dayClasses.name = 'Wednesday';
        }
        break;
      case 'Jeudi':
        {
          _dayClasses.name = 'Thursday';
        }
        break;
      case 'Vendredi':
        {
          _dayClasses.name = 'Friday';
        }
        break;
      case 'Samedi':
        {
          _dayClasses.name = 'Saturday';
        }
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(widget.pageTitle),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller1,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
               //print(DateFormat('EEEE').format(DateTime.now()));
                _dayClasses.class1 =
                    controller1.text == null ? '' : controller1.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours1',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller2,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                _dayClasses.class2 =
                    controller2.text == null ? '' : controller2.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours2',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller3,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                _dayClasses.class3 =
                    controller3.text == null ? '' : controller3.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours3',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller4,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                _dayClasses.class4 =
                    controller4.text == null ? '' : controller4.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours4',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller5,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                _dayClasses.class5 =
                    controller5.text == null ? '' : controller5.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours5',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, bottom: 5, top: 10),
            child: TextField(
              cursorColor: Colors.deepPurple,
              controller: controller6,
              style: Theme.of(context).textTheme.subtitle1,
              onChanged: (value) {
                _dayClasses.class6 =
                    controller6.text == null ? '' : controller6.text;
              },
              decoration: InputDecoration(
                  labelText: 'Cours6',
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fillColor: Colors.deepPurple),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: RaisedButton(
                  child: Text(
                    'Soumettre',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () async {

                    _dayClasses.class1=controller1.text == null ? '' : controller1.text;
                    _dayClasses.class2=controller2.text == null ? '' : controller2.text;
                    _dayClasses.class3=controller3.text == null ? '' : controller3.text;
                    _dayClasses.class4=controller4.text == null ? '' : controller4.text;
                    _dayClasses.class5=controller5.text == null ? '' : controller5.text;
                    _dayClasses.class6=controller6.text == null ? '' : controller6.text;

                    await databaseHelper.setDayClasses(_dayClasses);
                    _showAlertDialog('Statut', 'terminé');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
