import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordSuccessChange extends StatefulWidget {
  const PasswordSuccessChange({Key? key}) : super(key: key);

  @override
  State<PasswordSuccessChange> createState() => _PasswordSuccessChangeState();
}

class _PasswordSuccessChangeState extends State<PasswordSuccessChange> {
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
            width: double.infinity,
            padding: const EdgeInsets.only(top: 100, left: 75, right: 76),
            child: const Image(
              alignment: Alignment.center,
              image: AssetImage("assets/images/password_success_change.png"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) + 10),
            child: Column(
              children: [
                Text(
                  "password_successfully_changed".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.kBlackColor),
                ),
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity,
                  height: 35.h,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.kBlackColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Get.offAndToNamed(AppRoutes.loginScreen);
                    },
                    child: Text(
                      "login_camel".tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
