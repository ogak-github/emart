import 'dart:developer';

import 'package:emart/core/constant/variables.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:emart/src/profile/data/model/user.dart';
import 'package:emart/src/profile/data/repository/user_interface.dart';

class UserRepository implements UserInterface {
  final DioClient _dioClient;
  final PrefsClient _prefsClient;

  UserRepository(this._dioClient, this._prefsClient);

  @override
  Future<User> getUserDetail(String userId) async {
    try {
      final response =
          await _dioClient.get("${Variables.baseUrl}/users/$userId");

      final user = User.fromJson(response.data);
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<User>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }
}
