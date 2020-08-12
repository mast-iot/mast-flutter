import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/helper/request_wrap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceRepo {
  RequestWrap request;

  DeviceRepo(BuildContext context) : this.request = RequestWrap(context);

  Future<List<Device>> deviceList() async {
    String url = host + "/device/list";
    Response response = await request.get(getOption, url);
    if (response == null) return null;
    List<Device> list = [];
    for (var item in response.data['data']) {
      list.add(Device.fromJson(item));
    }
    return list;
  }
}
