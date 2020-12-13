import 'dart:convert';

List<UserAuthentication> userAuthenticationFromJson(String str) => List<UserAuthentication>.from(json.decode(str).map((x) => UserAuthentication.fromJson(x)));

String userAuthenticationToJson(List<UserAuthentication> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserAuthentication {
  UserAuthentication({
    this.fullname,
    this.userId,
    this.email,
    this.password,
    this.phoneNumber,
    this.validity,
  });

  String fullname;
  String userId;
  String email;
  String password;
  String phoneNumber;
  String validity;

  factory UserAuthentication.fromJson(Map<String, dynamic> json) => UserAuthentication(
    fullname: json["fullname"],
    userId: json["user_id"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    validity: json["validity"],
  );

  Map<String, dynamic> toJson() => {
    "fullname": fullname,
    "user_id": userId,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
    "validity": validity,
  };
}
