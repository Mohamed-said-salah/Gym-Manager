class ParticipantsDay
{
  int _id;
  String _date;
  String _pCours1;
  String _pCours2;
  String _pCours3;
  String _pCours4;
  String _pCours5;
  String _pCours6;

  ParticipantsDay(this._date,this._pCours1,this._pCours2,this._pCours3,this._pCours4,this._pCours5,this._pCours6);
  ParticipantsDay.withId(this._id,this._date,this._pCours1,this._pCours2,this._pCours3,this._pCours4,this._pCours5,this._pCours6);
  //getter
  int get id => _id;
  String get date => _date;
  String get pCours1 => _pCours1;
  String get pCours2 => _pCours2;
  String get pCours3 => _pCours3;
  String get pCours4 => _pCours4;
  String get pCours5 => _pCours5;
  String get pCours6 => _pCours6;
  //setter
  set date(String newName){
    if(newName.length <= 255){
      this._date = newName;
    }
  }

  set pCours1(String newName){
    if(newName.length <= 255){
      this._pCours1 = newName;
    }
  }

  set pCours2(String newName){
    if(newName.length <= 255){
      this._pCours2 = newName;
    }
  }
  set pCours3(String newName){
    if(newName.length <= 255){
      this._pCours3 = newName;
    }
  }
  set pCours4(String newName){
    if(newName.length <= 255){
      this._pCours4 = newName;
    }
  }
  set pCours5(String newName){
    if(newName.length <= 255){
      this._pCours5 = newName;
    }
  }
  set pCours6(String newName){
    if(newName.length <= 255){
      this._pCours6 = newName;
    }
  }


  //convert object to a map object
  Map<String, dynamic> toMap()
  {
    var map = Map<String, dynamic> ();
    if(id !=null){
      map['id'] = _id;
    }
    map['date'] = _date;
    map['pCours1'] = _pCours1;
    map['pCours2'] = _pCours2;
    map['pCours3'] = _pCours3;
    map['pCours4'] = _pCours4;
    map['pCours5'] = _pCours5;
    map['pCours6'] = _pCours6;

    return map;
  }

  //Extract object from a MapObject
  ParticipantsDay.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];

    this._date = map['date'];
    this._pCours1 = map['pCours1'];
    this._pCours2 = map['pCours2'];
    this._pCours3 = map['pCours3'];
    this._pCours4 = map['pCours4'];
    this._pCours5 = map['pCours5'];
    this._pCours6 = map['pCours6'];

  }
}