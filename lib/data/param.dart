class Param {
  String _desc;
  int _deviceId;
  int _id;
  String _key;
  String _options;
  String _paramType;
  String _usage;
  String _value;
  String _valueType;

  String get desc => _desc;
  int get deviceId => _deviceId;
  int get id => _id;
  String get key => _key;
  String get options => _options;
  String get paramType => _paramType;
  String get usage => _usage;
  String get value => _value;
  String get valueType => _valueType;

  Param({
      String desc, 
      int deviceId, 
      int id, 
      String key, 
      String options, 
      String paramType, 
      String usage, 
      String value, 
      String valueType}){
    _desc = desc;
    _deviceId = deviceId;
    _id = id;
    _key = key;
    _options = options;
    _paramType = paramType;
    _usage = usage;
    _value = value;
    _valueType = valueType;
}

  Param.fromJson(dynamic json) {
    _desc = json["desc"];
    _deviceId = json["deviceId"];
    _id = json["id"];
    _key = json["key"];
    _options = json["options"];
    _paramType = json["paramType"];
    _usage = json["usage"];
    _value = json["value"];
    _valueType = json["valueType"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = _desc;
    map["deviceId"] = _deviceId;
    map["id"] = _id;
    map["key"] = _key;
    map["options"] = _options;
    map["paramType"] = _paramType;
    map["usage"] = _usage;
    map["value"] = _value;
    map["valueType"] = _valueType;
    return map;
  }

}