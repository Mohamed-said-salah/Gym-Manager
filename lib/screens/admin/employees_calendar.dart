import 'dart:io';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:employees/models/emp_day_data.dart';
import 'dart:async';

import 'package:intl/intl.dart';

class EmployeeCalendar extends StatefulWidget {
  static String id = "EmployeeCalendar";
  @override
  _EmployeeCalendarState createState() => _EmployeeCalendarState();
}

class _EmployeeCalendarState extends State<EmployeeCalendar> {
  String selectedDateDay;
  List<EmpDayData> _list = [];
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
                listMgr.stringData =
                    (await DbHelper().getDayStrData(formatDate(date))).strData;
                setState(() {
                  _list = listMgr.listData;
                  _list.removeWhere((element) => element.code == null);

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

                  // selectedDate = selectedDateDay+'  '+DateFormat('yyyy-MM-dd').format(DateTime.now());

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
          selectedDateDay!=null?"Pointage Coaches"+" - "+selectedDateDay:"Pointage Coaches",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body:
          ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, position) {
            return Card(
                color: Colors.white,
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    backgroundImage: _list[position].image == '' ||
                            _list[position].image == null
                        ? AssetImage("assets/images/person.png")
                        : FileImage(new File(_list[position].image)),
                  ),
                  title: Text(this._list[position].name),
                  subtitle: Column(children: [
                    Row(
                      children: [
                        Text('Arrivée: ' + _list[position].arrival.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Départ: ' + _list[position].departure.toString()),
                      ],
                    ),
                  ]),
                  onTap: () {
                    //print();
                  },
                ));
          },
        ),
    );
  }
}
