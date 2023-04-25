import 'package:dio/dio.dart';
import 'package:emart/core/constant/variables.dart';
import 'package:emart/core/database/shared_preferences/prefs_client.dart';
import 'package:emart/core/dio/dio_client.dart';
import 'package:emart/core/dio/dio_exceptions.dart';
import 'package:emart/src/login/data/model/login.dart';
import 'package:emart/src/login/data/model/token.dart';
import 'package:emart/src/login/data/repository/auth_interface.dart';

class AuthRepository implements AuthInterface {
  final DioClient _dioClient;
  final PrefsClient _prefsClient;
  AuthRepository(this._dioClient, this._prefsClient);

  @override
  Future<dynamic> login(Login credentials) async {
    try {
      final response = await _dioClient
          .post("${Variables.baseUrl}/auth/login/${credentials.toJson()}");
      if (response.statusCode == 200) {
        final authToken = Token.fromJson(response.data);
        response.headers.add("Authorization", authToken.token);
        _prefsClient.saveAuthToken(authToken.token);
        return response.data;
      }
      return response.data;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      return errorMessage.message;
    }
  }

  @override
  void logout() {
    _prefsClient.removeAuthToken();
  }
}
