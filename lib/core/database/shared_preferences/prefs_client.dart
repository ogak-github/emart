import 'package:emart/core/database/shared_preferences/prefs.dart';

class PrefsClient {
  final Prefs _sharedPreferences;

  const PrefsClient(this._sharedPreferences);

  Future<void> clear() async {
    await _sharedPreferences.load();
    await _sharedPreferences.clear();
  }

  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreferences.load();
    await _sharedPreferences.setString(PrefKey.authToken, authToken);
  }

  String get getAuthToken {
    _sharedPreferences.load();
    return _sharedPreferences.getString(PrefKey.authToken) ?? "";
  }

  Future<bool> removeAuthToken() async {
    await _sharedPreferences.load();
    return _sharedPreferences.remove(PrefKey.authToken);
  }

  Future<void> saveIsLogin(bool value) async {
    await _sharedPreferences.load();
    await _sharedPreferences.setBool(PrefKey.isLogin, value);
  }

  bool get isLogin {
    _sharedPreferences.load();
    return _sharedPreferences.getBool(PrefKey.isLogin) ?? false;
  }
}

mixin PrefKey {
  static const String isLogin = "login";
  static const String authToken = "authToken";
}
