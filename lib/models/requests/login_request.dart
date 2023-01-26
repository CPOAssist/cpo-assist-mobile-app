import 'dart:convert';

class LoginRequest {
  LoginRequest({this.email, this.password});

  String? email;
  String? password;

  factory LoginRequest.fromRawJson(String str) =>
      LoginRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    email: (json["email"] == null) ? null : json["email"],
    password: (json["password"] == null) ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": (email == null) ? null : email,
    "password": (password == null) ? null : password,
  };
}