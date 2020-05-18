import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tutoring/newuser_info.dart';
import 'main.dart';
import 'api.dart';

class UserCode extends StatefulWidget {

  UserCode(this._phoneNumber, this._verId);

  final _phoneNumber;
  final _verId;

  @override
  _UserCodeState createState() => _UserCodeState(_phoneNumber, _verId);
}

class _UserCodeState extends State<UserCode> {
  String _phoneNo;
  String _verificationID;
  Color buttonColor;
  var maskFormatter = new MaskTextInputFormatter(mask: '######', filter: { "#": RegExp(r'[0-9]') });
  bool _correctCode;
  int _numEntered;
  
  _UserCodeState(this._phoneNo, this._verificationID);

  final _smsController = TextEditingController();

  void initState() {
    super.initState();
    _correctCode = false;
    _numEntered = 0;
    _smsController.addListener(_handleLatestValue);
    buttonColor = Colors.grey;
  }

  void _handleLatestValue() {
      if (_smsController.text.length == 6) {
      this.setState(() {buttonColor = Color.fromRGBO(110, 228, 236, 1.0); });
      print("Code text field: ${_smsController.text}");
    } else {
      this.setState(() {buttonColor = Colors.grey; });
    }
  }

  void _handleBackPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, AuthRoute);
  }

  void _handleCodeAuth(BuildContext context) async {
    if (buttonColor == Color.fromRGBO(110, 228, 236, 1.0)) {
      AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: _verificationID, 
        smsCode: _smsController.text,
      );
      print("wait this shouldnt be happening");
      print("helloooooo");
      setState(() { _numEntered++; });
      await FirebaseAuth.instance.signInWithCredential(authCreds)
      .then((user) {
        setState(() { _correctCode = true; });
        print("List by getting ID: ");
        print(getUserById(user.user.uid).then((value) {
          print(value.length);
          if (value.length > 2) {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed(DashRoute, arguments: { 'userId': user.user.uid });
          } else {
            Navigator.of(context).pushReplacementNamed(NewUserRoute, arguments: { 'userId': user.user.uid });
          }
        }));
      })
      .catchError((e) {
        print("the error: " + e);
      });
    }
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
          //       image: AssetImage("assets/images/backg2.png"),
          //       fit: BoxFit.cover,
          //       colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.6), BlendMode.dstATop),
          //     ),
          //     color: Colors.white,
          //   ) ,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: Text("ENTER YOUR 6 DIGIT CODE", 
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                      ),
                      Container(
                        child: Text("Check your messages",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                child: (_correctCode == false && _numEntered > 0) ? Text("The code entered is not correct", style: TextStyle(color: Colors.red),) : Text("")
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(90.0, 5.0, 90.0, 30.0),
                child: TextField(
                  inputFormatters: [maskFormatter],
                  controller: _smsController,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(
                width: 300.0,
                height: 45.0,
                child: RaisedButton(
                  color: buttonColor,
                  onPressed: () => this._handleCodeAuth(context),
                  child: Text("CONTINUE", style: Theme.of(context).textTheme.headline2,),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text("- OR -", style: Theme.of(context).textTheme.headline5),
              ),
              SizedBox(
                width: 300.0,
                height: 45.0,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () => this._handleBackPage(context),
                  child: Text("ENTER A DIFFERENT NUMBER", style: Theme.of(context).textTheme.headline3),
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}