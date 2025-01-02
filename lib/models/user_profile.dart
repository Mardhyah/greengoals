// models/user_profile.dart
class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String profileImage;

  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.profileImage,
  });

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      profileImage: map['profileImage'] ?? 'assets/image/profile.jpg',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'profile_image': profileImage,
    };
  }
}