import 'package:flutter/material.dart';
import 'package:tutoring/models/user.dart';
import 'api.dart';

class UserList extends StatelessWidget {
  final Future<List<UserModel>> _users = getUsers();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<UserModel>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return Container(
                  child: Text(snapshot.data[i].greScore.toString()),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}