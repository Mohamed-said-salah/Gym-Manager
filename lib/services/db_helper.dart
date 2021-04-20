import 'package:employees/models/classes.dart';
import 'package:employees/models/emp_day_data.dart';
import 'package:employees/models/participantsDay.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:employees/models/employee.dart';

class DbHelper {
  static DbHelper _databaseHelper; //singleton DbHelper
  static Database _database; //singleton Database
  //employy
  String employeeTable = 'employee_table';
  String colId = 'id';
  String colNAme = 'name';
  String colCode = 'code';
  String colImage = 'image';
  //dayDat
  String dayData = 'EmpDayData';
  String colDate = 'date';
  String colStrData = 'strData';

  //dayClass
  String dayClassesTable ='dayClassesTable';
  String colClass1='class1';
  String colClass2='class2';
  String colClass3='class3';
  String colClass4='class4';
  String colClass5='class5';
  String colClass6='class6';

  //ParticipantsDay
  String participantsDayTable='participants';

  String colPCours1='pCours1';
  String colPCours2='pCours2';
  String colPCours3='pCours3';
  String colPCours4='pCours4';
  String colPCours5='pCours5';
  String colPCours6='pCours6';

  DbHelper._createInstance(); //named Constructor

  factory DbHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DbHelper
          ._createInstance(); //this is executed only once, singleton object
    }
    return _databaseHelper;
  }
  Future<Database> get database async
  {
    if(_database == null)
    {
      _database = await initializeDatabase();
    }
    return _database;
  }
  //initialize Database
  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'employee02.db';
    // Open/create the database at a given path
    var employeeDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return employeeDatabase;
  }

  //create Database
  void _createDb(Database db, int newVersion) async {
    await db.execute(
  'CREATE TABLE $employeeTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
  ' $colNAme TEXT, $colCode INTEGER, $colImage TEXT)');

    await db.execute('CREATE TABLE $dayData ($colDate TEXT,$colStrData TEXT)');

    //dayClassTable
    await db.execute(
        'CREATE TABLE $dayClassesTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colNAme TEXT, $colClass1 TEXT, $colClass2 TEXT, $colClass3 TEXT, $colClass4 TEXT, $colClass5 TEXT, $colClass6 TEXT)');

    //ParticipantsTable
    await db.execute(
        'CREATE TABLE $participantsDayTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colDate TEXT, $colPCours1 TEXT, $colPCours2 TEXT, $colPCours3 TEXT, $colPCours4 TEXT, $colPCours5 TEXT, $colPCours6 TEXT)');

    listMgr.listData =[EmpDayData(name: 'Employee Name',)];
    db.insert(dayData, DayData(formatDate(DateTime.now()), listMgr.stringData).toMap());


}

//Fetch P
  Future<ParticipantsDay> getPDay(String date)async
  {
    try {
      Database db = await this.database;
      var result = await db.rawQuery(
          'SELECT $colPCours1,$colPCours2,$colPCours3,$colPCours4,$colPCours5,$colPCours6 FROM $participantsDayTable WHERE $colDate = "$date"');
      return ParticipantsDay.fromMapObject(result.first);
    }catch(e)
    {
      return ParticipantsDay('','','','','','','');
    }
  }

  //INSERT P
  Future setPCourses(ParticipantsDay participantsDay)async
  {

    Database db = await this.database;
    var ____date=participantsDay.date;
    var result = await db.rawQuery(
        'SELECT $colPCours1,$colPCours2,$colPCours3,$colPCours4,$colPCours5,$colPCours6 FROM $participantsDayTable WHERE $colDate = "$____date"');
    if(result.length!=0)
    {
      print('updated');
      await db.update(participantsDayTable, participantsDay.toMap(), where: '$colDate = ?' , whereArgs: [participantsDay.date]);
    }else
      {
        print('inserted');
        await db.insert(participantsDayTable, participantsDay.toMap());
      }
  }






//FetchClasses
  Future<DayClasses> getClassesDay(String day)async
  {
    try {
      Database db = await this.database;
      var result = await db.rawQuery(
          'SELECT $colClass1,$colClass2,$colClass3,$colClass4,$colClass5,$colClass6 FROM $dayClassesTable WHERE $colNAme = "$day"');
      return DayClasses.fromMapObject(result.first);
    }catch(e)
    {
      return DayClasses('','','','','','','');
    }
  }
  //INSERTClasses
  Future setDayClasses(DayClasses dayClasses)async
  {
    Database db = await this.database;
    var ___day = dayClasses.name;
    var result = await db.rawQuery(
        'SELECT $colClass1,$colClass2,$colClass3,$colClass4,$colClass5,$colClass6 FROM $dayClassesTable WHERE $colNAme = "$___day"');
    print(result);
    if(result.length!=0) {
      await db.update(
          dayClassesTable, dayClasses.toMap(), where: '$colNAme = ?',
          whereArgs: [dayClasses.name]);
      print('Class updated');
    } else {
      await db.insert(dayClassesTable, dayClasses.toMap());
      print('Class Inserted');
    }
  }



  //Fetch Day Str Data
  Future<DayData> getDayStrData(String date)async
  {
    Database db = await this.database;
    try{
      var result = await db.rawQuery('SELECT $colDate,$colStrData FROM $dayData WHERE $colDate = "$date"');
      return DayData.fromMap(result.first);
    }catch(e){
      return DayData('','[]');
    }
  }
  // insert day str data
  Future setDayStrData(DayData __dayData)async
  {
    Database db = await this.database;
    var __date=__dayData.date;
    //await db.delete(dayData, where: '$colDate = ?' , whereArgs: [__date]);
    var result = await db.rawQuery('SELECT $colDate ,$colStrData FROM $dayData WHERE $colDate = "$__date"');
    if(result.length!=0){
      var result = await db.update(dayData, __dayData.toMap(), where: '$colDate = ?' , whereArgs: [__date]);
    }else{
      await db.insert(dayData, __dayData.toMap());
    }
  }

  //Fetch Employee Login
  Future<Map<String, dynamic>> getEmployeeMapLogin(int code)async
  {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT $colId,$colNAme,$colImage,$colCode FROM $employeeTable WHERE $colCode = $code');
    print(result);
    return result.first;
  }

  //Fetch
  Future<List<Map<String, dynamic>>>getEmployeeMapList()async
  {
    Database db = await this.database;
    var result = await db.query(employeeTable, orderBy:'$colId ASC' );
    return result;
  }

  //INSERT
  Future<int> insertEmployee(Employee employee)async
  {
    Database db = await this.database;
    var result = await db.insert(employeeTable, employee.toMap());
    return result;
  }
  //UPDATE
  Future<int> updateEmployee(Employee employee)async
  {
    Database db = await this.database;
    var result = await db.update(employeeTable, employee.toMap(), where: '$colId = ?' , whereArgs: [employee.id]);
    return result;
  }

  //DELETE
  Future<int> deleteEmployee(int id) async
  {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $employeeTable WHERE $colId = $id');
    return result;
  }

  //GET NUMBER OF EMPLOYEES
  Future<int> getNumberOfEmployee()async
  {
    Database db = await this.database;
    List<Map<String,dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $employeeTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
  //Get the Map List and Convert it to Employee List
  Future<List<Employee>> getEmployeeList() async {

    var employeeMapList = await getEmployeeMapList(); // Get 'Map List' from database
    int count = employeeMapList.length;         // Count the number of map entries in db table

    List<Employee> employeeList = List<Employee>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      employeeList.add(Employee.fromMapObject(employeeMapList[i]));
    }
    return employeeList;
  }
  //Get Employee List for Login
  Future<Employee> getEmployeeListLogin(int code) async {

    var employeeMap = await getEmployeeMapLogin(code); // Get 'Map List' from database
    return Employee.fromMapObject(employeeMap);
  }
}
