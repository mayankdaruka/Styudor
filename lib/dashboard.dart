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
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  
                ),
                child: Text(
                  _user['firstname'] + " " + _user['lastname'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,),
              ),
              ListTile(
                leading: Icon(Icons.developer_board),
                title: Text('DASHBOARD', style: Theme.of(context).textTheme.headline4,),
                
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text('FIND A TUTOR', style: Theme.of(context).textTheme.headline4,),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: Text('MAP', style: Theme.of(context).textTheme.headline4,),
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('HOW IT WORKS', style: Theme.of(context).textTheme.headline4,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}