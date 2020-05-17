class UserModel {
  final String firstname, lastname, id, firebaseId;
  final int zipcode;
  final bool tutor;

  UserModel({
    this.firstname,
    this.lastname,
    this.id,
    // this.profilePicture,
    // this.resume,
    // this.satScore,
    // this.actScore,
    // this.mcatScore,
    // this.greScore,
    // this.gmatScore,
    // this.lsatScore,
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
      // profilePicture: json['profilePicture'],
      // resume: json['resume'],
      // satScore: json['SATScore'],
      // actScore: json['ACTScore'],
      // mcatScore: json['MCATScore'],
      // greScore: json['GREScore'],
      // gmatScore: json['GMATScore'],
      // lsatScore: json['LSATScore'],
      firebaseId: json['firebaseId'],
      zipcode: json['zipcode'],
      tutor: json['tutor'],
    );
  }
}