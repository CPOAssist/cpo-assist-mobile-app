import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PasswordResetMessage extends StatefulWidget {
  const PasswordResetMessage({Key? key}) : super(key: key);

  @override
  State<PasswordResetMessage> createState() => _PasswordResetMessageState();
}

class _PasswordResetMessageState extends State<PasswordResetMessage> {
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
              image: AssetImage("assets/images/password_reset_link.png"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) + 10),
            child: Column(
              children: [
                Text(
                  "reset_link_send_msg".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.kBlackColor,),
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
                        fontWeight: FontWeight.w600
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
