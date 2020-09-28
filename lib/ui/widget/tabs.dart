import 'package:flutter/material.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';

import 'device/thumbnail_widget.dart';

class DeviceTab extends StatefulWidget {
  final List<Device> list;

  DeviceTab(this.list);

  @override
  _DeviceTabState createState() => _DeviceTabState(list);
}

class _DeviceTabState extends State<DeviceTab> {
  final List<Device> _list;

  _DeviceTabState(this._list);

  @override
  Widget build(BuildContext context) {
    if (_list == null || _list.isEmpty)
      return Container(
        child: Center(
          child: Text(
            "没有设备",
            style: largerText,
          ),
        ),
        color: Colors.white,
      );
    return Container(
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.6),
        childrenDelegate: SliverChildListDelegate(_list
            .map((e) => GridTile(
          child: DeviceThumbnailWidget(e),
                ))
            .toList()),
        controller: ScrollController(keepScrollOffset: false),
      ),
      color: Colors.white,
    );
  }
}

class GroupTab extends StatefulWidget {
  final List<Device> list;

  GroupTab(this.list);

  @override
  _GroupTabState createState() => _GroupTabState();
}

class _GroupTabState extends State<GroupTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
