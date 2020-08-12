import 'package:flutter/material.dart';
import 'package:flutter_mast/data/device.dart';
import 'package:flutter_mast/ui/widget/device/thumbnails.dart';
import 'package:flutter_mast/common/common.dart';

class DeviceThumbnailWidget extends StatelessWidget {
  final Device device;

  DeviceThumbnailWidget(this.device);

  Widget getThumbnail(Device device) {
    switch (device.deviceType) {
      case "light":
        return LightThumbnail(device);
      case "ad_light":
        return Placeholder();
      case "soc5":
        return Placeholder();
      case "soc7":
        return Placeholder();
      case "ac":
        return Placeholder();
      case "lift":
        return Placeholder();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius(5)),
        elevation: 4,
        child: getThumbnail(device),
      ),
    );
  }
}
