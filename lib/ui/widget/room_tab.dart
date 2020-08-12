import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/blocs/room_bloc.dart';
import 'package:flutter_mast/common/common.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/ui/widget/tabs.dart';

class RoomTab extends StatefulWidget {
  @override
  _RoomTabState createState() => _RoomTabState();
}

class _RoomTabState extends State<RoomTab> {
  final RoomBloc bloc = RoomBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, AsyncSnapshot<List<Room>> snapshot) {
        if (snapshot.hasData && snapshot.data.length > 0) {
          var list = snapshot.data;
          return SingleChildScrollView(
            child: Column(
              children: list.map((room) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Scaffold(
                        appBar: AppBar(title: Text(room.name)),
                        body: DeviceTab(room.devices),
                      );
                    }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Stack(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: room.image,
                            fit: BoxFit.fitWidth,
                            height: 200,
                            width: double.infinity,
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: double.infinity,
                                child: Container(
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      room.name,
                                      style: largererWhiteText,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 16,
                                  top: 0,
                                  child: count(room.devices)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        }
        return loading;
      },
    );
  }

  Widget count(List<Device> list) {
    var count = 0;
    if (list?.length != null) {
      count = list.length;
    }

    return Chip(
      label: Text(
        count.toString(),
        style: largerWhiteText,
      ),
    );
  }
}
