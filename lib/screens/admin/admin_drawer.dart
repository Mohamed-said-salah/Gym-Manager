import 'package:employees/screens/admin/admin_edit.dart';
import 'package:employees/screens/admin/admin_login.dart';
import 'package:employees/screens/admin/classes_calendar.dart';
import 'package:employees/screens/admin/employees_calendar.dart';
import 'package:employees/screens/admin/manage_classes.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatelessWidget {
  static String id = "AdminDrawer";
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: _height * 0.07,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, EmployeeCalendar.id);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: _width * 0.05,
                    ),
                    Text(
                      "Pointage Coaches",
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ClassesCalendar.id);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.assessment,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: _width * 0.05,
                    ),
                    Text(
                      "Calendrier des cours",
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, ManageClasses.id);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.border_color,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: _width * 0.05,
                    ),
                    Text(
                      "Gestion des cours",
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: _height * 0.05,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.deepPurple,
                    ),
                    SizedBox(
                      width: _width * 0.05,
                    ),
                    Text(
                      "Se déconnecter",
                      style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
