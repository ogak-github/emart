import '../model/auth_response.dart';

abstract class Authdatasource {
  Future<AuthResponse> login(String username, String password);
  void logout();
}
