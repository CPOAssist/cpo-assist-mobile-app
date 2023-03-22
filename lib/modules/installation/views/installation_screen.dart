import 'package:cpo_assists/modules/installation/controllers/installation_controller.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/app_styles.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:cpo_assists/utils/cpo_units_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InstallationScreen extends StatefulWidget {
  const InstallationScreen({Key? key}) : super(key: key);

  @override
  State<InstallationScreen> createState() => _InstallationScreenState();
}

class _InstallationScreenState extends State<InstallationScreen> {
  InstallationController? installationController;

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.kBlackBorderColor, width: 0.3.w),
    borderRadius: BorderRadius.circular(16.r),
  );

  @override
  void initState() {
    super.initState();
    installationController = Get.find<InstallationController>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "installation".tr,
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
                              fontSize: 14.sp, color: AppColors.kBlackColor),
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
                              fontSize: 14.sp, color: AppColors.kBlackColor),
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
                              fontSize: 14.sp, color: AppColors.kBlackColor),
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
                      installationController!.assignedSearchOperation();
                    },
                    controller:
                        installationController!.assignedSearchTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      enabledBorder: outlineInputBorder,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10, width: double.infinity);
                },
                shrinkWrap: true,
                itemCount: 0,
                itemBuilder: (context, index) {
                  return assignedListItem(context, index);
                },
              ),
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
                    onChanged: (value) {
                      installationController!.savedSearchOperation();
                    },
                    controller:
                        installationController!.savedSearchTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      enabledBorder: outlineInputBorder,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
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
              child: const Center(
                child: Text("Saved"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget historySection() {
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
                    onChanged: (value) {
                      installationController!.historySearchOperation();
                    },
                    controller:
                        installationController!.historySearchTextController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      enabledBorder: outlineInputBorder,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
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
              child: const Center(
                child: Text("History"),
              ),
            ),
          ),
        ],
      ),
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Text(
                      "site_name".tr + " -",
                      style: AppStyles.blackSemiBold12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("HKV Metro Station", style: AppStyles.blackNormal12)
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Text(
                      "site_id".tr + " -",
                      style: AppStyles.blackSemiBold12,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text("12345", style: AppStyles.blackNormal12)
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "address".tr + " -",
                style: AppStyles.blackSemiBold12,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Text(
                      "Haus khas village, metro station,New Delhi - 110001",
                      maxLines: 2,
                      style: AppStyles.blackNormal12))
            ],
          ),
          Row(
            children: [
              Text(
                "due_in".tr + " -",
                style: AppStyles.blackSemiBold12,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "0 days",
                style: AppStyles.blackNormal12,
              )
            ],
          )
        ],
      ),
    );
  }
}
