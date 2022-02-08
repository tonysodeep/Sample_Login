class User {
  final String userName;
  final String password;
  final String email;
  final num phone;

  User({
    required this.userName,
    required this.password,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "username": userName,
      "email": email,
      "password": password,
      "phone": phone
    };
  }
}
