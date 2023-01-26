import 'package:cpo_assists/models/responses/site_survey_response.dart'
    as ss_assign_response;
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:cpo_assists/utils/cpo_units_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SSInitialView extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSInitialView({Key? key, this.siteSurveyController}) : super(key: key);

  @override
  State<SSInitialView> createState() => _SSInitialViewState();
}

class _SSInitialViewState extends State<SSInitialView> {
  ss_assign_response.SiteSurveyObjectRequests? siteSurveyObjectRequests;

  TextStyle headerStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.kBlackTitleColor,
    fontWeight: FontWeight.w500,
  );

  TextStyle textFieldTextStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w500,
  );

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w),
    borderRadius: BorderRadius.circular(16.r),
  );

  @override
  void initState() {
    super.initState();
    siteSurveyObjectRequests = GetIt.I<Map<String, dynamic>>(
        instanceName: "site_survey")['siteSurveyObjectRequest'];

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.siteSurveyController!.siteIdTextController.text =
          siteSurveyObjectRequests!.site!.id!.toString();
      widget.siteSurveyController!.salesHandlerTextController.text = "${siteSurveyObjectRequests!.site?.handler?.firstName} ${siteSurveyObjectRequests!.site?.handler?.lastName}";
      widget.siteSurveyController!.contactNumberTextController.text =
          siteSurveyObjectRequests!.contactNumber ?? "";
      widget.siteSurveyController!.siteNameTextController.text =
          siteSurveyObjectRequests!.site!.projectName ?? "";
      widget.siteSurveyController!.branchTextController.text =
          siteSurveyObjectRequests!.site!.branch!.name ?? "";
      widget.siteSurveyController!.customerNameTextController.text = siteSurveyObjectRequests!.site?.customer?.customerName ?? "";
      widget.siteSurveyController!.siteAddressTextController.text =
          siteSurveyObjectRequests!.site!.address!.address ?? "";
      widget.siteSurveyController!.cityTextController.text =
          siteSurveyObjectRequests!.site!.address!.city!.name ?? "";
      widget.siteSurveyController!.stateTextController.text =
          siteSurveyObjectRequests!.site!.address!.city!.state!.name ?? "";
      widget.siteSurveyController!.pinCodeTextController.text =
          siteSurveyObjectRequests!.site!.address!.pincode ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "site_id".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget
                                    .siteSurveyController!.siteIdTextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                        color: AppColors.kBlackBorderColor,
                                        width: 0.3.w),
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
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "sales_handler".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget.siteSurveyController!
                                    .salesHandlerTextController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(top: 10, left: 15),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: const BorderSide(
                                        color: AppColors.kBlackBorderColor,
                                        width: 1.0),
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "contact_number".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget.siteSurveyController!
                                    .contactNumberTextController,
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
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "branch".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget
                                    .siteSurveyController!.branchTextController,
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "site_name".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          focusNode: AlwaysDisabledFocusNode(),
                          style: textFieldTextStyle,
                          textAlign: TextAlign.left,
                          controller: widget
                              .siteSurveyController!.siteNameTextController,
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
                        "customer_name".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          focusNode: AlwaysDisabledFocusNode(),
                          style: textFieldTextStyle,
                          textAlign: TextAlign.left,
                          controller: widget
                              .siteSurveyController!.customerNameTextController,
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
                        "site_address".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          focusNode: AlwaysDisabledFocusNode(),
                          style: textFieldTextStyle,
                          textAlign: TextAlign.left,
                          controller: widget
                              .siteSurveyController!.siteAddressTextController,
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "city".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget
                                    .siteSurveyController!.cityTextController,
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
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "state".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget
                                    .siteSurveyController!.stateTextController,
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
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "pin_code".tr,
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              height: 35.h,
                              child: TextField(
                                focusNode: AlwaysDisabledFocusNode(),
                                style: textFieldTextStyle,
                                textAlign: TextAlign.left,
                                controller: widget.siteSurveyController!
                                    .pinCodeTextController,
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
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "",
                              style: headerStyle,
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: double.infinity,
                              height: 35.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(
                                    0,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    AppColors.kPrimaryColor,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side:
                                          const BorderSide(color: Colors.white),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  navigateToSiteOperation();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(CPOUnits.locationArrow,
                                        size: 12),
                                    const SizedBox(width: 5),
                                    Text(
                                      "navigate_to_site".tr,
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 100.h,
            width: double.infinity,
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: 35.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(
                      0,
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.kBlackColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        side: const BorderSide(color: AppColors.kBlackColor),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    showLoader();
                    bool result = await widget.siteSurveyController!.updateSitSurvey(siteSurveyObjectRequests!.site!.id ?? 0);
                    hideLoader();
                    if(result) {
                      startSiteSurveyOperation();
                    } else {
                      showSnackBar("Error", "site_survey_status_update_issue".tr);
                    }
                  },
                  child: Text(
                    "start_site_survey".tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToSiteOperation() {}

  void startSiteSurveyOperation() {
    widget.siteSurveyController!.initialViewVisible.value = false;
    widget.siteSurveyController!.processViewVisible.value = true;
  }
}
