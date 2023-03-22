import 'dart:async';

import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? version;

  @override
  void initState() {
    super.initState();
    getVersion();

    Timer(const Duration(seconds: 2), () async {
      if(DatabaseOperation.databaseOperation.getEmail()!.isNotEmpty) {
        Get.offAndToNamed(AppRoutes.landingPage);
      } else {
         Get.offAndToNamed(AppRoutes.loginScreen);
      }
    });
  }

  void getVersion() async {
    version = await versionInfo();
    setState(() {

    });
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
      padding: const EdgeInsets.only(left: 30, right: 30),
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Image.asset("assets/images/cpo_assists.png", width: 267.w, height: 66.h),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "Version $version",
                style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
