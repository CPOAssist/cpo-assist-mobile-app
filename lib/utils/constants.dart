import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';

const String fontFamily = "Inter";

List<String> meterConnectionType = ['Single Phase', 'Three Phase'];
List<String> yesNo = ['Yes', 'No'];
List<String> chargeMountingOption = ['Floor', 'Wall'];
List<String> civilWorkForCharger = [
  'Flooring',
  'Foundation',
  'Wall Mounting',
  'Shed/Cover'
];

List<String> footFall = [
  'More 2W',
  'More 4W',
  'Ideal for binding',
  '2W fleet',
  '3W fleet',
  '4W fleet'
];

const String latestBillTitle = "LATEST_BILL";
const String entryForParkingDocTitle = "ENTRY";
const String exitFromParkingDocTitle = "EXIT";
const String chargerMountingDocTitle = "CHARGER_MOUNTING";
const String evParkingAreaDocTitle = "PARKING_AREA";
const String nearestDbDocTitle = "NEAREST_DB";
const String overallSiteDocTitle = "OVERALL_SITE";
const String alternateSite1DocTitle = "ALTERNATIVE_SITE_1";
const String alternateSite2DocTitle = "ALTERNATIVE_SITE_2";
const String other1DocTitle = "OTHER_1";
const String other2DocTitle = "OTHER_2";

bool isHomeBack = true;

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message, backgroundColor: AppColors.kPrimaryColor);
}

void showLoader() {
  EasyLoading.show(
    //status: 'Loading...',
    maskType: EasyLoadingMaskType.black,
  );
}

void hideLoader() {
  EasyLoading.dismiss();
}

void showSnackBar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 5,
      barBlur: 0,
      backgroundColor: AppColors.kPrimaryColor,
      colorText: Colors.white);
}

void getItRegister<T extends Object>(T t, {String? name}) {
  if (GetIt.I.isRegistered<T>(instanceName: name)) {
    GetIt.I.unregister<T>(instanceName: name);
  }
  GetIt.I.registerSingleton<T>(t, instanceName: name);
}

void logout() {
  DatabaseOperation.databaseOperation.clearApplicationUtils();
  Get.offNamedUntil(AppRoutes.loginScreen, (route) => false);
}

Future<String> versionInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String version = packageInfo.version;
  // String buildNumber = packageInfo.buildNumber;

  return version;
}

Future<bool> onBackPressed() async {
  Get.offAndToNamed(AppRoutes.landingPage);
  return true;
}

void onLogout(BuildContext context) {
  showDialog(
    context: context,
    builder: ((BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        child: SizedBox(
          height: 180,
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      16.r,
                    ),
                    topRight: Radius.circular(
                      16.r,
                    ),
                  ),
                ),
                child: Text(
                  "logout_app".tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "logout_question".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                        onPressed: () {
                          logout();
                        },
                        child: Text("logout".tr,
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "dismiss".tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
}

Future<String> pickUpFileDialog(BuildContext context) async {
  String from = "Storage";
  await showDialog(
    context: context,
    builder: ((BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.r),
          ),
        ),
        child: SizedBox(
          height: 180,
          child: Column(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      16.r,
                    ),
                    topRight: Radius.circular(
                      16.r,
                    ),
                  ),
                ),
                child: Text(
                  "Pickup Options".tr,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Please choose pickup option".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                        onPressed: () {
                          from = "Camera";
                          Get.back();
                        },
                        child: Text("Camera".tr,
                            textScaleFactor: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                        onPressed: () {
                          from = "Storage";
                          Get.back();
                        },
                        child: Text(
                          "Storage".tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }),
  );
  return from;
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

int selectedDrawerIndex = 0;

Widget drawer(BuildContext context) {
  return SafeArea(
    child: Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 10.h),
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    accountName: Text(
                      "",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.kBlackColor,
                          fontWeight: FontWeight.w600),
                    ),
                    accountEmail: const Text(
                      "",
                    ),
                    currentAccountPictureSize: const Size(500, 72),
                    currentAccountPicture: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.kBlackColor),
                          child: SvgPicture.asset('assets/images/profile.svg',
                              color: Colors.white, width: 50.w, height: 50.w),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "${DatabaseOperation.databaseOperation.getFirstName()} ${DatabaseOperation.databaseOperation.getLastName()}",
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 0),
                    leading: SvgPicture.asset('assets/images/home.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 0)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "home".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 0)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      selectedDrawerIndex = 0;
                      Get.back();
                      Get.offAndToNamed(AppRoutes.landingPage);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 1),
                    leading: SvgPicture.asset('assets/images/profile.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 1)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "profile".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 1)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      //selectedDrawerIndex = 1;
                      Get.back();
                      Get.toNamed(AppRoutes.profileScreen);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 2),
                    leading: SvgPicture.asset('assets/images/site_survey.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 2)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "site_survey".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 2)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      selectedDrawerIndex = 2;
                      Get.back();
                      Get.offAndToNamed(AppRoutes.siteSurveyList);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 3),
                    leading: SvgPicture.asset('assets/images/installation.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 3)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "installation".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 3)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      selectedDrawerIndex = 3;
                      Get.back();
                      Get.offAndToNamed(AppRoutes.installation);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 4),
                    leading: SvgPicture.asset('assets/images/commissioning.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 4)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "commissioning".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 4)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      selectedDrawerIndex = 4;
                      Get.back();
                      Get.offAndToNamed(AppRoutes.commissioning);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 5),
                    leading: SvgPicture.asset(
                        'assets/images/support_ticket.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 5)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "support_tickets".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 5)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      selectedDrawerIndex = 5;
                      Get.back();
                      Get.offAndToNamed(AppRoutes.supportTicket);
                    },
                  ),
                  ListTile(
                    dense: true,
                    selected: (selectedDrawerIndex == 6),
                    leading: SvgPicture.asset('assets/images/settings.svg',
                        width: 16.w,
                        height: 16.w,
                        alignment: Alignment.center,
                        color: (selectedDrawerIndex == 6)
                            ? AppColors.kPrimaryColor
                            : AppColors.kBlackColor),
                    title: Text(
                      "settings".tr,
                      style: TextStyle(
                          color: (selectedDrawerIndex == 6)
                              ? AppColors.kPrimaryColor
                              : AppColors.kBlackColor,
                          fontSize: 12.sp),
                      textScaleFactor: 1,
                    ),
                    onTap: () {
                      //selectedDrawerIndex = 6;
                      Get.back();
                      Get.toNamed(AppRoutes.settings);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              dense: true,
              leading: SvgPicture.asset('assets/images/logout.svg',
                  width: 16.w, height: 16.w, alignment: Alignment.center),
              title: Text(
                "logout".tr,
                style: TextStyle(color: AppColors.kBlackColor, fontSize: 12.sp),
                textScaleFactor: 1,
              ),
              onTap: () {
                onLogout(context);
              },
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );
}
