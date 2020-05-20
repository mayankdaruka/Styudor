import 'package:flutter/material.dart';
import 'api.dart';

class DashBoard extends StatelessWidget {
  final _user;

  DashBoard(this._user);

  // final user = getUserByFirebaseId(_uid);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.developer_board),
              title: Text('DASHBOARD'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('FIND A TUTOR'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('MAP'),
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('HOW IT WORKS'),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(_user['firstname']),
        ],
      ),
    );
  }
}