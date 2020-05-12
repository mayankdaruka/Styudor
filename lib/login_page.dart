import "package:flutter/material.dart";

const IP_ADDRESS = "10.0.2.2:3000";

class LoginPage extends StatelessWidget {

  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final emailField = TextField(
    // controller: _usernameController,
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.email),
      // contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      labelText: "Email",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32.0)
      ),
    ),
  );

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
                  height: 90.0,
                ),
                Container(
                  constraints: BoxConstraints.expand(height: 200.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 60.0,
                ),
                emailField,
                TextField(
                  // controller: _passwordController,
                  autofocus: true,
                  obscureText: true,
                  maxLength: 20,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    labelText: "Password"
                  ),
                ),
              ]
            ),   
          )     
        ],)
    );
  }
}