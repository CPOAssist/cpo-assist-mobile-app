import 'package:cpo_assists/models/responses/site_survey_response.dart'
    as ss_assign_response;
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:cpo_assists/utils/cpo_units_icons.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class SSProgressViewTwo extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressViewTwo({Key? key, this.siteSurveyController})
      : super(key: key);

  @override
  State<SSProgressViewTwo> createState() => _SSProgressViewTwoState();
}

class _SSProgressViewTwoState extends State<SSProgressViewTwo> {
  ss_assign_response.SiteSurveyObjectRequests? siteSurveyObjectRequests;

  String? separateMeterLine;
  String? requirementOfEvMeter;
  String? mtConnectionType;
  final dropdownStateMeterConnectionType = GlobalKey<FormFieldState>();
  final dropdownStateSeparateLine = GlobalKey<FormFieldState>();
  final dropdownStateEvMeter = GlobalKey<FormFieldState>();

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
      mtConnectionType = siteSurveyObjectRequests!.connectionType ?? "";
      if (mtConnectionType!.isNotEmpty) {
        if (mtConnectionType!.toLowerCase().contains("single")) {
          setState(() {
            mtConnectionType = meterConnectionType[0];
          });
        } else {
          setState(() {
            mtConnectionType = meterConnectionType[1];
          });
        }
        dropdownStateMeterConnectionType.currentState?.didChange(mtConnectionType);
      }

      widget.siteSurveyController!.approvedPowerCapacityTextController.text =
          siteSurveyObjectRequests!.powerCapacity.toString() ?? "";
      widget.siteSurveyController!.siteMaxPowerDemandTextController.text =
          siteSurveyObjectRequests!.powerDemand.toString() ?? "";
      widget.siteSurveyController!.availablePowerTextController.text =
          siteSurveyObjectRequests!.availablePower.toString() ?? "";
      widget.siteSurveyController!.earthingTestValueTextController.text =
          siteSurveyObjectRequests!.earthingValue.toString() ?? "";

      setState(() {
        widget.siteSurveyController!.isSeparateLineOnExistingMeter =
            siteSurveyObjectRequests!.isSeperateLine;
        if (widget.siteSurveyController!.isSeparateLineOnExistingMeter !=
                null &&
            widget.siteSurveyController!.isSeparateLineOnExistingMeter!) {
          separateMeterLine = yesNo[0];
        } else {
          separateMeterLine = yesNo[1];
        }
        dropdownStateSeparateLine.currentState?.didChange(separateMeterLine);

        widget.siteSurveyController!.isRequirementOfEvMeter =
            siteSurveyObjectRequests!.isEvMeter;
        if (widget.siteSurveyController!.isRequirementOfEvMeter != null &&
            widget.siteSurveyController!.isRequirementOfEvMeter!) {
          requirementOfEvMeter = yesNo[0];
        } else {
          requirementOfEvMeter = yesNo[1];
        }
        dropdownStateEvMeter.currentState?.didChange(requirementOfEvMeter);

        var list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "LATEST_BILL");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.uploadLatestBillPath = "LATEST_BILL";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "meter_connection_type".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateMeterConnectionType,
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
                      //value: mtConnectionType,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.kBlackBorderColor, width: 0.3.w),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      isDense: true,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16.r),
                      items: meterConnectionType
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
                      onChanged: (String? value) {
                        widget.siteSurveyController!
                            .meterConnectionTypeTextController.text = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "approved_power_capacity".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp),
                      textAlign: TextAlign.left,
                      controller: widget.siteSurveyController!
                          .approvedPowerCapacityTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          CPOUnits.kw,
                          size: 10,
                          color: AppColors.kBlackColor,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: outlineInputBorder,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "site_max_power_demand".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp),
                      textAlign: TextAlign.left,
                      controller: widget.siteSurveyController!
                          .siteMaxPowerDemandTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          CPOUnits.kw,
                          size: 10,
                          color: AppColors.kBlackColor,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: outlineInputBorder,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "available_power".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp),
                      textAlign: TextAlign.left,
                      controller: widget
                          .siteSurveyController!.availablePowerTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          CPOUnits.kw,
                          size: 10,
                          color: AppColors.kBlackColor,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: outlineInputBorder,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "upload_latest_bill".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(
                          0,
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: BorderSide(
                                  color: AppColors.kBlackBorderColor,
                                  width: 0.3.w)),
                        ),
                      ),
                      onPressed: () async {
                        if (widget.siteSurveyController!.uploadLatestBillPath
                                ?.isEmpty ??
                            true) {
                          uploadLatestBillOperation();
                        } else {
                          setState(() {
                            widget.siteSurveyController!.uploadLatestBillPath =
                            null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "uploaded".tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kBlackColor,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            const Icon(Icons.clear,
                                color: AppColors.kBlackColor, size: 18),
                          ],
                        ),
                        visible: widget.siteSurveyController!
                                .uploadLatestBillPath?.isEmpty ??
                            true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.file_upload_outlined,
                                color: AppColors.kBlackTitleColor, size: 18),
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
                ),
              ],
            ),
            Visibility(
              visible: widget
                      .siteSurveyController!.uploadLatestBillPath?.isNotEmpty ??
                  false,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        "*File has been uploaded".tr,
                        textAlign: TextAlign.center,
                        style: headerStyle.copyWith(
                            color: AppColors.kPrimaryColor, fontSize: 8.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "separate_line_on_existing_meter".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateSeparateLine,
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
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.kBlackBorderColor, width: 0.3.w),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      isDense: true,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16.r),
                      items:
                          yesNo.map<DropdownMenuItem<String>>((String value) {
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
                      onChanged: (String? value) {
                        if (value! == yesNo[0]) {
                          widget.siteSurveyController!
                              .isSeparateLineOnExistingMeter = true;
                        } else {
                          widget.siteSurveyController!
                              .isSeparateLineOnExistingMeter = false;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "earthing_test_value".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: TextField(
                      style: TextStyle(fontSize: 12.sp),
                      textAlign: TextAlign.left,
                      controller: widget.siteSurveyController!
                          .earthingTestValueTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          CPOUnits.v,
                          size: 10,
                          color: AppColors.kBlackColor,
                        ),
                        contentPadding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: outlineInputBorder,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "requirement_of_ev_meter".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateEvMeter,
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
                        contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.kBlackBorderColor, width: 0.3.w),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      isDense: true,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16.r),
                      items:
                          yesNo.map<DropdownMenuItem<String>>((String value) {
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
                      onChanged: (String? value) {
                        if (value! == yesNo[0]) {
                          widget.siteSurveyController!.isRequirementOfEvMeter =
                              true;
                        } else {
                          widget.siteSurveyController!.isRequirementOfEvMeter =
                              false;
                        }
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void uploadLatestBillOperation() async {
    String from = await pickUpFileDialog(context);
    if(from == "Storage") {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['jpg', 'png', 'pdf', 'doc', 'txt'],
      );
      if (result != null) {
        showLoader();
        bool docResult = await widget.siteSurveyController!.uploadDoc(
          result.files[0].path!,
          latestBillTitle,
          siteSurveyObjectRequests!.id.toString(),
        );
        hideLoader();
        if (docResult) {
          setState(() {
            widget.siteSurveyController!.uploadLatestBillPath =
                result.files[0].path;
          });
        }
      }
    } else {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(source: ImageSource.camera);
      if(photo != null) {
        showLoader();
        bool docResult = await widget.siteSurveyController!.uploadDoc(
          photo.path!,
          latestBillTitle,
          siteSurveyObjectRequests!.id.toString(),
        );
        hideLoader();
        if (docResult) {
          setState(() {
            widget.siteSurveyController!.uploadLatestBillPath =
                photo.path;
          });
        }
      }
    }
  }
}
