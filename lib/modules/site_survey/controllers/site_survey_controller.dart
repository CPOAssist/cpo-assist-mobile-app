import 'dart:async';

import 'package:cpo_assists/models/requests/upload_doc_data.dart';
import 'package:cpo_assists/models/responses/charger_mount_response.dart';
import 'package:cpo_assists/models/responses/footdfall_response.dart';
import 'package:cpo_assists/models/responses/site_survey_response.dart';
import 'package:cpo_assists/network/rest_services.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class SiteSurveyController extends GetxController {
  RxBool initialViewVisible = true.obs;
  RxBool processViewVisible = false.obs;
  RxBool processViewOneVisible = true.obs;
  RxBool processViewTwoVisible = false.obs;
  RxBool processViewThreeVisible = false.obs;
  RxBool processViewFourVisible = false.obs;
  RxBool processViewFiveVisible = false.obs;

  List<String> proposedChargerList = [];
  final siteIdTextController = TextEditingController();
  final salesHandlerTextController = TextEditingController();
  final contactNumberTextController = TextEditingController();
  final branchTextController = TextEditingController();
  final siteNameTextController = TextEditingController();
  final customerNameTextController = TextEditingController();
  final siteAddressTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final stateTextController = TextEditingController();
  final pinCodeTextController = TextEditingController();

  final onsiteContactNameTextController = TextEditingController();
  final contactNumber2TextController = TextEditingController();
  final siteOwnerNameTextController = TextEditingController();
  final siteOwnerContactTextController = TextEditingController();
  final locationPinTextController = TextEditingController();
  final dateTextController = TextEditingController();

  final meterConnectionTypeTextController = TextEditingController();
  final approvedPowerCapacityTextController = TextEditingController();
  final siteMaxPowerDemandTextController = TextEditingController();
  final availablePowerTextController = TextEditingController();
  final earthingTestValueTextController = TextEditingController();

  final distanceFromNearestDBTextController = TextEditingController();
  final spaceAvailableLTextController = TextEditingController();
  final spaceAvailableBTextController = TextEditingController();

  final assignedSearchTextController = TextEditingController();
  final savedSearchTextController = TextEditingController();
  final historySearchTextController = TextEditingController();

  String? uploadLatestBillPath;
  String? entryForParkingPath;
  String? exitFromParkingPath;
  String? chargerMountingPath;
  String? evParkingAreaPath;
  String? nearestDbPath;
  String? overallSitePath;
  String? other1Path;
  String? other2Path;
  String? alternateSite1Path;
  String? alternateSite2Path;

  String? chargerMountingAvailable;
  List<String> civilWorkRequired = [];
  List<String> sFootFall = [];

  bool? isSeparateLineOnExistingMeter;
  bool? isRequirementOfEvMeter;
  bool? isParkingAreaCovered;
  bool? isClearEntryExitForEv;
  bool? isChargerAreaCovered;

  StreamController<String>? updateAndRefreshStreamController;

  void initializeUpdateAndRefreshStreamController() {
    updateAndRefreshStreamController = StreamController.broadcast();
  }

  void dismissUpdateAndRefreshStreamController() {
    updateAndRefreshStreamController?.close();
  }

  void resetViews() {
    processViewOneVisible.value = true;
    processViewTwoVisible.value = false;
    processViewThreeVisible.value = false;
    processViewFourVisible.value = false;
    processViewFiveVisible.value = false;
    initialViewVisible.value = true;
    processViewVisible.value = false;

    proposedChargerList = [];
    siteIdTextController.text = "";
    salesHandlerTextController.text = "";
    contactNumberTextController.text = "";
    branchTextController.text = "";
    siteNameTextController.text = "";
    customerNameTextController.text = "";
    siteAddressTextController.text = "";
    cityTextController.text = "";
    stateTextController.text = "";
    pinCodeTextController.text = "";

    onsiteContactNameTextController.text = "";
    contactNumber2TextController.text = "";
    siteOwnerNameTextController.text = "";
    siteOwnerContactTextController.text = "";
    locationPinTextController.text = "";
    dateTextController.text = "";

    meterConnectionTypeTextController.text = "";
    approvedPowerCapacityTextController.text = "";
    siteMaxPowerDemandTextController.text = "";
    availablePowerTextController.text = "";
    earthingTestValueTextController.text = "";

    distanceFromNearestDBTextController.text = "";
    spaceAvailableLTextController.text = "";
    spaceAvailableBTextController.text = "";

    assignedSearchTextController.text = "";
    savedSearchTextController.text = "";
    historySearchTextController.text = "";

    uploadLatestBillPath = null;
    entryForParkingPath = null;
    exitFromParkingPath = null;
    chargerMountingPath = null;
    evParkingAreaPath = null;
    nearestDbPath = null;
    overallSitePath = null;
    other1Path = null;
    other2Path = null;
    alternateSite1Path = null;
    alternateSite2Path = null;

    chargerMountingAvailable = null;
    civilWorkRequired = [];
    sFootFall = [];

    isSeparateLineOnExistingMeter = null;
    isRequirementOfEvMeter = null;
    isParkingAreaCovered = null;
    isClearEntryExitForEv = null;
    isChargerAreaCovered = null;
  }

  ScrollController assignScrollController = ScrollController();
  int page = 1;
  int limit = 10;
  RxInt selectedPageIndex = 0.obs;

  RxList<SiteSurveyObjectRequests> siteSurveyAssignObjectRequestList =
      <SiteSurveyObjectRequests>[].obs;
  RxList<SiteSurveyObjectRequests> siteSurveySavedObjectRequestList =
      <SiteSurveyObjectRequests>[].obs;
  RxList<SiteSurveyObjectRequests> siteSurveyHistoryObjectRequestList =
      <SiteSurveyObjectRequests>[].obs;

  void updateAssignList() {
    RestServices.instance.hitSiteSurveyAssign(page, limit, "");
  }

  void updateSavedList() {
    RestServices.instance.hitSiteSurveySaved(page, limit, "");
  }

  void updateHistoryList() {
    RestServices.instance.hitSiteSurveyHistory(page, limit, "");
  }

  void assignedSearchOperation() {}
  void savedSearchOperation() {}
  void historySearchOperation() {}

  Future<bool> uploadDoc(String filePath, String title, String surveyId) async {
    UploadDocData uploadDocData =
        UploadDocData(siteSurveyId: surveyId, title: title);
    bool result =
        await RestServices.instance.hitSiteSurveyDoc(uploadDocData, filePath);
    return result;
  }

  void updateProgressView1Data() async {
    try {
      showLoader();
      if(proposedChargerList.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (onsiteContactNameTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (contactNumber2TextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (siteOwnerNameTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (siteOwnerContactTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      if (siteOwnerContactTextController.text.length != 10) {
        showSnackBar("error".tr, "Enter valid  Site Owner Contact number.");
        return;
      }
      if (locationPinTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (dateTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      SiteSurveyObjectRequests siteSurveyObjectRequests =
          GetIt.I<Map<String, dynamic>>(
              instanceName: "site_survey")['siteSurveyObjectRequest'];

      siteSurveyObjectRequests.charger = proposedChargerList;
      siteSurveyObjectRequests.contactNumber =
          contactNumber2TextController.text;
      siteSurveyObjectRequests.onSiteName =
          onsiteContactNameTextController.text;
      siteSurveyObjectRequests.onSiteNumber =
          onsiteContactNameTextController.text;
      siteSurveyObjectRequests.siteOwnerName = siteOwnerNameTextController.text;
      siteSurveyObjectRequests.siteOwnerNumber =
          siteOwnerContactTextController.text;
      siteSurveyObjectRequests.locationPIN = locationPinTextController.text;
      siteSurveyObjectRequests.dueDate = dateTextController.text;

      bool result = await RestServices.instance
          .hitSaveSiteSurvey(siteSurveyObjectRequests);

      if (result) {
        updateAndRefreshStreamController!.sink.add("");
      }
    } finally {
      hideLoader();
    }
  }

  void updateProgressView2Data() async {
    try {
      showLoader();
      if (meterConnectionTypeTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (approvedPowerCapacityTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (siteMaxPowerDemandTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (availablePowerTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (uploadLatestBillPath == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      if (uploadLatestBillPath != null && uploadLatestBillPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (isSeparateLineOnExistingMeter == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (earthingTestValueTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (isRequirementOfEvMeter == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      SiteSurveyObjectRequests siteSurveyObjectRequests =
          GetIt.I<Map<String, dynamic>>(
              instanceName: "site_survey")['siteSurveyObjectRequest'];

      siteSurveyObjectRequests!.connectionType =
          (meterConnectionTypeTextController.text
                  .toLowerCase()
                  .contains("single"))
              ? "SINGLE_PHASE"
              : "THREE_PHASE";
      siteSurveyObjectRequests!.powerCapacity =
          approvedPowerCapacityTextController.text;
      siteSurveyObjectRequests!.powerDemand =
          siteMaxPowerDemandTextController.text;
      siteSurveyObjectRequests!.availablePower =
          availablePowerTextController.text;
      siteSurveyObjectRequests!.isSeperateLine = isSeparateLineOnExistingMeter;
      siteSurveyObjectRequests!.earthingValue =
          earthingTestValueTextController.text;
      siteSurveyObjectRequests!.isEvMeter = isRequirementOfEvMeter;

      bool result = await RestServices.instance
          .hitSaveSiteSurvey(siteSurveyObjectRequests);

      if (result) {
        updateAndRefreshStreamController!.sink.add("");
      }
    } finally {
      hideLoader();
    }
  }

  void updateProgressView3Data() {
    try {
      if (entryForParkingPath == null ||
          exitFromParkingPath == null ||
          chargerMountingPath == null ||
          evParkingAreaPath == null ||
          nearestDbPath == null ||
          overallSitePath == null ||
          other1Path == null ||
          other2Path == null ||
          alternateSite1Path == null ||
          alternateSite2Path == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (entryForParkingPath != null && entryForParkingPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (exitFromParkingPath != null && exitFromParkingPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (chargerMountingPath != null && chargerMountingPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (evParkingAreaPath != null && evParkingAreaPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (nearestDbPath != null && nearestDbPath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (overallSitePath != null && overallSitePath!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (other1Path != null && other1Path!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (other2Path != null && other2Path!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (alternateSite1Path != null && alternateSite1Path!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (alternateSite2Path != null && alternateSite2Path!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      updateAndRefreshStreamController!.sink.add("");
    } finally {}
  }

  void updateProgressView4Data() async {
    try {
      showLoader();
      if (distanceFromNearestDBTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (spaceAvailableLTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (spaceAvailableBTextController.text.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (isClearEntryExitForEv == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (isParkingAreaCovered == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (isChargerAreaCovered == null) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (chargerMountingAvailable != null &&
          chargerMountingAvailable!.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (civilWorkRequired.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }
      if (sFootFall.isEmpty) {
        showSnackBar("error".tr, "All fields are mandatory.");
        return;
      }

      SiteSurveyObjectRequests siteSurveyObjectRequests =
          GetIt.I<Map<String, dynamic>>(
              instanceName: "site_survey")['siteSurveyObjectRequest'];

      siteSurveyObjectRequests!.distance =
      num.parse(distanceFromNearestDBTextController.text) * 1.0;
      siteSurveyObjectRequests.parkingWidth =
          num.parse(spaceAvailableBTextController.text) * 1.0;
      siteSurveyObjectRequests!.parkingLength =
          num.parse(spaceAvailableLTextController.text) * 1.0;
      siteSurveyObjectRequests!.isExit = isClearEntryExitForEv;
      siteSurveyObjectRequests!.isParkingArea = isParkingAreaCovered;
      siteSurveyObjectRequests!.isChargerArea = isChargerAreaCovered;
      siteSurveyObjectRequests!.chargerMount = (chargerMountingAvailable == "Floor") ? 1:2;
      siteSurveyObjectRequests!.civilWorkCharger = getCivilWorkChargerText(civilWorkRequired);
      siteSurveyObjectRequests!.footFall1 = getFootFallList();

      bool result = await RestServices.instance
          .hitSaveSiteSurvey(siteSurveyObjectRequests);

      if(result) {
        result = await RestServices.instance.hitSiteSurveyCompletedStatus(siteSurveyObjectRequests!.id!);

        if (result) {
          updateAndRefreshStreamController!.sink.add("");
        }
      }
    } finally {
      hideLoader();
    }
  }

  List<int> getFootFallList() {
    List<int> footFallList = [];
    for(int i = 0;i  <sFootFall.length;i++) {
      switch (sFootFall[i]) {
        case "More 2W":
          footFallList.add(1);
          break;
        case "More 4W":
          footFallList.add(2);
          break;
        case "Ideal for binding":
          footFallList.add(3);
          break;
        case "2W fleet":
          footFallList.add(4);
          break;
        case "3W fleet":
          footFallList.add(5);
          break;
        case "4W fleet":
          footFallList.add(6);
          break;
          default:
            break;
      }
    }
    return footFallList;
  }

  Future<bool> updateSitSurvey(int siteSurveyId) async {
    return await RestServices.instance.hitSiteSurveyUpdateStatus(siteSurveyId);
  }

  List<String> getCivilWorkChargerText(List<String> simpleText) {
    List<String> tempList = [];
    if(simpleText.contains("Flooring")) {
      tempList.add("FLOORING");
    } else if(simpleText.contains("Foundation")) {
      tempList.add("FOUNDATION");
    } else if(simpleText.contains("Wall Mounting")) {
      tempList.add("WALL_MOUNTING");
    } else if(simpleText.contains("Shed/Cover")) {
      tempList.add("SHED_COVER");
    }
    return tempList;
  }

  void getFootfallList() async {
    FootFallResponse? footFallResponse = await RestServices.instance.hitFootFallList();
    if(footFallResponse != null) {

    }
  }

  void getChargerMountList() async {
    ChargerMountResponse? chargerMountResponse = await RestServices.instance.hitChargerMountList();
    if(chargerMountResponse != null) {

    }
  }
}
