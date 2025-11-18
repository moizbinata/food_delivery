import 'dart:convert';
import 'package:dio/dio.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/auth_response_dto.dart';
import '../models/user_dto.dart';
import '../../../../core/storage/secure_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final SecureStorageService _storage;

  AuthRepositoryImpl(this._dio, this._storage);

  @override
  Future<User> login({required String email, required String password}) async {
    final response = await _dio.post('login', data: {
      'username': email,
      'password': password,
      'expiresInMins': 30,
    });

    final data = response.data is Map ? response.data as Map<String, dynamic> 
        : jsonDecode(response.data as String) as Map<String, dynamic>;
    final dto = AuthResponseDto.fromJson(data);

    final token = dto.accessTokenValue;
    if (token == null || token.isEmpty) throw StateError('Missing access token');

    await _storage.write(key: 'access_token', value: token);
    if (dto.refreshTokenValue != null) {
      await _storage.write(key: 'refresh_token', value: dto.refreshTokenValue!);
    }

    final user = dto.toUserDto().toDomain();
    await _saveUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await _storage.delete('access_token');
    await _storage.delete('refresh_token');
    await _storage.delete('user_data');
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await _storage.read('access_token');
    return token != null && token.isNotEmpty;
  }

  @override
  Future<User?> getCurrentUser() async {
    final saved = await _getUser();
    if (saved != null) return saved;
    // TODO: Fetch from API when endpoint available
    return null;
  }

  @override
  Future<void> saveUser(User user) => _saveUser(user);

  @override
  Future<User?> getSavedUser() => _getUser();

  Future<void> _saveUser(User user) async {
    final dto = UserDto.fromDomain(user);
    await _storage.write(key: 'user_data', value: jsonEncode(dto.toJson()));
  }

  Future<User?> _getUser() async {
    final json = await _storage.read('user_data');
    if (json == null) return null;
    try {
      return UserDto.fromJson(jsonDecode(json) as Map<String, dynamic>).toDomain();
    } catch (_) {
      return null;
    }
  }
}
