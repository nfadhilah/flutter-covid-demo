import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constant.dart';

class Spinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              'Sedang memuat data...',
              style: kSubtitleStyle,
            ),
          )
        ],
      ),
    );
  }
}