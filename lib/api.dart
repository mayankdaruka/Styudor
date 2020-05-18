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

Future<String> newUser(String firstname, String lastname, String firebase, String zipcode, bool tutor) async {
  final response = await http.post('$baseURL/users/new',
    body: json.encode({
      'firstname': firstname,
      'lastname': lastname,
      'firebaseId': firebase,
      'zipcode': zipcode,
      'tutor': tutor,
    }),
    headers: {'Content-Type': 'application/json'});
    // print("response statuscode " + (response.statusCode).toString());
    if (response.statusCode == 200) {
        return response.body;
    } else {
      throw Exception("There is an error.");
    }
}

Future<List<UserModel>> getUserByFirebaseId(String id) async {
  final response = await http.post("$baseURL/users/firebaseid",
    body: json.encode({
      'firebaseId': id,
    }),
    headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception("There is an error");
  }
}

Future<List<dynamic>> getUserById(String id) async {
  final response = await http.post("$baseURL/users/firebaseid",
    body: json.encode({
      'firebaseId': id,
    }),
    headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    // final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    // return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
    return json.decode(response.body);
  } else {
    throw Exception("There is an error");
  }
}