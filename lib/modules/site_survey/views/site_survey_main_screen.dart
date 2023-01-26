import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_initial_view.dart';
import 'package:cpo_assists/modules/site_survey/views/ss_progress_view.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SiteSurveyFormScreen extends StatefulWidget {
  const SiteSurveyFormScreen({Key? key}) : super(key: key);

  @override
  State<SiteSurveyFormScreen> createState() => _SiteSurveyFormScreenState();
}

class _SiteSurveyFormScreenState extends State<SiteSurveyFormScreen> {
  SiteSurveyController? siteSurveyController;
  String? fromWhere;

  @override
  void initState() {
    super.initState();
    fromWhere = GetIt.I<Map<String, dynamic>>(
        instanceName: "site_survey")['from'];

    siteSurveyController = Get.find<SiteSurveyController>();
    siteSurveyController!.resetViews();

    if(fromWhere != null && fromWhere == "SAVED") {
      siteSurveyController!.initialViewVisible.value = false;
      siteSurveyController!.processViewVisible.value = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "site_survey_form".tr,
          style: TextStyle(fontSize: 24.sp),
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
    return Stack(
      children: [
        GetX<SiteSurveyController>(builder: (controller) {
          return Visibility(
            visible: siteSurveyController!.initialViewVisible.value,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SSInitialView(siteSurveyController: siteSurveyController!),
            ),
          );
        }),
        GetX<SiteSurveyController>(builder: (controller) {
          return Visibility(
            visible: siteSurveyController!.processViewVisible.value,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child:
                  SSProgressView(siteSurveyController: siteSurveyController!),
            ),
          );
        }),
      ],
    );
  }
}
