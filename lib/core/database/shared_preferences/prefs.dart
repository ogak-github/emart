import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(key, value);
  }

  Future<String?> getString(String key, {String? def}) async {
    final prefs = await SharedPreferences.getInstance();

    String? val;
    val ??= prefs.getString(key);
    val ??= def;
    return val;
  }

  Future<int?> getInt(String key, {int? def}) async {
    final prefs = await SharedPreferences.getInstance();

    int? val;
    val ??= prefs.getInt(key);
    val ??= def;
    return val;
  }

  Future<double?> getDouble(String key, {double? def}) async {
    final prefs = await SharedPreferences.getInstance();
    double? val;
    val ??= prefs.getDouble(key);
    val ??= def;
    return val;
  }

  Future<bool?> getBool(String key, {bool? def}) async {
    final prefs = await SharedPreferences.getInstance();

    bool? val;
    val ??= prefs.getBool(key);
    val ??= def;
    return val;
  }

  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(key);
    return true;
  }

  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.clear();
    return true;
  }
}
