import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view_1.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view_2.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view_3.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view_4.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view_5.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';

class SSProgressView extends StatefulWidget {
  final SiteSurveyController? siteSurveyController;
  const SSProgressView({Key? key, this.siteSurveyController}) : super(key: key);

  @override
  State<SSProgressView> createState() => _SSProgressViewState();
}

class _SSProgressViewState extends State<SSProgressView> {
  @override
  void initState() {
    super.initState();
    widget.siteSurveyController!.initializeUpdateAndRefreshStreamController();

    widget.siteSurveyController!.updateAndRefreshStreamController!.stream
        .listen((list) {
      nextPostOperation();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.siteSurveyController!.dismissUpdateAndRefreshStreamController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: double.infinity,
                child: GetX<SiteSurveyController>(builder: (controller) {
                  return StepsIndicator(
                    selectedStep:
                        widget.siteSurveyController!.selectedPageIndex.value,
                    nbSteps: 5,
                    doneLineColor: AppColors.kPrimaryColor,
                    doneStepColor: AppColors.kPrimaryColor,
                    selectedStepColorIn: AppColors.kPrimaryColor,
                    selectedStepColorOut: AppColors.kPrimaryColor,
                    unselectedStepColorIn: Colors.white,
                    unselectedStepColorOut: AppColors.kBlackColor,
                    doneLineThickness: 3,
                    undoneLineThickness: 3,
                    lineLength: 60,
                    undoneLineColor: Colors.grey,
                    enableLineAnimation: true,
                    enableStepAnimation: true,
                  );
                }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  visible:
                      widget.siteSurveyController!.processViewOneVisible.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SSProgressViewOne(
                        siteSurveyController: widget.siteSurveyController!),
                  ),
                );
              }),
              GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  visible:
                      widget.siteSurveyController!.processViewTwoVisible.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SSProgressViewTwo(
                        siteSurveyController: widget.siteSurveyController!),
                  ),
                );
              }),
              GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  visible: widget
                      .siteSurveyController!.processViewThreeVisible.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SSProgressViewThree(
                        siteSurveyController: widget.siteSurveyController!),
                  ),
                );
              }),
              GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  visible:
                      widget.siteSurveyController!.processViewFourVisible.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SSProgressViewFour(
                        siteSurveyController: widget.siteSurveyController!),
                  ),
                );
              }),
              GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  visible:
                      widget.siteSurveyController!.processViewFiveVisible.value,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: SSProgressViewFive(
                        siteSurveyController: widget.siteSurveyController!),
                  ),
                );
              })
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 100.h,
          width: double.infinity,
          child: GetX<SiteSurveyController>(builder: (controller) {
            return Visibility(
              replacement: Visibility(
                replacement: Center(
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: const BorderSide(
                                  color: AppColors.kBlackColor)),
                        ),
                      ),
                      onPressed: () async {
                        homeOperation();
                      },
                      child: Text(
                        "home".tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                visible:
                    (widget.siteSurveyController!.processViewFourVisible.value),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                              side: const BorderSide(
                                  color: AppColors.kBlackColor)),
                        ),
                      ),
                      onPressed: () async {
                        saveAndSubmitOperation();
                      },
                      child: Text(
                        "save_and_submit".tr,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              visible: (widget
                      .siteSurveyController!.processViewOneVisible.value) ||
                  (widget.siteSurveyController!.processViewTwoVisible.value) ||
                  (widget.siteSurveyController!.processViewThreeVisible.value),
              child: Center(
                child: SizedBox(
                  child: Row(
                    children: [
                      Visibility(
                        visible: !widget.siteSurveyController!.processViewOneVisible.value,
                        child: Expanded(
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
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.r),
                                      side: const BorderSide(
                                          color: AppColors.kBlackColor)),
                                ),
                              ),
                              onPressed: () async {
                                previousOperation();
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
                      ),
                      Visibility(
                        visible: !widget.siteSurveyController!.processViewOneVisible.value,
                          child: SizedBox(width: 10.w),
                      ),
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
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  side: const BorderSide(
                                      color: AppColors.kBlackColor),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              nextPreOperation();
                            },
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "save_next".tr,
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
              ),
            );
          }),
        ),
      ],
    );
  }

  void saveOperation() {}

  void homeOperation() {
    widget.siteSurveyController!.resetViews();
    widget.siteSurveyController!.selectedPageIndex.value = 0;
    Get.offNamedUntil(AppRoutes.landingPage, (route) => false);
  }

  void saveAndSubmitOperation() {
    if (widget.siteSurveyController!.processViewFourVisible.value) {
      widget.siteSurveyController!.updateProgressView4Data();
    }
  }

  void previousOperation() {
    if (widget.siteSurveyController!.processViewThreeVisible.value) {
      widget.siteSurveyController!.processViewThreeVisible.value = false;
      widget.siteSurveyController!.processViewTwoVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 1;
    } else if (widget.siteSurveyController!.processViewTwoVisible.value) {
      widget.siteSurveyController!.processViewTwoVisible.value = false;
      widget.siteSurveyController!.processViewOneVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 0;
    }
  }

  void nextPreOperation() {
    if (widget.siteSurveyController!.processViewOneVisible.value) {
      widget.siteSurveyController!.updateProgressView1Data();
    } else if (widget.siteSurveyController!.processViewTwoVisible.value) {
      widget.siteSurveyController!.updateProgressView2Data();
    } else if (widget.siteSurveyController!.processViewThreeVisible.value) {
      widget.siteSurveyController!.updateProgressView3Data();
    }
  }

  void nextPostOperation() {
    if (widget.siteSurveyController!.processViewOneVisible.value) {
      print("Here 1");
      widget.siteSurveyController!.processViewOneVisible.value = false;
      widget.siteSurveyController!.processViewTwoVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 1;
    } else if (widget.siteSurveyController!.processViewTwoVisible.value) {
      print("Here 2");
      widget.siteSurveyController!.processViewTwoVisible.value = false;
      widget.siteSurveyController!.processViewThreeVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 2;
    } else if (widget.siteSurveyController!.processViewThreeVisible.value) {
      print("Here 3");
      widget.siteSurveyController!.processViewThreeVisible.value = false;
      widget.siteSurveyController!.processViewFourVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 3;
    } else if (widget.siteSurveyController!.processViewFourVisible.value) {
      print("Here 4");
      widget.siteSurveyController!.processViewFourVisible.value = false;
      widget.siteSurveyController!.processViewFiveVisible.value = true;
      widget.siteSurveyController!.selectedPageIndex.value = 4;
    }
  }
}
