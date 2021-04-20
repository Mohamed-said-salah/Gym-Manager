import 'package:employees/models/classes.dart';
import 'package:employees/models/emp_day_data.dart';
import 'package:employees/models/participantsDay.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class ClassesCalendar extends StatefulWidget {
  static String id = "ClassesCalendar";
  @override
  _ClassesCalendarState createState() => _ClassesCalendarState();
}

class _ClassesCalendarState extends State<ClassesCalendar> {
  ParticipantsDay participantsDay =
      new ParticipantsDay('', '', '', '', '', '', '');
  DayClasses dayClasses = new DayClasses('', '', '', '', '', '', '');
  DbHelper databaseHelper = new DbHelper();
  String selectedDate;
  String selectedDateDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                ).then((date) async {
                  dayClasses =
                      dayClasses = await databaseHelper
                      .getClassesDay(DateFormat('EEEE').format(date));
                  participantsDay =
                      await databaseHelper.getPDay(formatDate(date));
                  setState(() {

                    switch (DateFormat('EEEE').format(date)) {
                      case 'Monday':
                        {
                          selectedDateDay = 'Lundi';
                        }
                        break;
                      case 'Tuesday':
                        {
                          selectedDateDay = 'Mardi';
                        }
                        break;
                      case 'Wednesday':
                        {
                          selectedDateDay = 'Mercredi';
                        }
                        break;
                      case 'Thursday' :
                        {
                          selectedDateDay = 'Jeudi';
                        }
                        break;
                      case 'Friday' :
                        {
                          selectedDateDay = 'Vendredi';
                        }
                        break;
                      case 'Saturday' :
                        {
                          selectedDateDay = 'Samedi';
                        }
                        break;
                    }

                    selectedDate = selectedDateDay+'  '+DateFormat('yyyy-MM-dd').format(DateTime.now());

                  });
                });
              },
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.date_range),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Calendrier des cours",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  selectedDate!=null?selectedDate:'',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class1 == null ? '' : dayClasses.class1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours1 == null
                      ? ''
                      : participantsDay.pCours1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class2 == null ? '' : dayClasses.class2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours2 == null
                      ? ''
                      : participantsDay.pCours2,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class3 == null ? '' : dayClasses.class3,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours3 == null
                      ? ''
                      : participantsDay.pCours3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class4 == null ? '' : dayClasses.class4,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours4 == null
                      ? ''
                      : participantsDay.pCours4,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class5 == null ? '' : dayClasses.class5,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours5 == null
                      ? ''
                      : participantsDay.pCours5,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                title: Text(
                  dayClasses.class6 == null ? '' : dayClasses.class6,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  participantsDay.pCours6 == null
                      ? ''
                      : participantsDay.pCours6,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ]));
  }
}
