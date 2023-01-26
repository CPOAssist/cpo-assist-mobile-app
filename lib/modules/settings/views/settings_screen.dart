import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/cpo_units_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  TextStyle textStyle = TextStyle(fontSize: 16.sp, color: AppColors.kBlackColor);

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
                    "settings".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: InkWell(
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
            height: double.infinity,
            padding: EdgeInsets.only(
                top: 100.h, left: 30.w, right: 30.w, bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "account".tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kBlackColor,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CPOUnits.privacyPolicy, size: 24, color: AppColors.kBlackColor),
                        SizedBox(width: 10.w),
                        Text("privacy_policy".tr, style: textStyle),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow_sharp,
                      size: 18,
                      color: AppColors.kBlackColor,
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CPOUnits.security, size: 24, color: AppColors.kBlackColor),
                        SizedBox(width: 10.w),
                        Text("security".tr, style: textStyle),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow_sharp,
                      size: 18,
                      color: AppColors.kBlackColor,
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CPOUnits.deleteAccount, size: 24, color: AppColors.kBlackColor),
                        SizedBox(width: 10.w),
                        Text("delete_account".tr, style: textStyle),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow_sharp,
                      size: 18,
                      color: AppColors.kBlackColor,
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CPOUnits.helpSupport, size: 24, color: AppColors.kBlackColor),
                        SizedBox(width: 10.w),
                        Text("help_support".tr, style: textStyle),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow_sharp,
                      size: 18,
                      color: AppColors.kBlackColor,
                    )
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(CPOUnits.notifications, size: 24, color: AppColors.kBlackColor),
                        SizedBox(width: 10.w),
                        Text("notifications".tr, style: textStyle),
                      ],
                    ),
                    const Icon(
                      Icons.play_arrow_sharp,
                      size: 18,
                      color: AppColors.kBlackColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
