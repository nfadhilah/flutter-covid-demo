import 'package:flutter/material.dart';

class CardInfoContent extends StatelessWidget {
  final String counter;
  final Color color;
  final IconData icon;
  final String description;
  final double iconSize;
  final double counterSize;
  final double descriptionSize;

  CardInfoContent({
    this.counter,
    this.color,
    this.icon,
    this.iconSize,
    this.counterSize,
    @required this.description,
    this.descriptionSize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: iconSize,
          ),
          Text(
            '$counter',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: counterSize,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
