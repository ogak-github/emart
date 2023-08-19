import '../model/user.dart';

abstract class UserInterface {
  Future<User> getUserDetail(String userId);
  Future<List<User>> getAllUsers();
}
