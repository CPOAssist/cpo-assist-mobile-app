import 'package:cpo_assists/modules/login/controllers/login_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  LoginController? loginController;

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    loginController = Get.find<LoginController>();
    loginController!.oldPasswordTextEditingController.text = "";
    loginController!.newPasswordTextEditingController.text = "";
    loginController!.confirmPasswordTextEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "change_password".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: AppColors.kBlackColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: Text(
                          "old_password".tr,
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontSize: 16.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        height: 35.h,
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.kBlackColor),
                          textAlign: TextAlign.left,
                          controller:
                              loginController!.oldPasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: !isOldPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isOldPasswordVisible = !isOldPasswordVisible;
                                });
                              },
                              icon: (isOldPasswordVisible)
                                  ? Icon(Icons.visibility_off,
                                      color: AppColors.kBlackColor, size: 20.w)
                                  : Icon(Icons.visibility,
                                      color: AppColors.kBlackColor, size: 20.w),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: Text(
                          "enter_new_password".tr,
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                              fontSize: 16.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        height: 35.h,
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.kBlackColor),
                          textAlign: TextAlign.left,
                          controller:
                              loginController!.newPasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: !isNewPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isNewPasswordVisible = !isNewPasswordVisible;
                                });
                              },
                              icon: (isNewPasswordVisible)
                                  ? Icon(Icons.visibility_off,
                                      color: AppColors.kBlackColor, size: 20.w)
                                  : Icon(Icons.visibility,
                                      color: AppColors.kBlackColor, size: 20.w),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: Text(
                          "confirm_new_password".tr,
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                              fontSize: 16.sp
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        height: 35.h,
                        padding: const EdgeInsets.only(left: 38, right: 38),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 14.sp, color: AppColors.kBlackColor),
                          textAlign: TextAlign.left,
                          controller: loginController!
                              .confirmPasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscureText: !isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                });
                              },
                              icon: (isConfirmPasswordVisible)
                                  ? Icon(Icons.visibility_off,
                                      color: AppColors.kBlackColor, size: 20.w)
                                  : Icon(Icons.visibility,
                                      color: AppColors.kBlackColor, size: 20.w),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: BorderSide(
                                  color: AppColors.kBlackColor, width: 0.3.w),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Container(
                    width: double.infinity,
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.kBlackColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        bool result =
                            await loginController!.changePasswordOperation();
                        if (result) {
                          Get.offAndToNamed(AppRoutes.passwordSuccessChange);
                        }
                      },
                      child: Text(
                        "change_password".tr,
                        style: TextStyle(fontSize: 12.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
