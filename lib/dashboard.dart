import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'drawer_nav.dart';

class DashBoard extends StatefulWidget {
  final _user;

  DashBoard(this._user);

  @override
  _DashBoardState createState() => _DashBoardState(_user);
}

class _DashBoardState extends State<DashBoard> {
  final _user;

  _DashBoardState(this._user);

  final emptySpace = SizedBox(
    height: 80.0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: AppDrawer(_user),
    );
  }
}