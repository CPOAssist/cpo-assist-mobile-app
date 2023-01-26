import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/models/requests/change_password_request.dart';
import 'package:cpo_assists/models/requests/login_request.dart';
import 'package:cpo_assists/network/rest_services.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final resetEmailTextEditingController = TextEditingController();

  final oldPasswordTextEditingController = TextEditingController();
  final newPasswordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  Future<bool> loginOperation() async {
    try {
      showLoader();

      if (emailTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid email.");
        return false;
      }

      if (passwordTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid email.");
        return false;
      }

      if (!GetUtils.isEmail(emailTextEditingController.text)) {
        showSnackBar("information".tr, "Please enter valid email.");
        return false;
      }

      bool result = await RestServices.instance.hitLogin(LoginRequest(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text));
      if (result) {
        return true;
      }
    } finally {
      hideLoader();
    }
    return false;
  }

  Future<bool> resetPasswordOperation() async {
    try {
      showLoader();
      if (resetEmailTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid email.");
        return false;
      }

      if (!GetUtils.isEmail(resetEmailTextEditingController.text)) {
        showSnackBar("information".tr, "Please enter valid email.");
        return false;
      }

      bool result = await RestServices.instance
          .hitForgotPassword(resetEmailTextEditingController.text);
      if (result) {
        return true;
      }
    } finally {
      hideLoader();
    }
    return false;
  }

  Future<bool> changePasswordOperation() async {
    try {
      showLoader();
      if (oldPasswordTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid old password.");
        return false;
      }
      if (newPasswordTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid new password.");
        return false;
      }

      if (confirmPasswordTextEditingController.text.isEmpty) {
        showSnackBar("information".tr, "Please enter valid confirm password.");
        return false;
      }

      if (!isPasswordCompliant(newPasswordTextEditingController.text)) {
        showSnackBar("information".tr, "Please enter valid password.");
        return false;
      }

      if (newPasswordTextEditingController.text !=
          confirmPasswordTextEditingController.text) {
        showSnackBar(
            "information".tr, "New and confirm passwords are not matched.");
        return false;
      }

      bool result = await RestServices.instance.hitChangePassword(ChangePasswordRequest(
          userId: DatabaseOperation.databaseOperation.getUserId(),
          oldPassword: oldPasswordTextEditingController.text,
          newPassword: confirmPasswordTextEditingController.text));
      if(result) {
        return true;
      }
    } finally {
      hideLoader();
    }
    return false;
  }

  bool isPasswordCompliant(String password, [int minLength = 8]) {
    bool isCompliant = false;
    if (password.length < minLength || password.isEmpty) {
      return false;
    }
    if (password.contains(RegExp(r"[a-z]"))) {
      isCompliant = true;
    } else {
      isCompliant = false;
    }
    if (password.contains(RegExp(r"[A-Z]"))) {
      isCompliant = true;
    } else {
      isCompliant = false;
    }
    if (password.contains(RegExp(r"[0-9]"))) {
      isCompliant = true;
    } else {
      isCompliant = false;
    }
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      isCompliant = true;
    } else {
      isCompliant = false;
    }
    return isCompliant;
  }
}
