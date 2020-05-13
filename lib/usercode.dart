import 'package:flutter/material.dart';

class UserCode extends StatefulWidget {

  UserCode(this._phoneNumber);

  final _phoneNumber;

  @override
  _UserCodeState createState() => _UserCodeState(_phoneNumber);
}

class _UserCodeState extends State<UserCode> {
  String _phoneNo;
  String _smsCode;
  String _verificationID; 

  _UserCodeState(this._phoneNo);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_phoneNo),
    );
  }
}