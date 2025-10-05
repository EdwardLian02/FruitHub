import 'package:fruit_hub/helper/function_constant.dart';

class UserModel {
  final int id;
  final String? username;
  final String email;
  final String userPhone;
  final String profilePic;
  final DateTime dateJoined;

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.userPhone,
      required this.profilePic,
      required this.dateJoined});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'] ?? "Not set",
      email: json['email'],
      userPhone: json['user_phone'] ?? "Not set",
      profilePic: json['profile_pic'],
      dateJoined: stringToDateTimeFormatConverter(json['date_joined']),
    );
  }
}
