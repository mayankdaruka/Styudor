import "package:flutter/material.dart";

const IP_ADDRESS = "10.0.2.2:3000";

class LoginPage extends StatelessWidget {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Username",
          )), 
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Password"))]),
    );
  }
}