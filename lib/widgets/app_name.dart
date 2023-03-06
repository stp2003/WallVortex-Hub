import 'package:flutter/material.dart';

Widget appName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      Text(
        'WallVortex',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'poppins_bold',
          fontSize: 23.0,
          letterSpacing: 1.2,
        ),
      ),
      SizedBox(width: 8.0),
      Text(
        'Hub',
        style: TextStyle(
          color: Colors.orange,
          fontFamily: 'poppins_bold',
          fontSize: 23.0,
          letterSpacing: 1.2,
        ),
      ),
    ],
  );
}
