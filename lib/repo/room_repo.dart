import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/helper/request_wrap.dart';

class RoomRepo {

  RequestWrap request;

  RoomRepo(BuildContext context) : this.request = RequestWrap(context);

  Future<List<Room>> roomList() async {
    String url = host + "/room/list";
    Response response = await request.get(getOption, url);
    List<Room> list = [];
    for (var item in response.data["data"]) {
      list.add(Room.fromJson(item));
    }
    return list;
  }
}
