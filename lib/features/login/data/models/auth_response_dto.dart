import 'user_dto.dart';

class AuthResponseDto {
  final String? accessToken;
  final String? accessTokenAlt;
  final String? token;
  final String? refreshToken;
  final String? refreshTokenAlt;
  final Map<String, dynamic>? data;
  final String? id;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? name;
  final String? email;
  final String? username;
  final String? image;
  final String? gender;

  const AuthResponseDto({
    this.accessToken,
    this.accessTokenAlt,
    this.token,
    this.refreshToken,
    this.refreshTokenAlt,
    this.data,
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.username,
    this.image,
    this.gender,
  });

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['accessToken'] as String?,
      accessTokenAlt: json['access_token'] as String?,
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshTokenAlt: json['refresh_token'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      gender: json['gender'] as String?,
    );
  }

  String? get accessTokenValue => data?['accessToken'] ??
      data?['access_token'] ??
      data?['token'] ??
      accessToken ??
      accessTokenAlt ??
      token;

  String? get refreshTokenValue => data?['refreshToken'] ??
      data?['refresh_token'] ??
      refreshToken ??
      refreshTokenAlt;

  UserDto toUserDto() {
    return UserDto(
      id: id ?? userId,
      userId: userId ?? id,
      firstName: firstName,
      lastName: lastName,
      name: name,
      email: email,
      username: username,
      image: image,
      gender: gender,
    );
  }
}
