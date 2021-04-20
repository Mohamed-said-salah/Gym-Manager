import 'dart:convert';

class _DataListManger<T> {
  String _dataStr = '[]';
  List<T> _dataList = [];
  final _dataFunMap;
  bool _strSet = false;
  bool _lastSet = false;
  var _inFunDo = {};

  _DataListManger(this._dataFunMap) {
    _inFunDo = {
      'toList': () {
        List _data = jsonDecode(_dataStr);
        List<T> _list;
        _list = _data.map<T>((dynamic obj) {
          return _dataFunMap['AmToObj'](obj);
        }).toList();
        return _list;
      },
      'toStr': () {
        return json.encode(_dataList, toEncodable: _dataFunMap['AmFromObj']);
      }
    };
  }

  set stringData(String stringData) {
    _strSet = true;
    _lastSet = false;
    _dataStr = stringData;
  }

  String get stringData {
    if (_lastSet) {
      _dataStr = _inFunDo['toStr']();
    }
    return _dataStr;
  }

  set listData(List<T> listData) {
    _lastSet = true;
    _dataList = listData;
  }

  List<T> get listData {
    if (_strSet && !_lastSet) {
      _dataList = _inFunDo['toList']();
      _strSet = false;
      _lastSet = true;
    }
    return _dataList;
  }
}

abstract class AmDataClass<T> {
  var _am_C = {};

  T mapToObj(Map<String, dynamic> mapData);
  Map<String, dynamic> objToMap(T objData);

  AmDataClass() {
    _am_C = {'AmToObj': mapToObj, 'AmFromObj': objToMap};
  }

  _DataListManger<T> get dataManger {
    return _DataListManger<T>(_am_C);
  }
}
