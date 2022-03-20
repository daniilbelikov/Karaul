import 'package:flutter/material.dart';

class RouteWraper {
  static push(BuildContext context, Widget toWidget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => toWidget,
      ),
    );
  }
}
