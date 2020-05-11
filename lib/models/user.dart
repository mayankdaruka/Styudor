class UserModel {
  final String fullname, username, id, profilePicture, resume;
  final int satScore, actScore, mcatScore, greScore, gmatScore, lsatScore;

  UserModel({
    this.fullname,
    this.username,
    this.id,
    this.profilePicture,
    this.resume,
    this.satScore,
    this.actScore,
    this.mcatScore,
    this.greScore,
    this.gmatScore,
    this.lsatScore
  });

  // Factory function - returns instance of a class
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      fullname: json['fullname'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      resume: json['resume'],
      satScore: json['SATScore'],
      actScore: json['ACTScore'],
      mcatScore: json['MCATScore'],
      greScore: json['GREScore'],
      gmatScore: json['GMATScore'],
      lsatScore: json['LSATScore'],
    );
  }
}