/// desc : "客厅插座"
/// device_type : "socket"
/// group : {"id":1,"name":"分组_客厅"}
/// icon : "http://static.theoxao.com/img/image1.jpeg"
/// id : 1
/// name : "插座"
/// room : {"desc":"客厅某个插座","id":1,"name":"客厅"}

class Device {
  String _desc;
  String _deviceType;
  Group _group;
  String _icon;
  int _id;
  String _name;
  Room _room;

  String get desc => _desc;

  String get deviceType => _deviceType;

  Group get group => _group;

  String get icon => _icon;

  int get id => _id;

  String get name => _name;

  Room get room => _room;

  Device(
      {String desc,
      String deviceType,
      Group group,
      String icon,
      int id,
      String name,
      Room room}) {
    _desc = desc;
    _deviceType = deviceType;
    _group = group;
    _icon = icon;
    _id = id;
    _name = name;
    _room = room;
  }

  Device.fromJson(dynamic json) {
    _desc = json["desc"];
    _deviceType = json["deviceType"];
    _group = json["group"] != null ? Group.fromJson(json["group"]) : null;
    _icon = json["icon"];
    _id = json["id"];
    _name = json["name"];
    _room = json["room"] != null ? Room.fromJson(json["room"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = _desc;
    map["deviceType"] = _deviceType;
    if (_group != null) {
      map["group"] = _group.toJson();
    }
    map["icon"] = _icon;
    map["id"] = _id;
    map["name"] = _name;
    if (_room != null) {
      map["room"] = _room.toJson();
    }
    return map;
  }
}

/// desc : "客厅某个插座"
/// id : 1
/// name : "客厅"

class Room {
  String _desc;
  int _id;
  String _name;
  String _image;
  List<Device> _devices;

  String get desc => _desc;

  String get image => _image;

  List<Device> get devices => _devices;

  int get id => _id;

  String get name => _name;

  Room({String desc, int id, String name, List<Device> devices, String image}) {
    _desc = desc;
    _id = id;
    _name = name;
    _devices = devices;
    _image = image;
  }

  Room.fromJson(dynamic json) {
    _desc = json["desc"];
    _id = json["id"];
    _name = json["name"];
    _image = json["image"];
    if (json["devices"] != null) {
      _devices = [];
      json["devices"].forEach((v) {
        _devices.add(Device.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = _desc;
    map["id"] = _id;
    map["name"] = _name;
    map["image"] = _image;
    if (_devices != null) {
      map["devices"] = _devices.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "分组_客厅"

class Group {
  int _id;
  String _name;

  int get id => _id;

  String get name => _name;

  Group({int id, String name}) {
    _id = id;
    _name = name;
  }

  Group.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}
