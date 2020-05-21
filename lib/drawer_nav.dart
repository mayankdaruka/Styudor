import 'package:flutter/material.dart';
import 'main.dart';

class AppDrawer extends StatefulWidget {
  final _user;

  AppDrawer(this._user);

  @override
  _AppDrawerState createState() => _AppDrawerState(_user);
}

class _AppDrawerState extends State<AppDrawer> {
  bool _dashboardIcon;
  bool _profileIcon;
  bool _tutorIcon;
  bool _mapIcon;
  bool _helpIcon;
  final _user;

  _AppDrawerState(this._user);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashboardIcon = true;
    _profileIcon = false;
    _tutorIcon = false;
    _mapIcon = false;
    _helpIcon = false;
  }
  final emptySpace = SizedBox(
    height: 80.0,
  );
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              selected: _dashboardIcon,
              onTap: () => { 
                setState(() {
                  _dashboardIcon = true;
                  _helpIcon = false;
                  _mapIcon = false;
                  _profileIcon = false;
                  _tutorIcon = false;
                }) 
              },
            ),
            ListTile(
              leading: Icon(Icons.person,),
              title: Text('PROFILE', style: Theme.of(context).textTheme.headline4,),
              selected: _profileIcon,
              onTap: () => { 
                setState(() {
                  _dashboardIcon = false;
                  _helpIcon = false;
                  _mapIcon = false;
                  _profileIcon = true;
                  _tutorIcon = false;
                }) 
              },
            ),
            ListTile(
              leading: Icon(Icons.book,),
              title: Text('FIND A TUTOR', style: Theme.of(context).textTheme.headline4,),
              selected: _tutorIcon,
              onTap: () => { 
                setState(() {
                  _dashboardIcon = false;
                  _helpIcon = false;
                  _mapIcon = false;
                  _profileIcon = false;
                  _tutorIcon = true;
                }) 
              },
            ),
            ListTile(
              leading: Icon(Icons.map,),
              title: Text('MAP', style: Theme.of(context).textTheme.headline4,),
              selected: _mapIcon,
              onTap: () => { 
                setState(() {
                  _dashboardIcon = false;
                  _helpIcon = false;
                  _mapIcon = true;
                  _profileIcon = false;
                  _tutorIcon = false;
                }),
                Navigator.of(context).pop(),
                Navigator.of(context).pushNamed(MapRoute),
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer,),
              title: Text('HOW IT WORKS', style: Theme.of(context).textTheme.headline4,),
              selected: _helpIcon,
              onTap: () => { 
                setState(() {
                  _dashboardIcon = false;
                  _helpIcon = true;
                  _mapIcon = false;
                  _profileIcon = false;
                  _tutorIcon = false;
                }) 
              },
            ),
            emptySpace,
            SizedBox(
              height: 95.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                elevation: 0.0,
                onPressed: () => Navigator.of(context).pushReplacementNamed(LoginRoute),
                child: Text("Logout", style: Theme.of(context).textTheme.headline6,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}