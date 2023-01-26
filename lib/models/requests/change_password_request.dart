import 'dart:convert';

class ChangePasswordRequest {
  ChangePasswordRequest({this.userId, this.oldPassword, this.newPassword});

  int? userId;
  String? oldPassword;
  String? newPassword;

  factory ChangePasswordRequest.fromRawJson(String str) =>
      ChangePasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        userId: (json["userId"] == null) ? null : json["userId"],
        newPassword: (json["newPassword"] == null) ? null : json["newPassword"],
        oldPassword: (json["oldPassword"] == null) ? null : json["oldPassword"],
      );

  Map<String, dynamic> toJson() => {
        "userId": (userId == null) ? null : userId,
        "newPassword": (newPassword == null) ? null : newPassword,
        "oldPassword": (oldPassword == null) ? null : oldPassword,
      };
}
