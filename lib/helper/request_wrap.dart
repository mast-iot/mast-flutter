import 'dart:convert';
import 'dart:developer';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/user.dart';
import 'package:flutter_mast/repo/user_repo.dart';
import 'package:flutter_mast/ui/pages/recent_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestWrap {
  final BuildContext context;

  RequestWrap(this.context);

  Future<Response> get(BaseOptions options, String url) async {
    try {
      var sp = await SharedPreferences.getInstance();
      var token = sp.get(SP_KEY_USER_TOKEN);
      options.headers.update(HEADER_AUTHORIZATION, (value) => token,
          ifAbsent: () => token);
      log("request @ " + url + " token is " + options.headers.toString());
      Response response = await Dio(options).get(url);
      log(response.toString(), name: url);
      int code = response.data["code"];
      String msg = response.data['msg'];
      switch (code) {
        case 200:
          return response;
        case 500:
          {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
            return null;
          }
        case 403:
          {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
            return null;
          }
      }
      return null;
    } on DioError catch (e) {
      if (e.response.statusCode == 403) {
        {
          showDialog(
            context: context,
            builder: (BuildContext builder) {
              return loginDialog(context);
            },
          );
          return null;
        }
      }
      log("request error" + e.message);
      return null;
    }
  }

  Future<Response> post(BaseOptions options, String url, dynamic data) async {
    try {
      log("request @ " + url);
      Response response = await Dio(options).post(url, data: data);
      return response;
    } on DioError catch (e) {
      log("request error");
      return null;
    }
  }

  Future<Map<String, dynamic>> login(
      BaseOptions options, String url, dynamic data) async {
    try {
      log("request @ " + url);
      Response response = await Dio(options).post(url, data: data);
      return response.data;
    } on DioError catch (e) {
      log("request error");
      return null;
    }
  }
}

class LoginRequest {
  var mobile;
  var password;
}

Widget loginDialog(BuildContext context) {
  var userRepo = UserRepo(context);
  var focusMobile = FocusNode();
  var focusPassword = FocusNode();
  var controlMobile = TextEditingController();
  var controlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 128, 16, 128),
    child: Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.only(top: 128, bottom: 64),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: ContinuousRectangleBorder(),
                  elevation: 2,
                  child: TextFormField(
                    controller: controlMobile,
                    focusNode: focusMobile,
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "手机号",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none))),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  elevation: 2,
                  shape: ContinuousRectangleBorder(),
                  child: TextFormField(
                    controller: controlPassword,
                    focusNode: focusPassword,
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "密码",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 0, style: BorderStyle.none))),
                  ),
                ),
                SizedBox(height: 32),
                RaisedButton(
                    padding:EdgeInsets.fromLTRB(150, 20, 150, 20),
                    child: Text("登录" ,style: largerWhiteText,),
                    color:primaryColor,
                    onPressed: () async {
                  if (focusMobile.hasPrimaryFocus) focusMobile.unfocus();
                  if (focusPassword.hasPrimaryFocus) focusPassword.unfocus();
                  if (_formKey.currentState.validate()) {
                    var mobile = controlMobile.text;
                    var content = Utf8Encoder().convert(controlPassword.text);
                    var password = hex.encode(md5.convert(content).bytes);
                    var response = await userRepo
                        .login({"mobile": mobile, "password": password});
                    if (response == null) {
                      await Fluttertoast.showToast(
                          msg: "登录失败",
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.red);
                      controlPassword.clear();
                      return;
                    }
                    if (response['code'] != 200) {
                      var msg = response['msg'];
                      log(msg, name: "message");
                      await Fluttertoast.showToast(
                          msg: msg,
                          gravity: ToastGravity.TOP,
                          backgroundColor: Colors.red);
                      controlPassword.clear();
                      controlMobile.clear();
                      return;
                    }
                    var result = LoginResult.fromJson(response['data']);
                    var sp = await SharedPreferences.getInstance();
                    sp.setInt(SP_KEY_USER_ID, result.id);
                    sp.setString(SP_KEY_USER_NAME, result.name);
                    sp.setString(SP_KEY_USER_MOBILE, result.mobile);
                    sp.setString(SP_KEY_USER_TOKEN, result.token);
                    sp.setString(SP_KEY_USER_IMAGE, result.image);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Recent()));
                  }
                })
              ],
            )),
      ),
    ),
  );
}
