import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/blocs/param_bloc.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/data/param.dart';
import 'package:flutter_mast/repo/param_repo.dart';
import 'package:xlive_switch/xlive_switch.dart';

class LightThumbnail extends StatefulWidget {
  final Device device;

  LightThumbnail(this.device);

  @override
  _LightThumbnailState createState() => _LightThumbnailState(device);
}

class _LightThumbnailState extends State<LightThumbnail> {
  final Device device;
  bool _value = true;
  BuildContext _context;

  _LightThumbnailState(this.device);

  @override
  Widget build(BuildContext context) {
    _context = context;
    return StreamBuilder<List<Param>>(
        stream: ParamBloc(device.id).stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(device.name),
                        Text("(" + (device.room?.name ?? "") + ")")
                      ],
                    ),
                    Text(device.desc ?? ""),
                    CachedNetworkImage(
                      imageUrl: device.icon,
                      width: 100,
                      height: 60,
                    ),
                  ],
                ),
                XlivSwitch(value: _value, onChanged: _onSwitchChange)
              ],
            ),
          );
        });
  }

  void _onSwitchChange(bool value) {
    ParamRepo(_context)
        .update({"id": device.id, "value": value ? "1" : "0"}).then(
            (value) => setState(() {
                  _value = value == 1;
                }));
  }
}
