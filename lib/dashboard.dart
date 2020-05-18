import 'package:flutter/material.dart';
import 'api.dart';

class DashBoard extends StatelessWidget {
  final _user;

  DashBoard(this._user);

  // final user = getUserByFirebaseId(_uid);
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_user),
    );
  }
}