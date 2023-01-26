import 'package:cpo_assists/modules/support_tickets/controllers/support_ticket_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupportTicketRaisingFormTwo extends StatefulWidget {
  const SupportTicketRaisingFormTwo({Key? key}) : super(key: key);

  @override
  State<SupportTicketRaisingFormTwo> createState() =>
      _SupportTicketRaisingFormTwoState();
}

class _SupportTicketRaisingFormTwoState
    extends State<SupportTicketRaisingFormTwo> {
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "issue_reproduced_at_field".tr,
                          style: headerStyle,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: DropdownButtonFormField(
                            hint: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "select".tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kBlackTitleColor,
                                ),
                              ),
                            ),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                enabledBorder: outlineInputBorder,
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16.r),
                            items: yesNo
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.kBlackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
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
                        "corrective_action_taken".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      TextField(
                        maxLines: 6,
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
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "issue_resolved".tr,
                          style: headerStyle,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: DropdownButtonFormField(
                            hint: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "select".tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kBlackTitleColor,
                                ),
                              ),
                            ),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                enabledBorder: outlineInputBorder,
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16.r),
                            items: yesNo
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.kBlackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
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
                        "issue_resolution".tr,
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.file_upload_outlined,
                                        color: AppColors.kBlackTitleColor,
                                        size: 18),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "upload".tr,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kBlackTitleColor,
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
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side: BorderSide(
                                          color: AppColors.kBlackBorderColor,
                                          width: 0.3.w),
                                    ),
                                  ),
                                ),
                                onPressed: () async {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.file_upload_outlined,
                                        color: AppColors.kBlackTitleColor,
                                        size: 18),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "upload".tr,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kBlackTitleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "escalation_request".tr,
                          style: headerStyle,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: DropdownButtonFormField(
                            hint: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "select".tr,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.kBlackTitleColor,
                                ),
                              ),
                            ),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                contentPadding: const EdgeInsets.all(10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                enabledBorder: outlineInputBorder,
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                filled: true,
                                fillColor: Colors.white),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(16.r),
                            items: yesNo
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                    textScaleFactor: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.kBlackColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {},
                          ),
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
                      onPressed: () async {
                        Get.back();
                      },
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
                        Get.toNamed(AppRoutes.ticketEscalation);
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
