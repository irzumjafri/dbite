// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.userId,
    this.validity,
    this.fullname,
    this.email,
    this.password,
    this.phoneNumber,
    this.numberOfPosts,
    this.description,
    this.dateOfBirth,
    this.gender,
    this.profilePicture,
  });

  String userId;
  String validity;
  String fullname;
  String email;
  String password;
  String phoneNumber;
  String numberOfPosts;
  String description;
  DateTime dateOfBirth;
  String gender;
  String profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    validity: json["validity"],
    fullname: json["fullname"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    numberOfPosts: json["number_of_posts"],
    description: json["description"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    gender: json["gender"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "validity": validity,
    "fullname": fullname,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
    "number_of_posts": numberOfPosts,
    "description": description,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "profile_picture": profilePicture,
  };
}
