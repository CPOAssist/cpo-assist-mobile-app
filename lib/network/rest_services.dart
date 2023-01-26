import 'dart:convert';
import 'dart:developer';

import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/models/requests/change_password_request.dart';
import 'package:cpo_assists/models/requests/login_request.dart';
import 'package:cpo_assists/models/requests/upload_doc_data.dart';
import 'package:cpo_assists/models/responses/charger_mount_response.dart';
import 'package:cpo_assists/models/responses/footdfall_response.dart';
import 'package:cpo_assists/models/responses/login_response.dart';
import 'package:cpo_assists/models/responses/site_survey_response.dart';
import 'package:cpo_assists/models/responses/update_site_status_response.dart';
import 'package:cpo_assists/modules/common/parsers.dart';
import 'package:cpo_assists/utils/bloc_provider.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as gt;

class RestServices {
  RestServices._privateConstructor();

  static final RestServices _instance = RestServices._privateConstructor();

  static RestServices get instance {
    return _instance;
  }

  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://18.205.114.102:8080/",
    connectTimeout: 50000,
    receiveTimeout: 50000,
  ));

  final String baseURL = "http://18.205.114.102:8080/";
  final login = "login";
  final forgotPassword = "api/user/forgotPassword";
  final changePassword = "api/user/saveNewPassword";
  final profileDetails = "api/user/getProfileDetails";

  final siteSurveyAssign = "api/vendor/site-surveys/ASSIGNED";
  final siteSurveySaved = "api/vendor/site-surveys/IN_PROGRESS";
  final siteSurveyHistory = "api/vendor/site-surveys/COMPLETED";
  final siteSurvey = "api/site-survey";
  final siteSurveyUploadDoc = "api/site-survey/doc";
  final siteSurveyUpdateStatus = "api/vendor/site-survey/ASSIGNED/";
  final siteSurveyCompletedStatus = "api/vendor/site-survey/COMPLETED/";
  final siteSurveyDetails = "api/vendor/site-survey-details";

  final commonFootFall = "api/common/foot-falls";
  final commonChargerMount = "api/common/charger-mounts";

  // POST => {{cpo_base}}/login
  // @param email, password
  Future<bool> hitLogin(LoginRequest loginRequest) async {
    try {
      Response response = await _dio.post(login, data: loginRequest.toJson());
      if (response.statusCode == 200) {
        if (response.data != null) {
          LoginResponse loginResponse = LoginResponse.fromJson(response.data);
          if (loginResponse.httpStatusCode == 200) {
            return Parsers.parseLoginResponse(loginResponse);
          } else if (loginResponse.httpStatusCode == 401) {
            showSnackBar("error".tr, loginResponse.message!);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // POST => {{cpo_base}}/api/user/forgotPassword?email=site_survey@service.com
  // @param email
  Future<bool> hitForgotPassword(String email) async {
    try {
      var formData = FormData.fromMap({
        'email': email,
      });
      Response response =
          await _dio.post(baseURL + forgotPassword, data: formData);
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // POST => {{cpo_base}}/api/user/saveNewPassword
  // @param userId, oldPassword, newPassword
  Future<bool> hitChangePassword(
      ChangePasswordRequest changePasswordRequest) async {
    try {
      Response response =
          await _dio.post(changePassword, data: changePasswordRequest.toJson());
      if (response.statusCode == 200) {
        if (response.data != null) {}
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/user/getProfileDetails?id=1
  // @param id

  // GET => {{cpo_base}}/api/vendor/site-surveys/ASSIGNED?page=1&limit=10&keyword=
  // @param page, limit, keyword
  Future<bool> hitSiteSurveyAssign(int page, int limit, String keyword) async {
    try {
      Bloc.bloc.blocStream.sink.add(true);
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";
      Map<String, dynamic> data = <String, dynamic>{
        'page': page,
        'limit':limit,
        'keyword':keyword
      };
      Response response =
          await _dio.get(siteSurveyAssign, queryParameters: data, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            SiteSurveyObjectResponse siteSurveyObjectResponse = SiteSurveyObjectResponse.fromJson(response.data);

            Parsers.parseSiteSurveyObjectResponse(siteSurveyObjectResponse, 1);
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    } finally {
      Bloc.bloc.blocStream.sink.add(false);
    }
    return false;
  }

  // GET => {{cpo_base}}/api/vendor/site-surveys/IN_PROGRESS?page=1&limit=10&keyword=
  // @param page, limit, keyword
  Future<bool> hitSiteSurveySaved(int page, int limit, String keyword) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";
      Map<String, dynamic> data = <String, dynamic>{
        'page': page,
        'limit':limit,
        'keyword':keyword
      };
      Response response =
      await _dio.get(siteSurveySaved, queryParameters: data, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            SiteSurveyObjectResponse siteSurveyObjectResponse = SiteSurveyObjectResponse.fromJson(response.data);
            Parsers.parseSiteSurveyObjectResponse(siteSurveyObjectResponse, 2);
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/vendor/site-surveys/COMPLETED?page=1&limit=10&keyword=
  // @param page, limit, keyword
  Future<bool> hitSiteSurveyHistory(int page, int limit, String keyword) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";
      Map<String, dynamic> data = <String, dynamic>{
        'page': page,
        'limit':limit,
        'keyword':keyword
      };
      Response response =
      await _dio.get(siteSurveyHistory, queryParameters: data, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            SiteSurveyObjectResponse siteSurveyObjectResponse = SiteSurveyObjectResponse.fromJson(response.data);
            Parsers.parseSiteSurveyObjectResponse(siteSurveyObjectResponse, 3);
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/vendor/site-survey/ASSIGNED/1
  // @param siteSurveyId
  Future<bool> hitSiteSurveyUpdateStatus(int siteSurveyId) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";

      Response response =
      await _dio.get("$siteSurveyUpdateStatus$siteSurveyId", options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            UpdateSiteSurveyStatus updateSiteSurveyStatus = UpdateSiteSurveyStatus.fromJson(response.data);
            return Parsers.parseSiteSurveyUpdateStatusResponse(updateSiteSurveyStatus);
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/vendor/site-survey/COMPLETED/1
  // @param siteSurveyId
  Future<bool> hitSiteSurveyCompletedStatus(int siteSurveyId) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";

      Response response =
      await _dio.get("$siteSurveyCompletedStatus$siteSurveyId", options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            UpdateSiteSurveyStatus updateSiteSurveyStatus = UpdateSiteSurveyStatus.fromJson(response.data);
            return Parsers.parseSiteSurveyUpdateStatusResponse(updateSiteSurveyStatus);
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitLogin : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/vendor/site-survey-details/1
  // @param page, limit, keyword
  Future<bool> hitSiteSurveyDetails(int siteSurveyId) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";

      Response response =
      await _dio.get("$siteSurveyDetails$siteSurveyId", options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {

          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitSiteSurveyDetails : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitSiteSurveyDetails : $error");
      }
      return false;
    }
    return false;
  }

  // POST => {{cpo_base}}/api/site-survey
  // @param
  //    {
  //        "id": 2,
  //        "onSiteName": "AbOnSite",
  //        "onSiteNumber": "8542033320",
  //        "siteOwnerNumber": "9633021456",
  //        "siteOwnerName": "XyOwner",
  //        "locationPIN": "13",
  //        "dueDate": "13/09/2022",
  //        "charger": [
  //            "PRT002",
  //        ],
  //        "connectionType": "SINGLE_PHASE",
  //        "powerCapacity": 18.4,
  //        "powerDemand": 13.9,
  //        "availablePower": 10.79,
  //        "earthingValue": 2.3,
  //        "distance": 23,
  //        "parking_length": 13,
  //        "parking_width": 14,
  //        "isSeperateLine": true,
  //        "isEvMeter": true,
  //        "isExit": false,
  //        "isParkingArea": false,
  //        "isChargerArea": true,
  //        "civilWorkCharger": "FOUNDATION",
  //        "footFall_Id": 1,
  //        "chargerMountId": 1,
  //        "surveyedByUserId": 2
  //    }
  Future<bool> hitSaveSiteSurvey(SiteSurveyObjectRequests siteSurveyObjectRequests) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";
      int userId = DatabaseOperation.databaseOperation.getUserId() ?? 0;
      Map<String, dynamic> data = <String, dynamic>{
        'id':siteSurveyObjectRequests.id,
        'onSiteName': siteSurveyObjectRequests.onSiteName,
        'contactNumber':siteSurveyObjectRequests.contactNumber,
        'onSiteNumber':siteSurveyObjectRequests.onSiteNumber,
        'siteOwnerNumber': siteSurveyObjectRequests.siteOwnerNumber,
        'siteOwnerName': siteSurveyObjectRequests.siteOwnerName,
        'locationPIN': siteSurveyObjectRequests.locationPIN,
        'dueDate': siteSurveyObjectRequests.dueDate,
        'charger': siteSurveyObjectRequests.charger,
        'connectionType': siteSurveyObjectRequests.connectionType,
        'powerCapacity': siteSurveyObjectRequests.powerCapacity,
        'powerDemand': siteSurveyObjectRequests.powerDemand,
        'availablePower': siteSurveyObjectRequests.availablePower,
        'earthingValue': siteSurveyObjectRequests.earthingValue,
        "isSeperateLine":siteSurveyObjectRequests.isSeperateLine,
        'distance': siteSurveyObjectRequests.distance,
        'parking_length': siteSurveyObjectRequests.parkingLength,
        'parking_width': siteSurveyObjectRequests.parkingWidth,
        'isEvMeter': siteSurveyObjectRequests.isEvMeter,
        'isExit': siteSurveyObjectRequests.isExit,
        'isParkingArea': siteSurveyObjectRequests.isParkingArea,
        'isChargerArea': siteSurveyObjectRequests.isChargerArea,
        'civilWorkCharger': siteSurveyObjectRequests.civilWorkCharger,
        'footFall_Id': siteSurveyObjectRequests.footFall1,
        'chargerMountId': siteSurveyObjectRequests.chargerMount,
        'surveyedByUserId': userId,
      };

      Response response =
      await _dio.post(siteSurvey, data: json.encode(data), options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if (kDebugMode) {
        print("hitSaveSiteSurvey : $error");
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitSaveSiteSurvey : $error");
      }
      return false;
    }
    return false;
  }

  // POST => {{cpo_base}}/api/site-survey/doc
  // @param data, doc
  // data  { "siteSurveyId"  : 2, "title"  : "ENTRY"}
  // doc file
  Future<bool> hitSiteSurveyDoc(UploadDocData uploadDocData, String filePath) async {
    try {
      String token = DatabaseOperation.databaseOperation.getBearerToken() ?? "";
      var formData = FormData.fromMap({
        'data': uploadDocData.toRawJson(),
      });
      formData.files.add(MapEntry("doc",
          await MultipartFile.fromFile(filePath)));
      Response response =
      await _dio.post(siteSurveyUploadDoc, data: formData, options: Options(headers: {"Authorization": token}));
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            return true;
          } else {
            showSnackBar("error".tr, decodedResponse['message']);
            return false;
          }
        }
      }
    } on DioError catch (error) {
      if(error.response?.statusCode == 401) {

      } else {
        if (kDebugMode) {
          print("hitSiteSurveyDoc : $error");
        }
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitSiteSurveyDoc : $error");
      }
      return false;
    }
    return false;
  }

  // GET => {{cpo_base}}/api/common/charger-mounts
  Future<ChargerMountResponse?> hitChargerMountList() async {
    try {
      Response response =
      await _dio.get(commonChargerMount);
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            ChargerMountResponse chargerMountResponse = ChargerMountResponse.fromJson(response.data);
            return chargerMountResponse;
          } else {
            return null;
          }
        }
      }
    } on DioError catch (error) {
      if(error.response?.statusCode == 401) {

      } else {
        if (kDebugMode) {
          print("hitSiteSurveyDoc : $error");
        }
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitSiteSurveyDoc : $error");
      }
      return null;
    }
    return null;
  }

  // GET => {{cpo_base}}/api/common/foot-falls
  Future<FootFallResponse?> hitFootFallList() async {
    try {
      Response response =
      await _dio.get(commonFootFall);
      if (response.statusCode == 200) {
        if (response.data != null) {
          Map decodedResponse = response.data;
          if (decodedResponse['httpStatusCode'] == 200) {
            FootFallResponse footFallResponse = FootFallResponse.fromJson(response.data);
            return footFallResponse;
          } else {
            return null;
          }
        }
      }
    } on DioError catch (error) {
      if(error.response?.statusCode == 401) {

      } else {
        if (kDebugMode) {
          print("hitSiteSurveyDoc : $error");
        }
      }
    } on Exception catch (error) {
      if (kDebugMode) {
        print("hitSiteSurveyDoc : $error");
      }
      return null;
    }
    return null;
  }
}
