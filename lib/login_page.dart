import 'dart:ui';

import "package:flutter/material.dart";

const IP_ADDRESS = "10.0.2.2:3000";

class LoginPage extends StatelessWidget {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(216, 253, 255, 1.0)
              // color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/books.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
              ),
            ) ,
          ),
          Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                Container(
                  constraints: BoxConstraints.expand(height: 230.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  height: 300.0,
                  child: Container(
                    // color: Color.fromRGBO(216, 253, 255, 1.0)
                    color: Colors.white70,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60.0,
                        ),
                        SizedBox(
                          width: 320.0,
                          height: 45.0,
                          child: RaisedButton(
                            color: Colors.white,
                            textColor: Color.fromRGBO(110, 228, 236, 1.0),
                            onPressed: () => {},
                            child: Text("LOGIN"),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("- OR -"),
                        ),
                        SizedBox(
                          width: 320.0,
                          height: 45.0,
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color.fromRGBO(110, 228, 236, 1.0),
                            onPressed: () => {},
                            child: Text("GET STARTED"),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ), 
                )
                // Container(
                //   padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 5.0),
                //   child: TextFormField(
                //     controller: _usernameController,
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.email),
                //       // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                //       labelText: "Email",
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.black, width: 1.7),
                //         borderRadius: BorderRadius.circular(15.0),
                //       )
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                //   child: TextField(
                //     controller: _passwordController,
                //     obscureText: true,
                //     maxLength: 20,
                //     decoration: InputDecoration(
                //       prefixIcon: Icon(Icons.lock),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.black, width: 1.7),
                //         borderRadius: BorderRadius.circular(15.0),
                //       ),
                //       labelText: "Password"
                //     ),
                //   ),
                // ), 
              ]
            ),   
          )     
        ],)
    );
  }
}