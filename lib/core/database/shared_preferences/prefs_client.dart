import 'package:emart/core/database/shared_preferences/prefs.dart';

class PrefsClient {
  final Prefs _sharedPreferences;

  const PrefsClient(this._sharedPreferences);

  Future<bool> removeKey(String key) async {
    final remove = await _sharedPreferences.remove(key);
    return remove;
  }

  Future<void> saveAuthToken(String authToken) async {
    await _sharedPreferences.setString(PrefKey.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreferences.remove(PrefKey.authToken);
  }

  Future<String?> getAuthToken(String key) async {
    final getToken = await _sharedPreferences.getString(key);
    return getToken;
  }

}

mixin PrefKey {
  static const String isLogin = "login";
  static const String authToken = "authToken";
}
