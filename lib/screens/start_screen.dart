import 'package:employees/models/classes.dart';
import 'package:employees/models/emp_day_data.dart';
import 'package:employees/models/employee.dart';
import 'package:employees/models/participantsDay.dart';
import 'package:employees/screens/admin/admin_login.dart';
import 'package:employees/screens/employess/employee_home.dart';
import 'package:employees/services/db_helper.dart';
import 'package:employees/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class StartScreen extends StatefulWidget {
  static String id = "StartScreen";

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  EmpDayData emp;
  DayData dayData;
  DayClasses dayClasses = new DayClasses('', '', '', '', '', '','');
  TextEditingController codeController = new TextEditingController();
  ParticipantsDay participantsDay=new ParticipantsDay('', '', '', '', '', '','');
  DbHelper databaseHelper = new DbHelper();
  Employee employee;
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        ListView(
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
                      "Votre code",
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
                    password: codeController,
                    hint: "Veuillez entrer votre code",
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
                    onPressed: ()async {


                      participantsDay = await databaseHelper.getPDay(formatDate(DateTime.now()));
                      await getList(int.parse(codeController.text));
                      listMgr.stringData = (await DbHelper().getDayStrData(formatDate(DateTime.now()))).strData;
                      print(listMgr.stringData);
                      //var x = DayData(formatDate(DateTime.now()), listMgr.stringData);
                      emp = listMgr.listData.firstWhere((val) => val.code == employee.code,orElse: ()=>null);
                      dayClasses = await databaseHelper
                          .getClassesDay(DateFormat('EEEE').format(DateTime.now()));
                      setState(() {
                      });
                      if(employee==null)
                        {_showAlertDialog('Statut','Code invalide');
                        }else{Navigator.push(context, MaterialPageRoute(
                            builder: (context) => EmployeeHome(employee: employee,dayClasses: dayClasses,emp: emp,participantsDay: participantsDay,),

                        ));}
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AdminLogin.id);
                      },
                      child: Text(
                        "Administrateur",
                        style: TextStyle(
                            fontSize: 18,
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
    );
  }

  Future getList(int code)async {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    employee = await databaseHelper.getEmployeeListLogin(code);
    print(employee.name);
    print(employee.code);
    print(employee.image);
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
