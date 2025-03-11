class Profile {
  final String name;
  final String email;
  final String phone;
  final String avatar;

  Profile(
      {required this.name,
      required this.email,
      required this.phone,
      required this.avatar});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'] ?? '',
    );
  }
}
