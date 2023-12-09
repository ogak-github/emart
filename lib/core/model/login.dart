class Login {
  Login({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
