import 'package:flutter/material.dart';

class UserCode extends StatefulWidget {

  UserCode(this._phoneNumber);

  final _phoneNumber;

  @override
  _UserCodeState createState() => _UserCodeState(_phoneNumber);
}

class _UserCodeState extends State<UserCode> {
  final _phoneNumber;

  _UserCodeState(this._phoneNumber);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_phoneNumber),
    );
  }
}