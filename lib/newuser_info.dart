import 'package:flutter/material.dart';
import 'api.dart';

class NewUserInfo extends StatefulWidget {
  @override
  _NewUserInfoState createState() => _NewUserInfoState();
}

class _NewUserInfoState extends State<NewUserInfo> {
  // final _firstNameController = TextEditingController();
  // final _lastNameController = TextEditingController();
  // final _resumeController = TextEditingController();
  // final _profilePicController = TextEditingController();
  // final _satController = TextEditingController();
  // final _actController = TextEditingController();
  // final _mcatController = TextEditingController();
  // final _gmatController = TextEditingController();
  // final _lsatController = TextEditingController();

  String _satValue;
  String _actValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _satValue = "N/A";
    _actValue = "N/A";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            child: Text("First Name", style: Theme.of(context).textTheme.headline4,),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
            child: TextField(

            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            child: Text("Last Name", style: Theme.of(context).textTheme.headline4,),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
            child: TextField(
              
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            child: Text("SAT Score", style: Theme.of(context).textTheme.headline4,),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[  
              DropdownButton<String>(
              value: _satValue,
              onChanged: (String newValue) {
                setState(() {
                  _satValue = newValue;
                });
              },
              items: <String>['N/A','400', '410', '420', '430', '440', '450', '460', '470', '480', '490', '500', '510', '520', '530', '540', '550', '560', '570', '580', '590', '600', '610', '620', '630', '640', '650', '660', '670', '680', '690', '700', '710', '720', '730', '740', '750', '760', '770', '780', '790', '800', '810', '820', '830', '840', '850', '860', '870', '880', '890', '900', '910',
              '920', '930', '940', '950', '960', '970', '980', '990', '1000', '1010', '1020', '1030', '1040', '1050', '1060', '1070', '1080', '1090', '1100', '1110', '1120', '1130', '1140', '1150', '1160', '1170', '1180', '1190', '1200', '1210', '1220', '1230', '1240', '1250', '1260', '1270', '1280', '1290', '1300', '1310', '1320', '1330', '1340', '1350', '1360', '1370', '1380', '1390', '1400', '1410',
              '1420', '1430', '1440', '1450', '1460', '1470', '1480', '1490', '1500', '1510', '1520', '1530', '1540', '1550', '1560', '1570', '1580', '1590', '1600']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: Theme.of(context).textTheme.headline5),
                  );
                })
                .toList(),
              ),
            ]
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            child: Text("ACT Score", style: Theme.of(context).textTheme.headline4,),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[  
              DropdownButton<String>(
              value: _actValue,
              onChanged: (String newValue) {
                setState(() {
                  _actValue = newValue;
                });
              },
              items: <String>['N/A','1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36',]
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: Theme.of(context).textTheme.headline5),
                  );
                })
                .toList(),
              ),
            ]
          ),
        ],
      ),
    );
  }
}