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

// Future<String> newUser() async {
//   final response = await http.post('$baseURL/users/new',
//     body: json.encode({
//       'fullname': 'Yonkers Dark',
//       'username': 'yonx',
//       'profilePicture': 'idk what to put',
//       'resume': 'insert some random pdf??',
//       'SATScore': 1540,
//       'ACTScore': 35,
//       'MCATScore': 40,
//       'GREScore': 90,
//       'GMATScore': 120,
//       'LSATScore': 160,
//       'firebaseId': "random id"
//     }),
//     headers: {'Content-Type': 'application/json'});
//     // print("response statuscode " + (response.statusCode).toString());
//     if (response.statusCode == 200) {
//         return response.body;
//     } else {
//       throw Exception("There is an error.");
//     }
// }

Future<String> newUser(String firstname, String lastname, String profilePicture, String resume, int sat, int act, int mcat, int gre, int gmat, int lsat, String firebase) async {
  final response = await http.post('$baseURL/users/new',
    body: json.encode({
      'firstname': firstname,
      'lastname': lastname,
      'profilePicture': profilePicture,
      'resume': resume,
      'SATScore': sat,
      'ACTScore': act,
      'MCATScore': mcat,
      'GREScore': gre,
      'GMATScore': gmat,
      'LSATScore': lsat,
      'firebaseId': firebase
    }),
    headers: {'Content-Type': 'application/json'});
    // print("response statuscode " + (response.statusCode).toString());
    if (response.statusCode == 200) {
        return response.body;
    } else {
      throw Exception("There is an error.");
    }
}

Future<List<UserModel>> getUserById(String id) async {
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