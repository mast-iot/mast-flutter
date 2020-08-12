import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'common/common.dart';
import 'ui/pages/home_page.dart';

void main() {
//  debugPaintSizeEnabled =true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
