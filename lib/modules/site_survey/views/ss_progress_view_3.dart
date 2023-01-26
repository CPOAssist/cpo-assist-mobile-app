import 'package:cpo_assists/models/responses/site_survey_response.dart'
    as ss_assign_response;
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class SSProgressViewThree extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressViewThree({Key? key, this.siteSurveyController})
      : super(key: key);

  @override
  State<SSProgressViewThree> createState() => _SSProgressViewThreeState();
}

class _SSProgressViewThreeState extends State<SSProgressViewThree> {
  ss_assign_response.SiteSurveyObjectRequests? siteSurveyObjectRequests;

  TextStyle headerStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.kBlackTitleColor,
    fontWeight: FontWeight.w500,
  );

  ButtonStyle buttonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all<double>(
      0,
    ),
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.white,
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: AppColors.kBlackBorderColor,
          width: 0.3.w,
        ),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    siteSurveyObjectRequests = GetIt.I<Map<String, dynamic>>(
        instanceName: "site_survey")['siteSurveyObjectRequest'];
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        var list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "ENTRY");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.entryForParkingPath = "ENTRY";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "EXIT");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.exitFromParkingPath = "EXIT";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "CHARGER_MOUNTING");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.chargerMountingPath = "CHARGER_MOUNTING";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "PARKING_AREA");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.evParkingAreaPath = "PARKING_AREA";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "NEAREST_DB");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.nearestDbPath = "NEAREST_DB";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "OVERALL_SITE");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.overallSitePath = "OVERALL_SITE";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "OTHER_1");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.other1Path = "OTHER_1";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "OTHER_2");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.other2Path = "OTHER_2";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "ALTERNATIVE_SITE_1");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.alternateSite1Path = "ALTERNATIVE_SITE_1";
        }

        list = siteSurveyObjectRequests?.documents?.where((element) => element.title == "ALTERNATIVE_SITE_2");
        if(list != null && list.isNotEmpty) {
          widget.siteSurveyController!.alternateSite2Path = "ALTERNATIVE_SITE_2";
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
                    "entry_of_parking".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget.siteSurveyController!.entryForParkingPath
                                ?.isEmpty ??
                            true) {
                          uploadDocumentOperation(entryForParkingDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.entryForParkingPath =
                            null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget.siteSurveyController!
                                .entryForParkingPath?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget
                      .siteSurveyController!.entryForParkingPath?.isNotEmpty ??
                  false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "exit_from_parking".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget.siteSurveyController!.exitFromParkingPath
                                ?.isEmpty ??
                            true) {
                          uploadDocumentOperation(exitFromParkingDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.exitFromParkingPath =
                            null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget.siteSurveyController!
                                .exitFromParkingPath?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget
                      .siteSurveyController!.exitFromParkingPath?.isNotEmpty ??
                  false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "charger_mounting".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget.siteSurveyController!.chargerMountingPath
                                ?.isEmpty ??
                            true) {
                          uploadDocumentOperation(chargerMountingDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.chargerMountingPath =
                            null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget.siteSurveyController!
                                .chargerMountingPath?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget
                      .siteSurveyController!.chargerMountingPath?.isNotEmpty ??
                  false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "ev_parking_area".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget.siteSurveyController!.evParkingAreaPath
                                ?.isEmpty ??
                            true) {
                          uploadDocumentOperation(evParkingAreaDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.evParkingAreaPath = null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget.siteSurveyController!.evParkingAreaPath
                                ?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget
                      .siteSurveyController!.evParkingAreaPath?.isNotEmpty ??
                  false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "nearest_db".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget
                                .siteSurveyController!.nearestDbPath?.isEmpty ??
                            true) {
                          uploadDocumentOperation(nearestDbDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.nearestDbPath = null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget
                                .siteSurveyController!.nearestDbPath?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: widget.siteSurveyController!.nearestDbPath?.isNotEmpty ??
                  false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "overall_site".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 35.h,
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () async {
                        if (widget.siteSurveyController!.overallSitePath
                                ?.isEmpty ??
                            true) {
                          uploadDocumentOperation(overallSiteDocTitle);
                        } else {
                          setState(() {
                            widget.siteSurveyController!.overallSitePath = null;
                          });
                        }
                      },
                      child: Visibility(
                        replacement: commonUploadedView(),
                        visible: widget.siteSurveyController!.overallSitePath
                                ?.isEmpty ??
                            true,
                        child: commonUploadView(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible:
                  widget.siteSurveyController!.overallSitePath?.isNotEmpty ??
                      false,
              child: commonFileTextView(),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "other".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 35.h,
                        child: ElevatedButton(
                          style: buttonStyle,
                          onPressed: () async {
                            if (widget.siteSurveyController!.other1Path
                                    ?.isEmpty ??
                                true) {
                              uploadDocumentOperation(other1DocTitle);
                            } else {
                              setState(() {
                                widget.siteSurveyController!.other1Path = null;
                              });
                            }
                          },
                          child: Visibility(
                            replacement: commonUploadedView(),
                            visible: widget.siteSurveyController!.other1Path
                                    ?.isEmpty ??
                                true,
                            child: commonUploadView(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 35.h,
                        child: ElevatedButton(
                          style: buttonStyle,
                          onPressed: () async {
                            if (widget.siteSurveyController!.other2Path
                                    ?.isEmpty ??
                                true) {
                              uploadDocumentOperation(other2DocTitle);
                            } else {
                              setState(() {
                                widget.siteSurveyController!.other2Path = null;
                              });
                            }
                          },
                          child: Visibility(
                            replacement: commonUploadedView(),
                            visible: widget.siteSurveyController!.other2Path
                                    ?.isEmpty ??
                                true,
                            child: commonUploadView(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          (widget.siteSurveyController!.other1Path
                              ?.isEmpty ??
                              true) ? "" : "*File has been uploaded".tr,
                          textAlign: TextAlign.center,
                          style: headerStyle.copyWith(
                              color: AppColors.kPrimaryColor, fontSize: 8.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          (widget.siteSurveyController!.other2Path
                              ?.isEmpty ??
                              true) ? "" : "*File has been uploaded".tr,
                          textAlign: TextAlign.center,
                          style: headerStyle.copyWith(
                              color: AppColors.kPrimaryColor, fontSize: 8.sp),
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
                  "alternate_site".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 35.h,
                        child: ElevatedButton(
                          style: buttonStyle,
                          onPressed: () async {
                            if (widget.siteSurveyController!.alternateSite1Path
                                    ?.isEmpty ??
                                true) {
                              uploadDocumentOperation(alternateSite1DocTitle);
                            } else {
                              setState(() {
                                widget.siteSurveyController!.alternateSite1Path =
                                null;
                              });
                            }
                          },
                          child: Visibility(
                            replacement: commonUploadedView(),
                            visible: widget.siteSurveyController!
                                    .alternateSite1Path?.isEmpty ??
                                true,
                            child: commonUploadView(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 35.h,
                        child: ElevatedButton(
                          style: buttonStyle,
                          onPressed: () async {
                            if (widget.siteSurveyController!.alternateSite2Path
                                    ?.isEmpty ??
                                true) {
                              uploadDocumentOperation(alternateSite2DocTitle);
                            } else {
                              setState(() {
                                widget.siteSurveyController!.alternateSite2Path =
                                null;
                              });
                            }
                          },
                          child: Visibility(
                            replacement: commonUploadedView(),
                            visible: widget.siteSurveyController!
                                    .alternateSite2Path?.isEmpty ??
                                true,
                            child: commonUploadView(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          (widget.siteSurveyController!
                              .alternateSite1Path?.isEmpty ??
                              true) ? "" :"*File has been uploaded".tr,
                          textAlign: TextAlign.center,
                          style: headerStyle.copyWith(
                              color: AppColors.kPrimaryColor, fontSize: 8.sp),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          (widget.siteSurveyController!
                              .alternateSite2Path?.isEmpty ??
                              true) ? "" :"*File has been uploaded".tr,
                          textAlign: TextAlign.center,
                          style: headerStyle.copyWith(
                              color: AppColors.kPrimaryColor, fontSize: 8.sp),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget commonFileTextView() {
    return Row(
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
    );
  }

  Widget commonUploadedView() {
    return Row(
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
        const Icon(Icons.clear, color: AppColors.kBlackColor, size: 18),
      ],
    );
  }

  Widget commonUploadView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.file_upload_outlined,
          color: AppColors.kBlackTitleColor,
          size: 18,
        ),
        SizedBox(width: 5.w),
        Text(
          "upload".tr,
          style: headerStyle,
        ),
      ],
    );
  }

  void uploadDocumentOperation(String title) async {
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
          title,
          siteSurveyObjectRequests!.id.toString(),
        );
        hideLoader();
        if (docResult) {
          setState(() {
            switch (title) {
              case "ENTRY":
                widget.siteSurveyController!.entryForParkingPath =
                    result.files[0].path;
                break;
              case "EXIT":
                widget.siteSurveyController!.exitFromParkingPath =
                    result.files[0].path;
                break;
              case "CHARGER_MOUNTING":
                widget.siteSurveyController!.chargerMountingPath =
                    result.files[0].path;
                break;
              case "PARKING_AREA":
                widget.siteSurveyController!.evParkingAreaPath =
                    result.files[0].path;
                break;
              case "NEAREST_DB":
                widget.siteSurveyController!.nearestDbPath =
                    result.files[0].path;
                break;
              case "OVERALL_SITE":
                widget.siteSurveyController!.overallSitePath =
                    result.files[0].path;
                break;
              case "ALTERNATIVE_SITE_1":
                widget.siteSurveyController!.alternateSite1Path =
                    result.files[0].path;
                break;
              case "ALTERNATIVE_SITE_2":
                widget.siteSurveyController!.alternateSite2Path =
                    result.files[0].path;
                break;
              case "OTHER_1":
                widget.siteSurveyController!.other1Path =
                    result.files[0].path;
                break;
              case "OTHER_2":
                widget.siteSurveyController!.other2Path =
                    result.files[0].path;
                break;
            }
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
          title,
          siteSurveyObjectRequests!.id.toString(),
        );
        hideLoader();
        if (docResult) {
          setState(() {
            switch (title) {
              case "ENTRY":
                widget.siteSurveyController!.entryForParkingPath =
                    photo.path;
                break;
              case "EXIT":
                widget.siteSurveyController!.exitFromParkingPath =
                    photo.path;
                break;
              case "CHARGER_MOUNTING":
                widget.siteSurveyController!.chargerMountingPath =
                    photo.path;
                break;
              case "PARKING_AREA":
                widget.siteSurveyController!.evParkingAreaPath =
                    photo.path;
                break;
              case "NEAREST_DB":
                widget.siteSurveyController!.nearestDbPath =
                    photo.path;
                break;
              case "OVERALL_SITE":
                widget.siteSurveyController!.overallSitePath =
                    photo.path;
                break;
              case "ALTERNATIVE_SITE_1":
                widget.siteSurveyController!.alternateSite1Path =
                    photo.path;
                break;
              case "ALTERNATIVE_SITE_2":
                widget.siteSurveyController!.alternateSite2Path =
                    photo.path;
                break;
              case "OTHER_1":
                widget.siteSurveyController!.other1Path =
                    photo.path;
                break;
              case "OTHER_2":
                widget.siteSurveyController!.other2Path =
                    photo.path;
                break;
            }
          });
        }
      }
    }
  }
}
