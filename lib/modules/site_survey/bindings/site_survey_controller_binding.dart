import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:get/get.dart';

class SiteSurveyControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiteSurveyController>(() => SiteSurveyController());
  }
}
