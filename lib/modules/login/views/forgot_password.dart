import 'package:cpo_assists/modules/login/controllers/login_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  LoginController? loginController;

  @override
  void initState() {
    super.initState();
    loginController = Get.find<LoginController>();
    loginController!.resetEmailTextEditingController.text = "";
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
                    "forgot_password".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
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
            padding: const EdgeInsets.only(top: 100, left: 75, right: 76),
            child: const Image(
              alignment: Alignment.center,
              image: AssetImage("assets/images/forgot_password.png"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) + 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "enter_your_registered_email_address".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackColor),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: TextField(
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.kBlackColor),
                      textAlign: TextAlign.center,
                      controller:
                          loginController!.resetEmailTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 10),
                        hintText: 'email_address'.tr,
                        hintStyle:
                            TextStyle(fontSize: 12.sp, color: AppColors.kBlackTitleColor),
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
                  const SizedBox(height: 80),
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
                        //bool result = await loginController!.resetPasswordOperation();
                        //if(result) {
                        Get.offAndToNamed(AppRoutes.resetPasswordLink);
                        //}
                      },
                      child: Text("reset".tr,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
