import 'package:cpo_assists/modules/login/controllers/login_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController? loginController;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    loginController = Get.find<LoginController>();
    loginController!.emailTextEditingController.text = "";
    loginController!.passwordTextEditingController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/welcome_login_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          const Positioned(
            bottom: -72,
            right: -75,
            child: Image(
              alignment: Alignment.center,
              image: AssetImage("assets/images/login_bottom_logo.png"),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 312.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50.h),
                Image(
                  alignment: Alignment.center,
                  image: const AssetImage("assets/images/cpo_assists.png"),
                  width: 267.w,
                  height: 66.h,
                ),
                SizedBox(height: 25.h),
                Container(
                  padding: EdgeInsets.only(left: 54.r),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.sp,
                        ),
                      ),
                      SizedBox(height: 10.sp),
                      Text(
                        "Login to continue",
                        style: TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: 330.h,
                left: 10,
                right: 10,
                bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(left: 38, right: 38),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.left,
                            controller:
                                loginController!.emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.alternate_email,
                                color: AppColors.kBlackTitleColor,
                                size: 14.w,
                              ),
                              contentPadding: const EdgeInsets.only(top: 10),
                              hintText: 'email_address'.tr,
                              hintStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.kBlackTitleColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Container(
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(left: 38, right: 38),
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontSize: 14.sp,
                            ),
                            obscureText: !isPasswordVisible,
                            textAlign: TextAlign.left,
                            controller:
                                loginController!.passwordTextEditingController,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: (isPasswordVisible)
                                    ? Icon(Icons.visibility_off, size: 14.w)
                                    : Icon(Icons.visibility, size: 14.w),
                              ),
                              icon: Icon(
                                Icons.lock,
                                color: AppColors.kBlackTitleColor,
                                size: 14.w,
                              ),
                              contentPadding: const EdgeInsets.only(top: 10),
                              hintText: 'password'.tr,
                              hintStyle: TextStyle(
                                  fontSize: 12.sp, color: AppColors.kBlackTitleColor),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.r),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 38),
                          child: GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Get.toNamed(AppRoutes.forgotPassword);
                            },
                            child: SizedBox(
                              width: (MediaQuery.of(context).size.width * 0.9),
                              child: Text("forgot_password".tr,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.sp),
                  Container(
                    width: double.infinity,
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        onLogin();
                      },
                      child: Text(
                        "login_camel".tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.kPrimaryColor,
                        ),
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

  void onLogin() async {
    FocusScope.of(context).unfocus();
    bool result = await loginController!.loginOperation();
    if (result) {
      Get.offAndToNamed(AppRoutes.landingPage);
    }
  }
}
