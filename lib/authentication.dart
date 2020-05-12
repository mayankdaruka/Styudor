import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  @override
  _PhoneAuthState createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
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
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(70.0, 5.0, 70.0, 5.0),
            child: TextField(
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                // border: InputBorder.none
                // fillColor: Color.fromRGBO(235, 235, 235, 1.0),
                // filled: true,
                prefixText: "+1 ",
              ),
            ),
          ),
        ],
      )
    );
  }
}