import 'dart:async';

import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      if(DatabaseOperation.databaseOperation.getEmail()!.isNotEmpty) {
        Get.offAndToNamed(AppRoutes.landingPage);
      } else {
         Get.offAndToNamed(AppRoutes.loginScreen);
      }
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
                "Version 0.1",
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
