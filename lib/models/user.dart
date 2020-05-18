class UserModel {
  final String firstname, lastname, id, firebaseId;
  final int zipcode;
  final bool tutor;

  UserModel({
    this.firstname,
    this.lastname,
    this.id,
    this.firebaseId,
    this.zipcode,
    this.tutor,
  });

  // Factory function - returns instance of a class
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      firebaseId: json['firebaseId'],
      zipcode: json['zipcode'],
      tutor: json['tutor'],
    );
  }
}