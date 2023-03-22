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

class SSProgressViewFour extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressViewFour({Key? key, this.siteSurveyController})
      : super(key: key);

  @override
  State<SSProgressViewFour> createState() => _SSProgressViewFourState();
}

class _SSProgressViewFourState extends State<SSProgressViewFour> {
  ss_assign_response.SiteSurveyObjectRequests? siteSurveyObjectRequests;

  String? parkingAreaCovered;
  String? clearEntryExitForEv;
  String? chargerAreaCovered;

  final dropdownStateClearEntryExit = GlobalKey<FormFieldState>();
  final dropdownStateParkingAreaCover = GlobalKey<FormFieldState>();
  final dropdownStateChargerAreaCover = GlobalKey<FormFieldState>();
  final dropdownStateChargerMountingAvailable = GlobalKey<FormFieldState>();

  String footFallText = "select".tr;
  String civilWorkChargerText = "select".tr;

  TextStyle headerStyle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.kBlackTitleColor,
    fontWeight: FontWeight.w500,
  );

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w),
    borderRadius: BorderRadius.circular(16.r),
  );

  BorderSide borderSide =
      BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w);

  @override
  void initState() {
    super.initState();
    siteSurveyObjectRequests = GetIt.I<Map<String, dynamic>>(
        instanceName: "site_survey")['siteSurveyObjectRequest'];

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.siteSurveyController!.distanceFromNearestDBTextController.text =
      (siteSurveyObjectRequests!.distance is double) ? "${siteSurveyObjectRequests!.distance}" : "";
      widget.siteSurveyController!.spaceAvailableLTextController.text =
      (siteSurveyObjectRequests!.parkingLength is double) ? "${siteSurveyObjectRequests!.parkingLength}" : "";
      widget.siteSurveyController!.spaceAvailableBTextController.text =
      (siteSurveyObjectRequests!.parkingWidth is double) ? "${siteSurveyObjectRequests!.parkingWidth}" : "";

      widget.siteSurveyController!.isParkingAreaCovered =
          siteSurveyObjectRequests!.isParkingArea;
      if (widget.siteSurveyController!.isParkingAreaCovered != null &&
          widget.siteSurveyController!.isParkingAreaCovered!) {
        parkingAreaCovered = yesNo[0];
      } else {
        parkingAreaCovered = yesNo[1];
      }
      dropdownStateParkingAreaCover.currentState?.didChange(parkingAreaCovered);

      widget.siteSurveyController!.isClearEntryExitForEv =
          siteSurveyObjectRequests!.isExit;
      if (widget.siteSurveyController!.isClearEntryExitForEv != null &&
          widget.siteSurveyController!.isClearEntryExitForEv!) {
        clearEntryExitForEv = yesNo[0];
      } else {
        clearEntryExitForEv = yesNo[1];
      }
      dropdownStateClearEntryExit.currentState?.didChange(clearEntryExitForEv);

      widget.siteSurveyController!.isChargerAreaCovered =
          siteSurveyObjectRequests!.isChargerArea;
      if (widget.siteSurveyController!.isChargerAreaCovered != null &&
          widget.siteSurveyController!.isChargerAreaCovered!) {
        chargerAreaCovered = yesNo[0];
      } else {
        chargerAreaCovered = yesNo[1];
      }
      dropdownStateChargerAreaCover.currentState?.didChange(chargerAreaCovered);

      widget.siteSurveyController!.chargerMountingAvailable =
          siteSurveyObjectRequests!.chargerMount;

      if(siteSurveyObjectRequests!.chargerMount.toString().toLowerCase().contains("floor")) {
        dropdownStateChargerMountingAvailable.currentState?.didChange("Floor");
      } else if(siteSurveyObjectRequests!.chargerMount.toString().toLowerCase().contains("wall")) {
        dropdownStateChargerMountingAvailable.currentState?.didChange("Wall");
      }
      
      List<String> tempCivilWorkRequiredList = List<String>.from(siteSurveyObjectRequests!.civilWorkCharger as List);
      widget.siteSurveyController!.civilWorkRequired.clear();
      for(int i = 0;i < tempCivilWorkRequiredList.length;i++) {
        if(tempCivilWorkRequiredList.contains("FLOORING")) {
          widget.siteSurveyController!.civilWorkRequired.add("Flooring");
        } else if(tempCivilWorkRequiredList.contains("FOUNDATION")) {
          widget.siteSurveyController!.civilWorkRequired.add("Foundation");
        } else if(tempCivilWorkRequiredList.contains("WALL_MOUNTING")) {
          widget.siteSurveyController!.civilWorkRequired.add("Wall Mounting");
        } else if(tempCivilWorkRequiredList.contains("SHED_COVER")) {
          widget.siteSurveyController!.civilWorkRequired.add("Shed/Cover");
        }
      }
      if(widget.siteSurveyController!.civilWorkRequired.isNotEmpty) {
        setState(() {
          civilWorkChargerText = widget.siteSurveyController!.civilWorkRequired[0];
        });
      }

      if(siteSurveyObjectRequests!.footFall != null) {
        for(int i = 0; i < siteSurveyObjectRequests!.footFall!.length;i++) {
          switch(siteSurveyObjectRequests!.footFall![i].id) {
            case 1:
              widget.siteSurveyController!.sFootFall.add(footFall[0]);
              break;
            case 2:
              widget.siteSurveyController!.sFootFall.add(footFall[1]);
              break;
            case 3:
              widget.siteSurveyController!.sFootFall.add(footFall[2]);
              break;
            case 4:
              widget.siteSurveyController!.sFootFall.add(footFall[3]);
              break;
            case 5:
              widget.siteSurveyController!.sFootFall.add(footFall[4]);
              break;
            case 6:
              widget.siteSurveyController!.sFootFall.add(footFall[5]);
              break;
            default:
              break;
          }
        }
      }

      if(widget.siteSurveyController!.sFootFall.isNotEmpty) {
        setState(() {
          footFallText = widget.siteSurveyController!.sFootFall[0];
        });
      }
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
                    "distance_from_nearest_db".tr,
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
                          .distanceFromNearestDBTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CPOUnits.mts,
                            size: 10, color: AppColors.kBlackColor),
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
                    "space_available_for_ev_parking".tr,
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
                          .spaceAvailableLTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CPOUnits.mts,
                            size: 10, color: AppColors.kBlackColor),
                        hintText: "L",
                        hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.kBlackTitleColor),
                        contentPadding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
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
                    "space_available_for_ev_parking".tr,
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
                          .spaceAvailableBTextController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(CPOUnits.mts,
                            size: 10, color: AppColors.kBlackColor),
                        hintText: "B",
                        hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.kBlackTitleColor),
                        contentPadding: const EdgeInsets.only(
                            top: 10, left: 15, right: 15),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: const BorderSide(
                              color: Colors.grey, width: 1.0),
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
                    "clear_entry_exit_for_ev".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateClearEntryExit,
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
                        enabledBorder: outlineInputBorder,
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
                              .isClearEntryExitForEv = true;
                        } else {
                          widget.siteSurveyController!
                              .isClearEntryExitForEv = false;
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
                    "parking_area_covered".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateParkingAreaCover,
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
                        enabledBorder: outlineInputBorder,
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
                              .isParkingAreaCovered = true;
                        } else {
                          widget.siteSurveyController!
                              .isParkingAreaCovered = false;
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
                    "charger_area_covered".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateChargerAreaCover,
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
                        enabledBorder: outlineInputBorder,
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
                              .isChargerAreaCovered = true;
                        } else {
                          widget.siteSurveyController!
                              .isChargerAreaCovered = false;
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
                    "charger_mounting_available".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: DropdownButtonFormField(
                      key: dropdownStateChargerMountingAvailable,
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
                        enabledBorder: outlineInputBorder,
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
                      items: chargeMountingOption
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
                        widget.siteSurveyController!.chargerMountingAvailable = value!;
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
                    "civil_work_for_charger_required".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: GestureDetector(
                      onTap: () {
                        showCivilWorkForChargerDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.3.w,
                                color: AppColors.kBlackBorderColor)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  civilWorkChargerText,
                                  style: TextStyle(
                                    color: (civilWorkChargerText == "select".tr) ? AppColors.kBlackTitleColor : AppColors.kBlackColor,
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
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "foot_fall".tr,
                    style: headerStyle,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: SizedBox(
                    height: 35.h,
                    child: GestureDetector(
                      onTap: () {
                        showFootFallDialog();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Colors.white,
                            border: Border.all(
                                width: 0.3.w,
                                color: AppColors.kBlackBorderColor)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  footFallText,
                                  style: TextStyle(
                                    color: (footFallText == "select".tr) ? AppColors.kBlackTitleColor : AppColors.kBlackColor,
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void showCivilWorkForChargerDialog() async {
    List<bool> checkedList = List.generate(civilWorkForCharger.length, (index) => false);
    if(widget.siteSurveyController!.civilWorkRequired.isNotEmpty) {
      for (int i = 0; i < widget.siteSurveyController!.civilWorkRequired.length; i++) {
        int resultIndex = civilWorkForCharger.indexWhere((element) => (element == widget.siteSurveyController!.civilWorkRequired[i]));
        if(resultIndex != -1) {
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
                    itemCount: civilWorkForCharger.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        title: Text(civilWorkForCharger[index]),
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
                            widget.siteSurveyController!.civilWorkRequired.clear();
                            for(int i = 0; i < checkedList.length; i++) {
                              if(checkedList[i]) {
                                widget.siteSurveyController!.civilWorkRequired.add(civilWorkForCharger[i]);
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
    if(widget.siteSurveyController!.civilWorkRequired.isNotEmpty) {
      setState(() {
        civilWorkChargerText = widget.siteSurveyController!.civilWorkRequired[0];
      });
    } else {
      setState(() {
        civilWorkChargerText = "select".tr;
      });
    }
  }

  void showFootFallDialog() async {
    List<bool> checkedList = List.generate(footFall.length, (index) => false);
    if(widget.siteSurveyController!.sFootFall.isNotEmpty) {
      for (int i = 0; i < widget.siteSurveyController!.sFootFall.length; i++) {
        int resultIndex = footFall.indexWhere((element) => (element == widget.siteSurveyController!.sFootFall[i]));
        if(resultIndex != -1) {
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
                    itemCount: footFall.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        dense: true,
                        title: Text(footFall[index]),
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
                            widget.siteSurveyController!.sFootFall.clear();
                            for(int i = 0; i < checkedList.length; i++) {
                              if(checkedList[i]) {
                                widget.siteSurveyController!.sFootFall.add(footFall[i]);
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
    if(widget.siteSurveyController!.sFootFall.isNotEmpty) {
      setState(() {
        footFallText = widget.siteSurveyController!.sFootFall[0];
      });
    } else {
      setState(() {
        footFallText = "select".tr;
      });
    }
  }


}
