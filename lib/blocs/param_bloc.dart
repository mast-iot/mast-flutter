import 'package:flutter_mast/blocs/base_bloc.dart';
import 'package:flutter_mast/data/param.dart';
import 'package:flutter_mast/repo/param_repo.dart';

class ParamBloc extends BaseBloc<List<Param>> {
  var list;

  ParamBloc(deviceId) {
    initDate(deviceId);
  }

  void initDate(deviceId) async {
    var list = await ParamRepo(context).paramList(deviceId);
    this.list = list;
    sink.add(this.list);
  }
}
