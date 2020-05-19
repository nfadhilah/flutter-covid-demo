import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final double size;
  final Color highlightColor;
  final Color splashColor;
  final Function callBack;

  MyIconButton({
    this.color,
    @required this.icon,
    this.size,
    @required this.callBack,
    this.highlightColor,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      iconSize: size,
      icon: Icon(icon),
      onPressed: callBack,
//      highlightColor:
//      highlightColor == null ? Colors.transparent : highlightColor,
//      splashColor: splashColor == null ? Colors.transparent : splashColor,
    );
  }
}