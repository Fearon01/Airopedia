import 'package:flutter/cupertino.dart';

class RouteStack
{
  final __stack = <StatelessWidget>[];

  void Push(StatelessWidget item) => __stack.add(item);

  StatelessWidget Pop() => __stack.removeLast();

  StatelessWidget get Peek => __stack.last;

  bool get isEmpty => __stack.isEmpty;
  bool get isNotEmpty => __stack.isNotEmpty;
  int get length => __stack.length;
}