import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/auth_response_dto.dart';
import '../models/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  });

  Future<UserDto> getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;

  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthResponseDto> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        'login',
        data: {
          'username': email,
          'password': password,
          'expiresInMins': 30,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return AuthResponseDto.fromJson(data);
      } else if (data is String) {
        return AuthResponseDto.fromJson(
          Map<String, dynamic>.from(
            // ignore: avoid_dynamic_calls
            json.decode(data) as Map,
          ),
        );
      } else {
        throw FormatException('Unexpected response format');
      }
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final message = _extractErrorMessage(e);
      throw AuthException(
        message: message,
        statusCode: status,
        originalError: e,
      );
    }
  }

  @override
  Future<UserDto> getCurrentUser() async {
    try {
      // TODO: Implement when API endpoint is available
      // For now, return a placeholder
      throw UnimplementedError('getCurrentUser not yet implemented');
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final message = _extractErrorMessage(e);
      throw AuthException(
        message: message,
        statusCode: status,
        originalError: e,
      );
    }
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ?? e.message ?? 'Unknown error';
    } else if (data is String) {
      return data;
    }
    return e.message ?? 'Unknown error';
  }
}

class AuthException implements Exception {
  final String message;
  final int? statusCode;
  final DioException? originalError;

  AuthException({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() {
    if (statusCode != null) {
      return 'AuthException (HTTP $statusCode): $message';
    }
    return 'AuthException: $message';
  }
}

