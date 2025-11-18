class User {
  final String id;
  final String name;
  final String email;
  final String? username;
  final String? avatarUrl;
  final String? gender;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.username,
    this.avatarUrl,
    this.gender,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? username,
    String? avatarUrl,
    String? gender,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gender: gender ?? this.gender,
    );
  }
}
