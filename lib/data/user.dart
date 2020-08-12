class LoginResult {
  int _id;
  String _image;
  String _mobile;
  String _name;
  String _token;

  int get id => _id;
  String get image => _image;
  String get mobile => _mobile;
  String get name => _name;
  String get token => _token;

  LoginResult({
      int id,
    String image,
      String mobile,
      String name,
      String token}){
    _id = id;
    _image = image;
    _mobile = mobile;
    _name = name;
    _token = token;
}

  LoginResult.fromJson(dynamic json) {
    _id = json["id"];
    _image = json["image"];
    _mobile = json["mobile"];
    _name = json["name"];
    _token = json["token"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["image"] = _image;
    map["mobile"] = _mobile;
    map["name"] = _name;
    map["token"] = _token;
    return map;
  }

}
