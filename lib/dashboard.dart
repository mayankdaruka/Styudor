import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  final _uid;

  DashBoard(this._uid);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_uid),
    );
  }
}