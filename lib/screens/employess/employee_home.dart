import 'package:employees/models/classes.dart';
import 'package:employees/models/emp_day_data.dart';
import 'package:employees/models/employee.dart';
import 'package:employees/models/participantsDay.dart';
import 'package:employees/services/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmployeeHome extends StatefulWidget {
  static String id = "EmployeeHome";
  ParticipantsDay participantsDay =
      new ParticipantsDay('', '', '', '', '', '', '');
  EmpDayData emp;
  Employee employee; // = new Employee('Mohamed', 1234, 'photo');
  DayClasses dayClasses = new DayClasses('', '', '', '', '', '', '');
  EmployeeHome(
      {@required this.employee,
      this.dayClasses,
      this.emp,
      this.participantsDay,});

  @override
  _EmployeeHomeState createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  bool checkClass1 = false;
  bool checkClass2 = false;
  bool checkClass3 = false;
  bool checkClass4 = false;
  bool checkClass5 = false;
  bool checkClass6 = false;
  //====================================================
  EmpDayData empData;
  DbHelper databaseHelper = new DbHelper();
  var classes = <String>[];
  bool _checkArr = false;
  bool _checkDepart = false;
  var now = DateTime.now();
  bool checkFirst=false;
  bool checkFirst2=false;
//===============================================
  TextEditingController _txtPartController1 = new TextEditingController();
  TextEditingController _txtPartController2 = new TextEditingController();
  TextEditingController _txtPartController3 = new TextEditingController();
  TextEditingController _txtPartController4 = new TextEditingController();
  TextEditingController _txtPartController5 = new TextEditingController();
  TextEditingController _txtPartController6 = new TextEditingController();

  @override
  void initState() {
    if(widget.emp!=null){
      checkFirst=true;
      _checkArr=true;
      if(widget.emp.departure!=null)
      {
        checkFirst2 = true;
        _checkDepart =true;
      }

    }
  } //===================================================================================================================================================

  @override
  Widget build(BuildContext context) {
    print(widget.participantsDay.pCours1);
    print(widget.participantsDay.pCours2);
    print(widget.participantsDay.pCours3);
    print(widget.participantsDay.pCours4);
    print(widget.participantsDay.pCours5);
    print(widget.participantsDay.pCours6);
//============================================================
    widget.participantsDay.date = formatDate(DateTime.now());

    _txtPartController1.text = widget.participantsDay.pCours1;
    _txtPartController2.text = widget.participantsDay.pCours2;
    _txtPartController3.text = widget.participantsDay.pCours3;
    _txtPartController4.text = widget.participantsDay.pCours4;
    _txtPartController5.text = widget.participantsDay.pCours5;
    _txtPartController6.text = widget.participantsDay.pCours6;
//=================================================================
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    String formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(now);
    //===========================================================
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (value) async {},
            tabs: [
              Text('Pointage'),
              Text('Cours'),
            ],
          ),
          backgroundColor: Colors.deepPurple,
          title: Row(children: [
            Text(
              widget.employee.name,
            ),
          ]),
        ),
        backgroundColor: Colors.white,
//        drawer: EmployeeDrawer(),
        body: TabBarView(children: [
          Form(
            child: ListView(
              children: [
                SizedBox(
                  height: _height * 0.05,
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
                        formattedDate,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
                //==============================================================
                SizedBox(
                  height: _height * 0.05,
                ),
                 Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Heure d'arrivée",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    _checkArr != true
                                        ? ''
                                        : checkFirst==true?widget.emp.arrival:formatDateTime(now),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {
                                      if(!checkFirst){
                                      setState(() {
                                        _checkArr = value;
                                      });
                                      }
                                    },
                                    value: _checkArr,
                                    focusColor: Colors.deepPurple,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                //==============================================================
                SizedBox(
                  height: _height * 0.05,
                ),
                widget.emp!= null
                    ? Container(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Heure de départ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    _checkDepart != true
                                        ? ''
                                        : checkFirst2==true?widget.emp.departure:formatDateTime(now),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Checkbox(
                                    activeColor: Colors.deepPurple,
                                    onChanged: (bool value) {
                                      if(!checkFirst2){
                                      setState(() {
                                        _checkDepart = value;
                                      });
                                      }
                                    },
                                    value: _checkDepart,
                                    focusColor: Colors.deepPurple,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                //==============================================================
                checkFirst2 == true? Container():Padding(
                  padding: EdgeInsets.all(25),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    color: Colors.deepPurple,
                    child: Text(
                      'Soumettre',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () async {
                      if((_checkArr == true)&&(_checkDepart == false))
                      {
                        print('true');
                        checkFirst = true;
                        empData = EmpDayData(
                          name: widget.employee.name,
                          code: widget.employee.code,
                          date: formatDate(now),
                          id: widget.employee.id,
                          image: widget.employee.image,
                          arrival: formatDateTime(now),
                        );
                        await updateEmployeeData(empData);
                        _showAlertDialog('Statut', 'terminé');
                      }else if((_checkArr == true)&&(_checkDepart == true))
                      {
                        print('true true');
                        checkFirst2 = true;
                        empData = EmpDayData(
                          name: widget.employee.name,
                          code: widget.employee.code,
                          date: formatDate(now),
                          id: widget.employee.id,
                          image: widget.employee.image,
                          departure: formatDateTime(now),
                        );
                        await updateEmployeeData(empData);
                        _showAlertDialog('Statut', 'terminé');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          //cours =======================================================================================================================================
          ListView(
            children: [
              ListTile(
                subtitle: Text(widget.participantsDay.pCours1 == null
                    ? ''
                    : widget.participantsDay.pCours1),
                title: Text(
                  widget.dayClasses.class1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class1 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController1,
                          onChanged: (v) {
                            widget.participantsDay.pCours1 =
                                _txtPartController1.text == null
                                    ? ''
                                    : _txtPartController1.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),
              //================================================================
              ListTile(
                subtitle: Text(widget.participantsDay.pCours2 == null
                    ? ''
                    : widget.participantsDay.pCours2),
                title: Text(
                  widget.dayClasses.class2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class2 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController2,
                          onChanged: (v) {
                            widget.participantsDay.pCours2 =
                                _txtPartController2.text == null
                                    ? ''
                                    : _txtPartController2.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),
              //================================================================
              ListTile(
                subtitle: Text(widget.participantsDay.pCours3 == null
                    ? ''
                    : widget.participantsDay.pCours3),
                title: Text(
                  widget.dayClasses.class3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class3 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController3,
                          onChanged: (v) {
                            widget.participantsDay.pCours3 =
                                _txtPartController3.text == null
                                    ? ''
                                    : _txtPartController3.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),
              ListTile(
                subtitle: Text(widget.participantsDay.pCours4 == null
                    ? ''
                    : widget.participantsDay.pCours4),
                title: Text(
                  widget.dayClasses.class4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class4 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController4,
                          onChanged: (v) {
                            widget.participantsDay.pCours4 =
                                _txtPartController4.text == null
                                    ? ''
                                    : _txtPartController4.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),
              ListTile(
                subtitle: Text(widget.participantsDay.pCours5 == null
                    ? ''
                    : widget.participantsDay.pCours5),
                title: Text(
                  widget.dayClasses.class5,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class5 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController5,
                          onChanged: (v) {
                            widget.participantsDay.pCours5 =
                                _txtPartController5.text == null
                                    ? ''
                                    : _txtPartController5.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),
              ListTile(
                subtitle: Text(widget.participantsDay.pCours6 == null
                    ? ''
                    : widget.participantsDay.pCours6),
                title: Text(
                  widget.dayClasses.class6,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                trailing: widget.dayClasses.class6 == ''
                    ? null
                    : Container(
                        width: _width * 0.4,
                        height: _height * 0.05,
                        child: TextField(
                          controller: _txtPartController6,
                          onChanged: (v) {
                            widget.participantsDay.pCours6 =
                                _txtPartController6.text == null
                                    ? ''
                                    : _txtPartController6.text;
                          },
                          decoration: InputDecoration(
                              labelText: 'Participants',
                              labelStyle: Theme.of(context).textTheme.subtitle1,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              fillColor: Colors.deepPurple),
                          keyboardType: TextInputType.number,
                        ),
                      ),
              ),

//====================================================================================================
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.deepPurple,
                  child: Text(
                    'Soumettre',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    widget.participantsDay.pCours1 =
                        _txtPartController1.text == null
                            ? ''
                            : _txtPartController1.text;

                    widget.participantsDay.pCours2 =
                        _txtPartController2.text == null
                            ? ''
                            : _txtPartController2.text;

                    widget.participantsDay.pCours3 =
                        _txtPartController3.text == null
                            ? ''
                            : _txtPartController3.text;

                    widget.participantsDay.pCours4 =
                        _txtPartController4.text == null
                            ? ''
                            : _txtPartController4.text;

                    widget.participantsDay.pCours5 =
                        _txtPartController5.text == null
                            ? ''
                            : _txtPartController5.text;

                    widget.participantsDay.pCours6 =
                        _txtPartController6.text == null
                            ? ''
                            : _txtPartController6.text;



                    await databaseHelper.setPCourses(widget.participantsDay);
                    _showAlertDialog('Statut', 'terminé');
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Future updateEmployeeData(EmpDayData empData) async {
    var _dayData = await DbHelper().getDayStrData(formatDate(now));
    listMgr.stringData = _dayData.strData;
    //print(listMgr.stringData);
    var _el = listMgr.listData.firstWhere((element) {
      return element.id == empData.id;
    }, orElse: () => null);
    if (_el != null) {
      empData.arrival = _el.arrival;
      listMgr.listData.remove(_el);
    }
    //print(empData.objToMap(empData));
    listMgr.listData.add(empData);
    var x = DayData(formatDate(now), listMgr.stringData);
    await DbHelper().setDayStrData(x);
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
