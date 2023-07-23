class UserSetting {
  UserSetting({
    required this.id,
    this.authToken,
    this.isDarkMode,
    this.isLogin,
  });

  final String id;
  final bool? isLogin;
  final String? authToken;
  final bool? isDarkMode;

  factory UserSetting.fromJson(Map<String, dynamic> json) {
    return UserSetting(
      id: json['id'],
      authToken: json['authToken'],
      isDarkMode: json['isDarkMode'],
      isLogin: json['isLogin'],
    );
  }
}
