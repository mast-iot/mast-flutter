import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceList extends StatefulWidget {
  const DeviceList();

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  var text = "init";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: RaisedButton(
          onPressed: () async {
            await SharedPreferences.getInstance().then((sp) => sp.clear());
          },
        ),
      ),
    );
  }
}
