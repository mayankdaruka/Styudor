import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  // var maskFormatter = new MaskTextInputFormatter(mask: '+# (###) ###-####', filter: { "#": RegExp(r'[0-9]') });
  var maskFormatter = new MaskTextInputFormatter(mask: '(###) ###-####', filter: { "#": RegExp(r'[0-9]') });
  Color buttonColor;
  String _smsCode;
  String _verificationId; 

  final _phoneController = TextEditingController();

  void initState() {
    super.initState();
    _phoneController.addListener(_printLatestValue);
    buttonColor = Color.fromRGBO(110, 228, 236, 1.0);
  }

  Future<void> _verifyPhone(String phoneNo) async {
    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this._verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this._verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential authResult) {
      FirebaseAuth.instance.signInWithCredential(authResult);
    };

    final PhoneVerificationFailed verifiedFailed = (AuthException authException) {
      print(authException.message);
    };
    
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      codeAutoRetrievalTimeout: autoTimeout,
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifiedFailed,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
    );
  }

  void _handlePhoneAuthentication() {
    if (buttonColor == Colors.teal) {
      print("Button Clicked!");
      var cleaned = "";
      final numbers = RegExp(r'^[0-9]$');
      for (var character in _phoneController.text.split("")) {
        if (numbers.hasMatch(character)) {
          cleaned += character;
        }
      }
      print("Cleaned number: $cleaned");
      _verifyPhone(cleaned);
      Navigator.pushNamed(context, PhoneAuthRoute, arguments: {'number': cleaned});
    }
  }

  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    if (_phoneController.text.length == 14) {
      this.setState(() {buttonColor = Colors.teal; });
      print("Phone text field: ${_phoneController.text}");
    } else {
      this.setState(() {buttonColor = Color.fromRGBO(110, 228, 236, 1.0); });
    }
  }

  void _handleBackPage(BuildContext context) {
    Navigator.pushNamed(context, LoginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    child: Text("ENTER YOUR MOBILE NUMBER", 
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                  ),
                  Container(
                    child: Text("A code will be sent to verify your phone",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(90.0, 5.0, 90.0, 30.0),
            child: TextField(
              controller: _phoneController,
              inputFormatters: [
                maskFormatter,
              ],
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                prefixText: "+1 ",
              ),
            ),
          ),
          SizedBox(
            width: 320.0,
            height: 45.0,
            child: RaisedButton(
              // color: Color.fromRGBO(110, 228, 236, 1.0),
              color: buttonColor,
              onPressed: () => this._handlePhoneAuthentication(),
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
            width: 320.0,
            height: 45.0,
            child: RaisedButton(
              color: Colors.white,
              onPressed: () => this._handleBackPage(context),
              child: Text("GO BACK", style: Theme.of(context).textTheme.headline3),
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ],
      )
    );
  }
}