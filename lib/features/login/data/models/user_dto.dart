import '../../domain/entities/user.dart';

class UserDto {
  final String? id;
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? name;
  final String? email;
  final String? username;
  final String? image;
  final String? avatarUrl;
  final String? gender;

  const UserDto({
    this.id,
    this.userId,
    this.firstName,
    this.lastName,
    this.name,
    this.email,
    this.username,
    this.image,
    this.avatarUrl,
    this.gender,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      gender: json['gender'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (image != null) 'image': image,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (gender != null) 'gender': gender,
    };
  }

  User toDomain() {
    return User(
      id: id ?? userId ?? 'unknown',
      name: firstName != null || lastName != null
          ? [firstName, lastName].whereType<String>().join(' ').trim()
          : (name ?? username ?? 'User'),
      email: email ?? '',
      username: username,
      avatarUrl: avatarUrl ?? image,
      gender: gender,
    );
  }

  static UserDto fromDomain(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      username: user.username,
      avatarUrl: user.avatarUrl,
      image: user.avatarUrl,
      gender: user.gender,
    );
  }
}
