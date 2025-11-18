import 'dart:convert';
import '../../domain/entities/user.dart';
import '../models/user_dto.dart';
import '../../../../core/storage/secure_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(String token);
  Future<String?> getAccessToken();
  Future<void> saveRefreshToken(String token);
  Future<String?> getRefreshToken();
  Future<void> saveUser(User user);
  Future<User?> getUser();
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageService _storage;
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userKey = 'user_data';

  AuthLocalDataSourceImpl(this._storage);

  @override
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  @override
  Future<String?> getAccessToken() async {
    return await _storage.read(_accessTokenKey);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _storage.read(_refreshTokenKey);
  }

  @override
  Future<void> saveUser(User user) async {
    final dto = UserDto.fromDomain(user);
    // Convert to JSON string for storage
    final jsonString = jsonEncode(dto.toJson());
    await _storage.write(key: _userKey, value: jsonString);
  }

  @override
  Future<User?> getUser() async {
    final jsonString = await _storage.read(_userKey);
    if (jsonString == null) return null;

    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      final dto = UserDto.fromJson(json);
      return dto.toDomain();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearAll() async {
    await _storage.delete(_accessTokenKey);
    await _storage.delete(_refreshTokenKey);
    await _storage.delete(_userKey);
  }
}

