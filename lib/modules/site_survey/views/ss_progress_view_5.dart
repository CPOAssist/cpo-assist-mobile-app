import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SSProgressViewFive extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressViewFive({Key? key, this.siteSurveyController})
      : super(key: key);

  @override
  State<SSProgressViewFive> createState() => _SSProgressViewFiveState();
}

class _SSProgressViewFiveState extends State<SSProgressViewFive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage("assets/images/ss_submitted_successfully.png")),
          SizedBox(height: 20.h),
          Text(
            "site_survey_successful_msg".tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.kBlackColor),
          ),
        ],
      ),
    );
  }
}
