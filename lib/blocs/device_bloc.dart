import 'package:flutter/material.dart';
import 'package:flutter_mast/blocs/base_bloc.dart';
import 'package:flutter_mast/repo/device_repo.dart';
import 'package:flutter_mast/data/device.dart';

class DeviceBloc extends BaseBloc<List<Device>> {
  var list;

  DeviceBloc(BuildContext context) {
    super.withContext(context);
    initDate();
  }

  void initDate() async {
    var list = await DeviceRepo(context).deviceList();
    this.list = list;
    sink.add(this.list);
  }
}
