import 'dart:ui';

import "package:flutter/material.dart";
import "main.dart";

const IP_ADDRESS = "10.0.2.2:3000";

class LoginPage extends StatelessWidget {
  
  void _handleLogin(BuildContext context) {
    Navigator.pushReplacementNamed(context, AuthRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(216, 253, 255, 1.0)
              image: DecorationImage(
                image: AssetImage("assets/images/books.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.3), BlendMode.dstATop),
              ),
              color: Colors.white,
            ) ,
          ),
          Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  constraints: BoxConstraints.expand(height: 230.0),
                  child: Image.asset('assets/images/logo3.png'),
                ),
                SizedBox(
                  height: 100.0,
                  child: Container(
                    // color: Color.fromRGBO(216, 253, 255, 1.0)
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50.0,
                        ),
                        SizedBox(
                          width: 300.0,
                          height: 45.0,
                          child: RaisedButton(
                            color: Color.fromRGBO(110, 228, 236, 1.0),
                            onPressed: () => this._handleLogin(context),
                            child: Text("GET STARTED", style: Theme.of(context).textTheme.headline2,),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ), 
                ),
              ]
            ),   
          )     
        ],)
    );
  }
}