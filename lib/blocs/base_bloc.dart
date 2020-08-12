
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


abstract class BaseBloc<T>{
  BuildContext context;

  final _subject = BehaviorSubject<T>();

  BaseBloc<T> withContext(BuildContext context) {
    this.context=context;
    return this;
  }

  Stream<T> get stream => _subject.stream;

  Sink<T> get sink => _subject.sink;

  void close(){
    _subject.close();
  }
}
