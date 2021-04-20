import 'package:employees/amr/amlist_mgr.dart' as amm;
import 'package:intl/intl.dart';

class EmpDayData extends amm.AmDataClass<EmpDayData> {
  String name;
  String image;
  int code;
  int id;
  String date;
  String arrival;
  String departure;
  int participants;
  String className;

  EmpDayData(
      {this.name,
      this.image,
      this.code,
      this.id,
      this.date,
      this.arrival,
      this.departure,
      this.participants,
      this.className});

  @override
  EmpDayData mapToObj(Map<String, dynamic> mapData) {
    return EmpDayData(
        arrival: mapData['arrival'],
        className: mapData['className'],
        code: mapData['code'],
        date: mapData['date'],
        departure: mapData['departure'],
        id: mapData['id'],
        image: mapData['image'],
        name: mapData['name'],
        participants: mapData['participants']);
  }

  @override
  Map<String, dynamic> objToMap(EmpDayData objData) {
    return {
      'arrival': objData.arrival,
      'className': objData.className,
      'code': objData.code,
      'date': objData.date,
      'departure': objData.departure,
      'id': objData.id,
      'image': objData.image,
      'name': objData.name,
      'participants': objData.participants
    };
  }
}

class DayData {
  String _date;
  String _strData;

  DayData(this._date, this._strData);

  //getter
  String get date => _date;
  String get strData => _strData;
  //setter
  set date(String newName) {
    if (newName.length <= 255) {
      this._date = newName;
    }
  }

  set strData(String newImage) {
    if (newImage.length <= 255) {
      this._strData = newImage;
    }
  }

  //convert object to a map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map = {'date': _date, 'strData': _strData};
    return map;
  }

  //Extract object from a MapObject
  factory DayData.fromMap(Map<String, dynamic> map) {
    return DayData(map['date'], map['strData']);
  }
}
var listMgr = EmpDayData().dataManger;
String formatDate(DateTime date){
  return DateFormat('yyyy-MM-dd').format(date);
}
String formatDateTime(DateTime date){
  return DateFormat('HH:mm:ss').format(date);
}