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
                  height: 60.0,
                ),
                Container(
                  constraints: BoxConstraints.expand(height: 170.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 60.0,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 5.0),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      labelText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(15.0),
                      )
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 0.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    maxLength: 20,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      labelText: "Password"
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