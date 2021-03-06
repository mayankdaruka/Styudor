import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'api.dart';
import 'main.dart';

class NewUserInfo extends StatefulWidget {
  final _uid;

  NewUserInfo(this._uid);

  @override
  _NewUserInfoState createState() => _NewUserInfoState(_uid);
}

class _NewUserInfoState extends State<NewUserInfo> {
  final _uid;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _zipcodeController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(mask: '#####', filter: { "#": RegExp(r'[0-9]') });
  bool _tutor;
  Color buttonColor;
  List<bool> _selections = [false, false];

  _NewUserInfoState(this._uid);

    @override
  void initState() {
    super.initState();
    buttonColor = Colors.grey;
    _firstNameController.addListener(this._handleFirstName);
    _lastNameController.addListener(this._handleLastName);
    _zipcodeController.addListener(this._handleZipcode);
    _tutor = true;
  }

  bool oneSelected() {
    for (var element in _selections) {
      if (element) {
        return true;
      }
    }
    return false;
  }

  void checkFilled() {
    if (this._firstNameController.text.length > 0 && this._lastNameController.text.length > 0 && this._zipcodeController.text.length == 5 && oneSelected()) {
      setState(() {
        buttonColor = Color.fromRGBO(110, 228, 236, 1.0);
      });
    } else {
      setState(() {
        buttonColor = Colors.grey;
      });
    }
  }

  void _handleFirstName() {
    checkFilled();
  }

  void _handleLastName() {
    checkFilled();
  }

  void _handleZipcode() {
    checkFilled();
  }

  void _handleSubmit(BuildContext context) async {
    if (buttonColor == Theme.of(context).primaryColor) {
      print(_tutor);
      String user = await newUser(_firstNameController.text, _lastNameController.text, this._uid, _zipcodeController.text, _tutor);
      // print(user);
      Navigator.pop(context);
      getUserById(_uid).then((value) {
          Navigator.of(context).pushReplacementNamed(DashRoute, arguments: { 'userId': value[0] });
      });
      // Navigator.of(context).pushReplacementNamed(DashRoute, arguments: { 'userId': firebaseUser });
    }
  }

  final box = SizedBox(height: 30.0,);

  SizedBox submitButton(BuildContext context) {
    return SizedBox(
            width: 300.0,
            height: 45.0,
            child: RaisedButton(
              color: buttonColor,
              onPressed: () => this._handleSubmit(context),
              child: Text("CONTINUE", style: Theme.of(context).textTheme.headline2,),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          // Container(
          //   decoration: BoxDecoration(
          //     // color: Color.fromRGBO(216, 253, 255, 1.0)
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/back3.png"),
          //       fit: BoxFit.cover,
          //       colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.dstATop),
          //     ),
          //     color: Colors.white,
          //   ) ,
          // ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("First Name", style: Theme.of(context).textTheme.headline4,),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                  child: TextField(
                    controller: _firstNameController,
                    maxLength: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("Last Name", style: Theme.of(context).textTheme.headline4,),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                  child: TextField(
                    controller: _lastNameController,
                    maxLength: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: Text("Zipcode", style: Theme.of(context).textTheme.headline4,),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 0.0),
                  child: TextField(
                    inputFormatters: [
                      maskFormatter,
                    ],
                    controller: _zipcodeController,
                  ),
                ),
                box, 
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  child: Text("Join Studyor as a", style: Theme.of(context).textTheme.headline4),
                ),
                Container(
                  child: ToggleButtons(
                    children: <Widget>[
                      Container(
                        child:  Text("Student", style: Theme.of(context).textTheme.headline5),
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      ),
                      Container(
                        child:  Text("Tutor", style: Theme.of(context).textTheme.headline5),
                        padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      ),
                    ],
                    isSelected: _selections,
                    onPressed: (int index) {
                      int otherIndex;
                      if (index == 0) {
                        otherIndex = 1;
                        setState(() { _tutor = false; });
                      } else {
                        otherIndex = 0;
                        setState(() { _tutor = true; });
                      }
                      setState(() {
                        _selections[index] = !_selections[index];
                        _selections[otherIndex] = false;
                      });
                      checkFilled();
                    },
                    borderWidth: 3.0,
                  ),
                ),
                box,
                submitButton(context),
                box,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                //       child: Text("SAT Score", style: Theme.of(context).textTheme.headline4,),
                //     ),
                //     Container(
                //       padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                //       child: Text("ACT Score", style: Theme.of(context).textTheme.headline4,),
                //     ),
                //   ],
                // ),
                // Row(
                //   // crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[  
                //     DropdownButton<String>(
                //       value: _satValue,
                //       onChanged: (String newValue) {
                //         setState(() {
                //           _satValue = newValue;
                //         });
                //       },
                //       items: <String>['N/A','400', '410', '420', '430', '440', '450', '460', '470', '480', '490', '500', '510', '520', '530', '540', '550', '560', '570', '580', '590', '600', '610', '620', '630', '640', '650', '660', '670', '680', '690', '700', '710', '720', '730', '740', '750', '760', '770', '780', '790', '800', '810', '820', '830', '840', '850', '860', '870', '880', '890', '900', '910',
                //       '920', '930', '940', '950', '960', '970', '980', '990', '1000', '1010', '1020', '1030', '1040', '1050', '1060', '1070', '1080', '1090', '1100', '1110', '1120', '1130', '1140', '1150', '1160', '1170', '1180', '1190', '1200', '1210', '1220', '1230', '1240', '1250', '1260', '1270', '1280', '1290', '1300', '1310', '1320', '1330', '1340', '1350', '1360', '1370', '1380', '1390', '1400', '1410',
                //       '1420', '1430', '1440', '1450', '1460', '1470', '1480', '1490', '1500', '1510', '1520', '1530', '1540', '1550', '1560', '1570', '1580', '1590', '1600']
                //         .map<DropdownMenuItem<String>>((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: Text(value, style: Theme.of(context).textTheme.headline5),
                //           );
                //         })
                //         .toList(),
                //     ),
                //     DropdownButton<String>(
                //     value: _actValue,
                //     onChanged: (String newValue) {
                //       setState(() {
                //         _actValue = newValue;
                //       });
                //     },
                //     items: <String>['N/A','1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36',]
                //       .map<DropdownMenuItem<String>>((String value) {
                //         return DropdownMenuItem<String>(
                //           value: value,
                //           child: Text(value, style: Theme.of(context).textTheme.headline5),
                //         );
                //       })
                //       .toList(),
                //     ),
                //   ]
                // ),
              ],
            ),
          ),
        ],
      )
    );
  }
}