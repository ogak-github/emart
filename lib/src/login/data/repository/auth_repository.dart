import 'package:dio/dio.dart';
import 'package:emart/core/constant/variables.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:emart/core/dio/dio_exceptions.dart';
import 'package:emart/src/login/data/model/login.dart';
import 'package:emart/src/login/data/model/auth_response.dart';
import 'package:emart/src/login/data/repository/auth_interface.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/shared/shared_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.read(dioClientProvider),
    ref.read(prefsClientProvider),
  );
});

class AuthRepository implements AuthInterface {
  final DioClient _dioClient;
  final PrefsClient _prefsClient;
  AuthRepository(this._dioClient, this._prefsClient);

  @override
  Future<AuthResponse> login(Login credentials) async {
    try {
      final response = await _dioClient.post(
        "${Variables.baseUrl}/auth/login",
        data: credentials.toJson(),
      );
      Map<String, dynamic> resJson = {
        "code": response.statusCode,
        "token": response.data["token"],
      };
      final authToken = AuthResponse.fromJson(resJson);
      if (response.statusCode == 200) {
        response.headers.add("Authorization", authToken.token);
      }
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
    _prefsClient.removeAuthToken();
  }
}
