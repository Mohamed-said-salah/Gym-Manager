class Employee
{
  int _id;
  String _name;
  int _code;
  String _image;

  Employee(this._name,this._code,this._image);
  Employee.withId(this._id,this._name,this._code,this._image);
  //getter
  int get id => _id;
  String get name => _name;
  int get code => _code;
  String get image => _image;
  //setter
  set name(String newName){
    if(newName.length <= 255){
      this._name = newName;
    }
  }

  set image(String newImage){
    if(newImage.length <= 255){
      this._image = newImage;
    }
  }
  set code(int newCode){
    this._code = newCode;
  }



    //convert object to a map object
   Map<String, dynamic> toMap()
   {
     var map = Map<String, dynamic> ();
     if(id !=null){
       map['id'] = _id;
     }
     map['name'] = _name;
     map['code'] = _code;
     map['image'] = _image;

     return map;
   }

   //Extract object from a MapObject
    Employee.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._name = map['name'];
    this._code = map['code'];
    this._image = map['image'];
  }
}