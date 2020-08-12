
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/helper/request_wrap.dart';

class UserRepo {
  RequestWrap request;

  UserRepo(BuildContext context) : this.request = RequestWrap(context);

  Future<Map<String , dynamic>> login(dynamic data) async {
    String url = host + "/login";
    var response = await request.login(BaseOptions(), url, data);
    log(response.toString());
    return response;
  }
}
