import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/modules/profile/controllers/profile_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController? profileController;

  @override
  void initState() {
    super.initState();
    profileController = Get.find<ProfileController>();

    profileController!.emailTextEditingController.text =
        DatabaseOperation.databaseOperation.getEmail();
    profileController!.mobileNumberTextEditingController.text =
        DatabaseOperation.databaseOperation.getPhoneNumber();
    profileController!.vendorNameTextEditingController.text =
        DatabaseOperation.databaseOperation.getVendorName();
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
                    getProfileName().isNotEmpty
                        ? getProfileName()
                        : "Hello John",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                InkWell(
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
            padding: const EdgeInsets.only(top: 75, left: 75, right: 76),
            child: const Image(
              alignment: Alignment.center,
              image: AssetImage("assets/images/profile.png"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2.5) + 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.kBlackColor),
                      textAlign: TextAlign.left,
                      controller: profileController!.emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15),
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
                  SizedBox(height: 30.h),
                  Container(
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.kBlackColor),
                      textAlign: TextAlign.left,
                      controller:
                          profileController!.mobileNumberTextEditingController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15),
                        hintText: 'mobile_number'.tr,
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
                  SizedBox(height: 30.h),
                  Container(
                    height: 35.h,
                    padding: const EdgeInsets.only(left: 38, right: 38),
                    child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      style: TextStyle(
                          fontSize: 14.sp, color: AppColors.kBlackColor),
                      textAlign: TextAlign.left,
                      controller:
                          profileController!.vendorNameTextEditingController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15),
                        hintText: 'vendor_name'.tr,
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
                  SizedBox(height: 30.h),
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
                        Get.toNamed(AppRoutes.changePassword);
                      },
                      child: Text(
                        "change_password".tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
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
                        logout();
                      },
                      child: Text(
                        "logout".tr,
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
          ),
        ],
      ),
    );
  }

  String getProfileName() {
    return "${DatabaseOperation.databaseOperation.getFirstName()} ${DatabaseOperation.databaseOperation.getLastName()}";
  }
}
