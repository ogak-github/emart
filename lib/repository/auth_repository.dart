import 'package:emart_v2/core/database/user_setting.dart';
import 'package:emart_v2/core/interface/auth_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/dio/dio_client.dart';
import '../core/dio/dio_exception.dart';
import '../core/model/auth_response.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(dioClientProvider),
    ref.watch(userSettingProvider),
  );
});

class AuthRepository implements Authdatasource {
  final DioClient _dioClient;
  final UserSetting _dbClient;
  AuthRepository(this._dioClient, this._dbClient);

  @override
  Future<AuthResponse> login(username, password) async {
    try {
      final response = await _dioClient.post(
        "${DioClient.baseUrl}/auth/login",
        data: {
          "username": username,
          "password": password,
        },
      );
      Map<String, dynamic> resJson = {
        "code": response.statusCode,
        "token": response.data["token"],
      };
      final authToken = AuthResponse.fromJson(resJson);
      if (response.statusCode == 200) {
        response.headers.add("Authorization", authToken.token);
      }
      _dbClient.setSetting<String>("user_token", authToken.token.toString());
      return authToken;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e);
      return AuthResponse(
          code: e.type.index,
          token: e.response?.data ??
              "Something went wrong. Please try again later...");
    }
  }

  @override
  void logout() {
    _dbClient.removeSetting("user_token");
  }
}
