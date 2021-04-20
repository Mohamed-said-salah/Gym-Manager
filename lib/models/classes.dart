class DayClasses {
  int _id;
  String _name;
  String _class1;
  String _class2;
  String _class3;
  String _class4;
  String _class5;
  String _class6;
  DayClasses(this._name,this._class1, this._class2, this._class3,this._class4,this._class5,this._class6);

  DayClasses.withId(this._id,this._name, this._class1, this._class2, this._class3,this._class4,this._class5,this._class6);

  //getter
  int get id => _id;
  String get name => _name;
  String get class1 => _class1;
  String get class2 => _class2;
  String get class3 => _class3;
  String get class4 => _class4;
  String get class5 => _class5;
  String get class6 => _class6;
  //setter
  set name(String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }
  set class1(String newName) {
    if (newName.length <= 255) {
      this._class1 = newName;
    }
  }

  set class2(String newName) {
    if (newName.length <= 255) {
      this._class2 = newName;
    }
  }
  set class3(String newName) {
    if (newName.length <= 255) {
      this._class3 = newName;
    }
  }
  set class4(String newName) {
    if (newName.length <= 255) {
      this._class4 = newName;
    }
  }
  set class5(String newName) {
    if (newName.length <= 255) {
      this._class5 = newName;
    }
  }
  set class6(String newName) {
    if (newName.length <= 255) {
      this._class6 = newName;
    }
  }




  //convert object to a map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['class1'] = _class1;
    map['class2'] = _class2;
    map['class3'] = _class3;
    map['class4'] = _class4;
    map['class5'] = _class5;
    map['class6'] = _class6;
    return map;
  }

  //Extract object from a MapObject
  DayClasses.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._name = map['name'];
    this._class1 = map['class1'];
    this._class2 = map['class2'];
    this._class3 = map['class3'];
    this._class4 = map['class4'];
    this._class5 = map['class5'];
    this._class6 = map['class6'];
  }
}
