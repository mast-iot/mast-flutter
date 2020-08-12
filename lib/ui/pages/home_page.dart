import 'dart:async';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'device.dart';
import 'recent_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer timer;

  var index = 0;
  static const _options = const<Widget>[
    Recent(),
    DeviceList()];

  static const List<BottomNavigationBarItem> items =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.find_in_page), title: Text("最近")),
    BottomNavigationBarItem(
        icon: Icon(Icons.format_align_left), title: Text("全部"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _options.elementAt(index)
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: index,
        fixedColor: primaryColor,
        onTap: (value) {
          this.setState(() {
            this.index = value;
          });
        },
      ),
    );
  }
}
