import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/param.dart';
import 'package:flutter_mast/helper/request_wrap.dart';

class ParamRepo {
  RequestWrap request;

  ParamRepo(BuildContext context) : this.request = RequestWrap(context);

  Future<List<Param>> paramList(int deviceId) async {
    String url = host + "/param/" + deviceId.toString();
    Response response = await request.get(getOption, url);
    List<Param> list = [];
    for (var item in response.data["data"]) {
      list.add(Param.fromJson(item));
    }
    return list;
  }
}
