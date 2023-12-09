class AuthResponse {
  AuthResponse({
    required this.code,
    required this.token,
  });

  final String token;
  final int code;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        code: json['code'],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "token": token,
      };
}
