import 'models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String baseURL = 'http://10.0.2.2:3000';

Future<List<UserModel>> getUsers() async {
  final response = await http.get(baseURL + '/users');
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception("There is an error.");
  }
}

Future<String> newUser() async {
  final response = await http.post('$baseURL/users/new',
    body: json.encode({
      'fullname': 'Yonkers Dark',
      'username': 'yonx',
      'profilePicture': 'idk what to put',
      'resume': 'insert some random pdf??',
      'SATScore': 1540,
      'ACTScore': 35,
      'MCATScore': 40,
      'GREScore': 90,
      'GMATScore': 120,
      'LSATScore': 160
    }),
    headers: {'Content-Type': 'application/json'});
    // print("response statuscode " + (response.statusCode).toString());
    if (response.statusCode == 200) {
        return response.body;
    } else {
      throw Exception("There is an error.");
    }
}