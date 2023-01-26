import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
      color: AppColors.kPrimaryColor,
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: (MediaQuery.of(context).size.width * 0.9),
              height: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/images/main_icon.svg',
                    color: Colors.white,
                  ),
                  Text(
                    "Hello ${DatabaseOperation.databaseOperation.getFirstName()}",
                    style: TextStyle(fontSize: 24.sp, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.profileScreen);
                    },
                    child: Container(
                      width: 56.w,
                      height: 56.w,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.kBlackColor),
                      child: SvgPicture.asset(
                        'assets/images/profile.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.h,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      selectedDrawerIndex = 2;
                      Get.offAndToNamed(AppRoutes.siteSurveyList);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/site_survey.svg',
                          width: 25.w,
                          height: 25.w,
                          color: AppColors.kBlackColor,
                        ),
                        Expanded(
                          child: Text(
                            "site_survey".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      selectedDrawerIndex = 3;
                      Get.offAndToNamed(AppRoutes.installation);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/installation.svg',
                          width: 25.w,
                          height: 25.w,
                          color: AppColors.kBlackColor,
                        ),
                        Expanded(
                          child: Text(
                            "installation".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      selectedDrawerIndex = 4;
                      Get.offAndToNamed(AppRoutes.commissioning);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/commissioning.svg',
                          width: 25.w,
                          height: 25.w,
                          color: AppColors.kBlackColor,
                        ),
                        Expanded(
                          child: Text(
                            "commissioning".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60.h,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      selectedDrawerIndex = 5;
                      Get.offAndToNamed(AppRoutes.supportTicket);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/support_ticket.svg',
                          width: 25.w,
                          height: 25.w,
                          color: AppColors.kBlackColor,
                        ),
                        Expanded(
                          child: Text(
                            "support_tickets".tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: AppColors.kBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void siteSurveyOperation() {}

  void installationOperation() {}

  void commissioningOperation() {}

  void supportTicketOperation() {}
}
