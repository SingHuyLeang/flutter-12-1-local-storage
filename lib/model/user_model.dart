class UserModel {
  int id;
  String email;
  String password;
  UserModel({required this.id, required this.email, required this.password});
  Map<String, dynamic> fromMap() {
    return {
      "email": email,
      "password": password,
    };
  }

  UserModel.toMap(Map<String, dynamic> map)
      : id = map["id"],
        email = map["email"],
        password = map["password"];
}
