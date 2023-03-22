import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/models/responses/login_response.dart';
import 'package:cpo_assists/models/responses/site_survey_response.dart';
import 'package:cpo_assists/models/responses/update_site_status_response.dart';
import 'package:cpo_assists/modules/site_survey/controllers/site_survey_controller.dart';
import 'package:get/get.dart';

class Parsers {
  static bool parseLoginResponse(LoginResponse loginResponse) {
    try {
      if (loginResponse.data != null) {
        DatabaseOperation.databaseOperation.setUserId(loginResponse.data!.id);
        DatabaseOperation.databaseOperation.setEmail(loginResponse.data!.email);
        DatabaseOperation.databaseOperation
            .setFirstName(loginResponse.data!.firstName);
        DatabaseOperation.databaseOperation
            .setLastName(loginResponse.data!.lastName);
        DatabaseOperation.databaseOperation
            .setPhoneNumber(loginResponse.data!.phoneNumber);
        DatabaseOperation.databaseOperation
            .setBearerToken(loginResponse.data!.token);
        String token = loginResponse.data!.token!;
        return true;
      }
    } finally {}
    return false;
  }

  static void parseSiteSurveyObjectResponse(
      SiteSurveyObjectResponse siteSurveyObjectResponse, int type) {
    if (siteSurveyObjectResponse.data != null) {
      if (siteSurveyObjectResponse.data!.requests != null &&
          siteSurveyObjectResponse.data!.requests!.isNotEmpty) {
        SiteSurveyController siteSurveyController =
            Get.find<SiteSurveyController>();
        if(type == 1) {

          siteSurveyController.siteSurveyAssignObjectRequestList
              .addAll(siteSurveyObjectResponse.data!.requests ?? []);
        } else if(type == 2) {
          siteSurveyController.siteSurveySavedObjectRequestList
              .addAll(siteSurveyObjectResponse.data!.requests ?? []);
        } else if(type == 3) {
          siteSurveyController.siteSurveyHistoryObjectRequestList
              .addAll(siteSurveyObjectResponse.data!.requests ?? []);
        }
      }
    }
  }

  static bool parseSiteSurveyUpdateStatusResponse(UpdateSiteSurveyStatus updateSiteSurveyStatus) {
    try {
      if (updateSiteSurveyStatus.data != null) {

        return true;
      }
    } finally {}
    return false;
  }
}
