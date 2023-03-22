import 'package:cpo_assists/models/responses/site_survey_response.dart'
    as ss_assign_response;
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/bloc_provider.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:cpo_assists/utils/cpo_units_icons.dart';
import 'package:cpo_assists/widgets/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SiteSurveyScreen extends StatefulWidget {
  const SiteSurveyScreen({Key? key}) : super(key: key);

  @override
  State<SiteSurveyScreen> createState() => _SiteSurveyScreenState();
}

class _SiteSurveyScreenState extends State<SiteSurveyScreen> {
  SiteSurveyController? siteSurveyController;

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w),
    borderRadius: BorderRadius.circular(16.r),
  );

  @override
  void initState() {
    super.initState();
    siteSurveyController = Get.find<SiteSurveyController>();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      siteSurveyController!.siteSurveyAssignObjectRequestList.clear();
      siteSurveyController!.siteSurveySavedObjectRequestList.clear();
      siteSurveyController!.siteSurveyHistoryObjectRequestList.clear();
      siteSurveyController!.updateAssignList();
      siteSurveyController!.updateSavedList();
      siteSurveyController!.updateHistoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "site_survey".tr,
            style: TextStyle(fontSize: 24.sp),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 1.0),
            child: ProgressBar(
              isLoading: Bloc.bloc.blocStream.stream,
            ),
          ),
        ),
        drawer: drawer(context),
        body: SafeArea(
          child: bodyWidget(),
        ),
      ),
    );
  }

  Widget bodyWidget() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 60.h),
            child: Material(
              color: Colors.white,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_outlined,
                            color: AppColors.kBlackColor, size: 14.w),
                        const SizedBox(width: 5),
                        Text(
                          "assigned".tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.kBlackColor),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CPOUnits.bookmarkEmpty,
                            color: AppColors.kBlackColor, size: 14.w),
                        const SizedBox(width: 5),
                        Text(
                          "saved".tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.kBlackColor),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CPOUnits.history,
                            color: AppColors.kBlackColor, size: 14.w),
                        const SizedBox(width: 5),
                        Text(
                          "history".tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12.sp, color: AppColors.kBlackColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                assignedSection(),
                savedSection(),
                historySection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget assignedSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 35.h,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 14.sp),
                    onChanged: (value) {
                      siteSurveyController!.assignedSearchOperation();
                    },
                    controller:
                        siteSurveyController!.assignedSearchTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.kBlackBorderColor),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      enabledBorder: outlineInputBorder,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.kBlackBorderColor, width: 0.3.w),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "search".tr,
                      hintStyle: TextStyle(
                          color: AppColors.kBlackTitleColor, fontSize: 12.sp),
                      prefixIcon: Icon(Icons.search,
                          color: AppColors.kBlackTitleColor, size: 14.w),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  replacement: const Center(
                    child: Text("Site not assigned yet"),
                  ),
                  visible: siteSurveyController!
                      .siteSurveyAssignObjectRequestList.isNotEmpty,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10, width: double.infinity);
                      },
                      shrinkWrap: true,
                      itemCount: siteSurveyController!
                          .siteSurveyAssignObjectRequestList.length,
                      itemBuilder: (context, index) {
                        return assignedListItem(context, index);
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget savedSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 35.h,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 12.sp),
                    onChanged: (value) {
                      siteSurveyController!.savedSearchOperation();
                    },
                    controller: siteSurveyController!.savedSearchTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      enabledBorder: outlineInputBorder,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "search".tr,
                      hintStyle: TextStyle(
                          color: AppColors.kBlackTitleColor, fontSize: 12.sp),
                      prefixIcon: Icon(Icons.search,
                          color: AppColors.kBlackTitleColor, size: 14.w),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GetX<SiteSurveyController>(builder: (controller) {
                return Visibility(
                  replacement: const Center(
                    child: Text("Site not saved yet"),
                  ),
                  visible: siteSurveyController!
                      .siteSurveySavedObjectRequestList.isNotEmpty,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10, width: double.infinity);
                      },
                      shrinkWrap: true,
                      itemCount: siteSurveyController!
                          .siteSurveySavedObjectRequestList.length,
                      itemBuilder: (context, index) {
                        return savedListItem(context, index);
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget historySection() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: 35.h,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(fontSize: 12.sp),
                  onChanged: (value) {
                    siteSurveyController!.historySearchOperation();
                  },
                  controller: siteSurveyController!.historySearchTextController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    enabledBorder: outlineInputBorder,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "search".tr,
                    hintStyle: TextStyle(
                        color: AppColors.kBlackTitleColor, fontSize: 12.sp),
                    prefixIcon: Icon(Icons.search,
                        color: AppColors.kBlackTitleColor, size: 14.w),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: GetX<SiteSurveyController>(builder: (controller) {
              return Visibility(
                replacement: const Center(
                  child: Text("Site not completed yet"),
                ),
                visible: siteSurveyController!
                    .siteSurveyHistoryObjectRequestList.isNotEmpty,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10, width: double.infinity);
                    },
                    shrinkWrap: true,
                    itemCount: siteSurveyController!
                        .siteSurveyHistoryObjectRequestList.length,
                    itemBuilder: (context, index) {
                      return historyListItem(context, index);
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ]),
    );
  }

  Widget assignedListItem(BuildContext context, int index) {
    return Container(
      height: 79.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.kBlackBorderColor,
          width: 0.3.w,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: GetX<SiteSurveyController>(builder: (controller) {
        return InkWell(
          onTap: () {
            getItRegister<Map<String, dynamic>>({
              'siteSurveyObjectRequest': siteSurveyController!
                  .siteSurveyAssignObjectRequestList[index],
              'from': "ASSIGNED",
            }, name: "site_survey");
            Get.toNamed(AppRoutes.siteSurveyForm);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Text(
                          "${"site_name".tr} - ",
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${siteSurveyController!.siteSurveyAssignObjectRequestList[index].onSiteName}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          "${"site_id".tr} - ",
                          style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp),
                        ),
                        Text(
                          "${siteSurveyController!.siteSurveyAssignObjectRequestList[index].site!.id}",
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${"address".tr} - ",
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                  Expanded(
                    child: Text(
                      getAddress(siteSurveyController!
                          .siteSurveyAssignObjectRequestList[index]),
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${"due_in".tr} - ",
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp),
                  ),
                  Text(
                    "0 days",
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Widget savedListItem(BuildContext context, int index) {
    return Container(
      height: 79.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.kBlackBorderColor,
          width: 0.3.w,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: GetX<SiteSurveyController>(builder: (controller) {
        return InkWell(
          onTap: () {
            getItRegister<Map<String, dynamic>>({
              'siteSurveyObjectRequest':
                  siteSurveyController!.siteSurveySavedObjectRequestList[index],
              'from': "SAVED",
            }, name: "site_survey");
            Get.toNamed(AppRoutes.siteSurveyForm);
          },
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Row(
                      children: [
                        Text(
                          "${"site_name".tr} - ",
                          style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        Expanded(
                          child: Text(
                            "${siteSurveyController!.siteSurveySavedObjectRequestList[index].onSiteName}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Text(
                          "${"site_id".tr} - ",
                          style: TextStyle(
                              color: AppColors.kBlackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp),
                        ),
                        Text(
                          "${siteSurveyController!.siteSurveySavedObjectRequestList[index].site!.id}",
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${"address".tr} -",
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      getAddress(siteSurveyController!
                          .siteSurveySavedObjectRequestList[index]),
                      maxLines: 2,
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "${"due_in".tr} - ",
                    style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
                  ),
                  Text(
                    "0 days",
                    style: TextStyle(
                        color: AppColors.kBlackColor, fontSize: 12.sp),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

  Widget historyListItem(BuildContext context, int index) {
    return Container(
      height: 79.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.kBlackBorderColor,
          width: 0.3.w,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: GetX<SiteSurveyController>(builder: (controller) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      Text(
                        "${"site_name".tr} - ",
                        style: TextStyle(
                          color: AppColors.kBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "${siteSurveyController!.siteSurveyHistoryObjectRequestList[index].onSiteName}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontSize: 12.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Text(
                        "${"site_id".tr} - ",
                        style: TextStyle(
                            color: AppColors.kBlackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp),
                      ),
                      Text(
                          "${siteSurveyController!.siteSurveyHistoryObjectRequestList[index].site!.id}",
                          style: TextStyle(
                              color: AppColors.kBlackColor, fontSize: 12.sp))
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${"address".tr} - ",
                  style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                Expanded(
                    child: Text(
                        getAddress(siteSurveyController!
                            .siteSurveyHistoryObjectRequestList[index]),
                        maxLines: 2,
                        style: TextStyle(
                            color: AppColors.kBlackColor, fontSize: 12.sp)))
              ],
            ),
            Row(
              children: [
                Text(
                  "${"due_in".tr} - ",
                  style: TextStyle(
                      color: AppColors.kBlackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp),
                ),
                Text(
                  "0 days",
                  style:
                      TextStyle(color: AppColors.kBlackColor, fontSize: 12.sp),
                )
              ],
            )
          ],
        );
      }),
    );
  }

  String getAddress(
      ss_assign_response.SiteSurveyObjectRequests siteSurveyObjectRequests) {
    String address = "";
    String pinCode = "";
    String city = "";
    String state = "";
    String country = "";

    if (siteSurveyObjectRequests.site != null &&
        siteSurveyObjectRequests.site!.address != null) {
      address = siteSurveyObjectRequests.site!.address!.address ?? "";
      address = (address.isNotEmpty) ? "$address," : address;

      pinCode = siteSurveyObjectRequests.site!.address!.pincode ?? "";

      if (siteSurveyObjectRequests.site!.address!.city != null) {
        city = siteSurveyObjectRequests.site!.address!.city!.name ?? "";
        city = (city.isNotEmpty) ? "$city," : city;

        if (siteSurveyObjectRequests.site!.address!.city!.state != null) {
          state =
              siteSurveyObjectRequests.site!.address!.city!.state!.name ?? "";
          state = (state.isNotEmpty) ? "$state," : state;

          if (siteSurveyObjectRequests.site!.address!.city!.state!.country !=
              null) {
            country = siteSurveyObjectRequests
                    .site!.address!.city!.state!.country!.name ??
                "";
            country = (country.isNotEmpty) ? "$country," : country;
          }
        }
      }
    }
    return "$address$city$state$country$pinCode";
  }
}
