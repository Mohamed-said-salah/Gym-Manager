import 'package:employees/screens/admin/add_employee.dart';
import 'package:employees/screens/admin/admin_drawer.dart';
import 'package:employees/screens/admin/admin_edit.dart';
import 'package:employees/screens/admin/admin_home.dart';
import 'package:employees/screens/admin/admin_login.dart';
import 'package:employees/screens/admin/classes_calendar.dart';
import 'package:employees/screens/admin/edit_employee.dart';
import 'package:employees/screens/admin/employees_calendar.dart';
import 'package:employees/screens/admin/manage_classes.dart';
import 'package:employees/screens/employess/classes.dart';
import 'package:employees/screens/employess/employee_home.dart';
import 'package:employees/screens/employess/written_classes.dart';
import 'package:employees/screens/start_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id :(context) => StartScreen(),
        AdminLogin.id : (context) => AdminLogin(),
        AdminHome.id : (context) => AdminHome(),
        EmployeeHome.id : (context) => EmployeeHome(),
        AdminDrawer.id : (context) => AdminDrawer(),
        EmployeeCalendar.id : (context) => EmployeeCalendar(),
        ClassesCalendar.id : (context) => ClassesCalendar(),
        AddEmployee.id : (context) => AddEmployee(),
        EditEmployee.id : (context) => EditEmployee(),
        ManageClasses.id: (context) => ManageClasses(),
        AdminEdit.id : (context) => AdminEdit(),
        WrittenClasses.id: (context) =>WrittenClasses(),

      },
    );

  }
}
