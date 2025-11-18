import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<bool> isAuthenticated();

  Future<User?> getCurrentUser();

  Future<void> saveUser(User user);

  Future<User?> getSavedUser();
}

