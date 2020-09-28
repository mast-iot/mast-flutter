import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mast/blocs/param_bloc.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/data/param.dart';
import 'package:flutter_mast/repo/param_repo.dart';

class LightThumbnail extends StatefulWidget {
  final Device device;

  LightThumbnail(this.device);

  @override
  _LightThumbnailState createState() => _LightThumbnailState(device);
}

class _LightThumbnailState extends State<LightThumbnail> {
  final Device device;

  _LightThumbnailState(this.device);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Param>>(
        stream: ParamBloc(device.id).stream,
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(device.name),
                        Text(device.room?.name ?? "")
                      ],
                    ),
                    Text(device.desc ?? ""),
                    CachedNetworkImage(
                      imageUrl: device.icon,
                      width: 100,
                      height: 80,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
