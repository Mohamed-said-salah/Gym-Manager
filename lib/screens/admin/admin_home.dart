import 'package:employees/screens/admin/add_employee.dart';
import 'package:employees/screens/admin/edit_employee.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'admin_drawer.dart';
import 'dart:io';
import 'dart:async';
import 'package:employees/models/employee.dart';
import 'package:intl/intl.dart';

dynamic varF;

class AdminHome extends StatefulWidget {
  static String id = "AdminHome";

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  //Singleton instance of the DbHelper Class
  DbHelper databaseHelper = DbHelper();
  //create employee list
  List<Employee> employeeList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    varF = updateListView;
    if(employeeList == null){
      employeeList = List<Employee>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(actions: [
        GestureDetector(
          onTap: updateListView,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.refresh
            ),
          ),
        )
      ],
        backgroundColor: Colors.deepPurple,
        title: Text(
          "Gestion des coaches"
        ),
        centerTitle: true,
      ) ,
      drawer: AdminDrawer(),
      body: adminHomeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          Navigator.pushNamed(context, AddEmployee.id);

        },
        backgroundColor: Colors.deepPurple,
        child: Icon(
          Icons.add
        ),
      ) ,
    );
  }

  ListView adminHomeList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position)
        {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                backgroundImage: employeeList[position].image == ''? AssetImage("assets/images/person.png") : FileImage(new File(employeeList[position].image),)
              ),
              title: Text(this.employeeList[position].name),
              subtitle: Text('Code: '+this.employeeList[position].code.toString()),
              trailing: GestureDetector(
                  child: GestureDetector(
                      onTap: (){
                        delete(context, employeeList[position]);
                      },
                      child: Icon(Icons.delete,color: Colors.deepPurple,))),
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => EditEmployee(employee: this.employeeList[position],)

                ));
              },
            ),
          );
        },
    );
  }

  void delete(BuildContext context, Employee employee) async {

    int result = await databaseHelper.deleteEmployee(employee.id);
    if (result != 0) {
      _showSnackBar(context, 'Employé supprimé avec succès');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Employee>> employeeListFuture = databaseHelper.getEmployeeList();
      employeeListFuture.then((employeeList) {
        setState(() {
          this.employeeList = employeeList;
          this.count = employeeList.length;
        });
      });
    });
  }


}

