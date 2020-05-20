import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';

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
                child: Column(
                  children: <Widget>[
                    emptySpace,
                    Text(
                      _user['firstname'] + "\n" + _user['lastname'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListTile(
                leading: Icon(Icons.developer_board,),
                title: Text('DASHBOARD', style: Theme.of(context).textTheme.headline4,),
              ),
              ListTile(
                leading: Icon(Icons.person,),
                title: Text('PROFILE', style: Theme.of(context).textTheme.headline4,)
              ),
              ListTile(
                leading: Icon(Icons.book,),
                title: Text('FIND A TUTOR', style: Theme.of(context).textTheme.headline4,),
              ),
              ListTile(
                leading: Icon(Icons.map,),
                title: Text('MAP', style: Theme.of(context).textTheme.headline4,),
              ),
              ListTile(
                leading: Icon(Icons.question_answer,),
                title: Text('HOW IT WORKS', style: Theme.of(context).textTheme.headline4,),
              ),
              emptySpace,
              SizedBox(
                height: 95.0,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  elevation: 0.0,
                  onPressed: () => Navigator.of(context).pushReplacementNamed(LoginRoute),
                  child: Text("LOG OUT", style: Theme.of(context).textTheme.headline4,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}