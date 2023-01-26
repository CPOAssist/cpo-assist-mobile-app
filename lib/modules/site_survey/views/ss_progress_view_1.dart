import 'package:cpo_assists/models/responses/site_survey_response.dart'
    as ss_assign_response;
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class SSProgressViewOne extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressViewOne({Key? key, this.siteSurveyController})
      : super(key: key);

  @override
  State<SSProgressViewOne> createState() => _SSProgressViewOneState();
}

class _SSProgressViewOneState extends State<SSProgressViewOne>
    with WidgetsBindingObserver {
  List<String> proposedChargers = [];
  String proposedChargerText = "select".tr;

  ss_assign_response.SiteSurveyObjectRequests? siteSurveyObjectRequests;
  DateTime? dateTime;

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
      widget.siteSurveyController!.contactNumber2TextController.text =
          siteSurveyObjectRequests!.contactNumber ?? "";
      widget.siteSurveyController!.onsiteContactNameTextController.text =
          siteSurveyObjectRequests!.onSiteName ?? "";
      widget.siteSurveyController!.siteOwnerNameTextController.text =
          siteSurveyObjectRequests!.siteOwnerName ?? "";
      widget.siteSurveyController!.siteOwnerContactTextController.text =
          siteSurveyObjectRequests!.siteOwnerNumber ?? "";
      widget.siteSurveyController!.locationPinTextController.text =
          siteSurveyObjectRequests!.locationPIN ?? "";
      String date = siteSurveyObjectRequests!.dueDate ?? "";
      if (date.isNotEmpty) {
        dateTime = DateTime.tryParse(date);
        dateTime ??= DateFormat("dd/MM/yyyy").parse(date);
        widget.siteSurveyController!.dateTextController.text =
            DateFormat("dd/MM/yyyy").format(dateTime!);
      }
      if (siteSurveyObjectRequests!.charger != null) {
        String? fromWhere =
            GetIt.I<Map<String, dynamic>>(instanceName: "site_survey")['from'];
        if (fromWhere != null && fromWhere == "SAVED" && widget.siteSurveyController!.proposedChargerList.isEmpty) {
          widget.siteSurveyController!.proposedChargerList
              .addAll(siteSurveyObjectRequests!.charger!);
        }
        setState(() {
          proposedChargers.addAll(siteSurveyObjectRequests!.charger!);

          if (widget.siteSurveyController!.proposedChargerList.isNotEmpty) {
            proposedChargerText = widget.siteSurveyController!.proposedChargerList[0];
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            SizedBox(
              height: 35.h,
              width: MediaQuery.of(context).size.width / 1.5,
              child: GestureDetector(
                onTap: () {
                  showProposedChargerDialog();
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.kBlackColor,
                      border: Border.all(
                          width: 0.3.w, color: AppColors.kBlackBorderColor)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            proposedChargerText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "onsite_contact_name".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    style: textFieldTextStyle,
                    textAlign: TextAlign.left,
                    controller: widget
                        .siteSurveyController!.onsiteContactNameTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(
                            color: AppColors.kBlackColor, width: 1.0),
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
                  "contact_number".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    style: textFieldTextStyle,
                    textAlign: TextAlign.left,
                    controller: widget
                        .siteSurveyController!.contactNumber2TextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(
                            color: AppColors.kBlackColor, width: 1.0),
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
                  "site_owner_name".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    style: textFieldTextStyle,
                    textAlign: TextAlign.left,
                    controller: widget
                        .siteSurveyController!.siteOwnerNameTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(
                            color: AppColors.kBlackColor, width: 1.0),
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
                  "site_owner_contact".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    style: textFieldTextStyle,
                    textAlign: TextAlign.left,
                    controller: widget
                        .siteSurveyController!.siteOwnerContactTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(
                            color: AppColors.kBlackColor, width: 1.0),
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
                  "location_pin".tr,
                  style: headerStyle,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 35.h,
                  child: TextField(
                    style: textFieldTextStyle,
                    textAlign: TextAlign.left,
                    controller:
                        widget.siteSurveyController!.locationPinTextController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 10, left: 15),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: const BorderSide(
                            color: AppColors.kBlackColor, width: 1.0),
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
                        "date".tr,
                        style: headerStyle,
                      ),
                      SizedBox(height: 5.h),
                      SizedBox(
                        height: 35.h,
                        child: TextField(
                          onTap: () async {
                            DateTime? resultDateTime = await showDatePicker(
                              context: context,
                              firstDate: DateTime(DateTime.now().year - 5),
                              lastDate: DateTime(DateTime.now().year + 5),
                              initialDate: DateTime.now(),
                            );
                            if (resultDateTime != null) {
                              widget.siteSurveyController!.dateTextController
                                      .text =
                                  DateFormat("dd/MM/yyyy")
                                      .format(resultDateTime);
                            }
                          },
                          focusNode: AlwaysDisabledFocusNode(),
                          style: textFieldTextStyle,
                          textAlign: TextAlign.center,
                          controller:
                              widget.siteSurveyController!.dateTextController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "DD/MM/YYYY",
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.kBlackTitleColor),
                            contentPadding:
                                const EdgeInsets.only(top: 10, bottom: 10),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              borderSide: const BorderSide(
                                  color: AppColors.kBlackColor, width: 1.0),
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
                SizedBox(width: 20.w),
                Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showProposedChargerDialog() async {
    List<bool> checkedList =
        List.generate(proposedChargers.length, (index) => false);
    if (widget.siteSurveyController!.proposedChargerList.isNotEmpty) {
      for (int i = 0;
          i < widget.siteSurveyController!.proposedChargerList.length;
          i++) {
        int resultIndex = proposedChargers.indexWhere((element) =>
            (element == widget.siteSurveyController!.proposedChargerList[i]));
        if (resultIndex != -1) {
          checkedList[resultIndex] = true;
        }
      }
    }
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Center(
            child: Container(
              width: 250.w,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "select".tr,
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: proposedChargers.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        title: Text(proposedChargers[index]),
                        value: checkedList[index],
                        onChanged: (value) {
                          setState(() {
                            checkedList[index] = value!;
                          });
                        },
                      );
                    },
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Dismiss",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        TextButton(
                          child: Text(
                            'OK',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            widget.siteSurveyController!.proposedChargerList
                                .clear();
                            for (int i = 0; i < checkedList.length; i++) {
                              if (checkedList[i]) {
                                widget.siteSurveyController!.proposedChargerList
                                    .add(proposedChargers[i]);
                              }
                            }
                            Get.back();
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
    if (widget.siteSurveyController!.proposedChargerList.isNotEmpty) {
      setState(() {
        proposedChargerText =
            widget.siteSurveyController!.proposedChargerList[0];
      });
    } else {
      setState(() {
        proposedChargerText = "select".tr;
      });
    }
  }
}
