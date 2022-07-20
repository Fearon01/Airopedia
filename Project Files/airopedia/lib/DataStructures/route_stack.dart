import 'package:flutter/cupertino.dart';

class RouteStack
{
  final __stack = <Widget>[];

  void Push(Widget item) => __stack.add(item);

  Widget Pop() => __stack.removeLast();

  Widget get Peek => __stack.last;

  bool get isEmpty => __stack.isEmpty;
  bool get isNotEmpty => __stack.isNotEmpty;
  int get length => __stack.length;
}