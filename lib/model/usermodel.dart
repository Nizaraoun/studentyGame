class UserProfile {
  String name;
  String email;
  String phone;

  UserProfile({required this.name, required this.email, required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }
}
