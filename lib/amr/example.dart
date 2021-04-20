import 'amlist_mgr.dart' as am_m;

class User extends am_m.AmDataClass<User> {
  String name = '';
  int age = 20;
  bool mozza = true;
  String phone = '0100000000';

  User({this.name, this.age, this.mozza, this.phone});

  @override
  User mapToObj(Map<String, dynamic> mapData) {
    return User(
      age: mapData['age'],
      mozza: mapData['mozza'],
      name: mapData['name'],
      phone: mapData['phone'],
    );
  }

  @override
  Map<String, dynamic> objToMap(User objData) {
    return {
      'name': objData.name,
      'age': objData.age,
      'phone': objData.phone,
      'mozza': objData.mozza,
    };
  }
}

var users = [
  User(name: 'Mona', age: 19, mozza: true, phone: '01005228466'),
  User(name: 'Mahmoud', age: 33, mozza: false, phone: '012885732855'),
  User(name: 'Asmaa', age: 32, mozza: false, phone: '016664836329'),
  User(name: 'Ibrahim', age: 50, mozza: false, phone: '012885472358'),
  User(name: 'Lila', age: 21, mozza: true, phone: '01005736542'),
];
void main(List<String> arguments) {
  var dataUsers1 = User().dataManger;
  dataUsers1.listData = users;
  //print(dataUsers.stringData);
  //dataUsers.listData.add(User(name: 'Ommmmmmmmmmmmmmmm'));
  var dataStr = dataUsers1.stringData;
  print(dataStr);
  print('============================================');
  //dataUsers.listData.removeAt(0);
  var dataUsers2 = User().dataManger;
  dataUsers2.stringData = dataStr;
  print(dataUsers2.listData);
  print(dataUsers2.listData[0].phone);
  print(dataUsers1.listData.length);
  print(dataUsers2.listData.length);
}
