import 'package:cpo_assists/modules/support_tickets/controllers/support_ticket_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupportTicketRaisingFormOne extends StatefulWidget {
  const SupportTicketRaisingFormOne({Key? key}) : super(key: key);

  @override
  State<SupportTicketRaisingFormOne> createState() =>
      _SupportTicketRaisingFormOneState();
}

class _SupportTicketRaisingFormOneState
    extends State<SupportTicketRaisingFormOne> {
  SupportTicketController? supportTicketController;

  TextStyle headerStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.kBlackTitleColor,
    fontWeight: FontWeight.w500,
  );

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w),
    borderRadius: BorderRadius.circular(16.r),
  );

  @override
  void initState() {
    super.initState();
    supportTicketController = Get.find<SupportTicketController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "support_tickets".tr,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: drawer(context),
      body: SafeArea(
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "types_of_ticket".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          style: TextStyle(fontSize: 12.sp),
                          textAlign: TextAlign.left,
                          controller: supportTicketController!
                              .typesOfTicketTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: outlineInputBorder,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "issue_reported_by".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          style: TextStyle(fontSize: 12.sp),
                          textAlign: TextAlign.left,
                          controller: supportTicketController!
                              .issueReportedByTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 10, left: 15),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: outlineInputBorder,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "issue_reporting_date_time".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(
                                    0,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        side: BorderSide(
                                            color: AppColors.kBlackBorderColor,
                                            width: 0.3.w)),
                                  ),
                                ),
                                onPressed: () async {},
                                child: Text(
                                  "date".tr,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.kBlackTitleColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.h),
                          Expanded(
                            child: SizedBox(
                              height: 35.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(
                                    0,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        side: BorderSide(
                                            color: AppColors.kBlackBorderColor,
                                            width: 0.3.w)),
                                  ),
                                ),
                                onPressed: () async {},
                                child: Text(
                                  "time".tr,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.kBlackTitleColor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "details_of_issue".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        maxLines: 6,
                        style: TextStyle(fontSize: 12.sp),
                        textAlign: TextAlign.left,
                        controller: supportTicketController!
                            .detailsOfIssueTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          enabledBorder: outlineInputBorder,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "corrective_action_to_be_taken".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        maxLines: 6,
                        style: TextStyle(fontSize: 12.sp),
                        textAlign: TextAlign.left,
                        controller: supportTicketController!
                            .correctiveActionToBeTakenTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 10, left: 15),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                          ),
                          enabledBorder: outlineInputBorder,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100.h,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                          0,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.kBlackColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: const BorderSide(color: Colors.grey)),
                        ),
                      ),
                      onPressed: () async {},
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "previous".tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Icon(
                                Icons.play_arrow_sharp,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.h),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                          0,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.kBlackColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: const BorderSide(color: Colors.white)),
                        ),
                      ),
                      onPressed: () async {
                        Get.toNamed(AppRoutes.supportTicketFormTwo);
                      },
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "next".tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.play_arrow_sharp,
                              size: 14,
                            ),
                          ),
                        ],
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
