class SiteSurveyDetailsResponse {
  String? message;
  Data? data;
  String? httpStatus;
  int? httpStatusCode;

  SiteSurveyDetailsResponse(
      {this.message, this.data, this.httpStatus, this.httpStatusCode});

  SiteSurveyDetailsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['httpStatus'] = httpStatus;
    data['httpStatusCode'] = httpStatusCode;
    return data;
  }
}

class Data {
  int? id;
  dynamic siteId;
  String? status;
  dynamic salesHandlerId;
  String? onSiteName;
  String? contactNumber;
  dynamic onSiteNumber;
  dynamic customerId;
  String? siteOwnerName;
  dynamic branchId;
  dynamic siteOwnerNumber;
  String? primaryNumber;
  String? locationPIN;
  String? secondryNumber;
  dynamic dueDate;
  String? designation;
  String? email;
  List<String>? charger;
  dynamic connectionType;
  dynamic powerCapacity;
  dynamic powerDemand;
  dynamic availablePower;
  dynamic earthingValue;
  dynamic distance;
  dynamic parkingLength;
  dynamic parkingWidth;
  dynamic isSeperateLine;
  dynamic isEvMeter;
  dynamic isExit;
  dynamic isParkingArea;
  dynamic isChargerArea;
  dynamic addressModel;
  List<dynamic>? footFallId;
  dynamic chargerMountId;
  int? createdByUserId;
  int? surveyedByUserId;
  String? siteStatus;
  List<DocumentsModels>? documentsModels;
  List<dynamic>? civilWorkCharger;

  Data(
      {this.id,
        this.siteId,
        this.status,
        this.salesHandlerId,
        this.onSiteName,
        this.contactNumber,
        this.onSiteNumber,
        this.customerId,
        this.siteOwnerName,
        this.branchId,
        this.siteOwnerNumber,
        this.primaryNumber,
        this.locationPIN,
        this.secondryNumber,
        this.dueDate,
        this.designation,
        this.email,
        this.charger,
        this.connectionType,
        this.powerCapacity,
        this.powerDemand,
        this.availablePower,
        this.earthingValue,
        this.distance,
        this.parkingLength,
        this.parkingWidth,
        this.isSeperateLine,
        this.isEvMeter,
        this.isExit,
        this.isParkingArea,
        this.isChargerArea,
        this.addressModel,
        this.footFallId,
        this.chargerMountId,
        this.createdByUserId,
        this.surveyedByUserId,
        this.siteStatus,
        this.documentsModels,
        this.civilWorkCharger});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteId = json['siteId'];
    status = json['status'];
    salesHandlerId = json['salesHandlerId'];
    onSiteName = json['onSiteName'];
    contactNumber = json['contactNumber'];
    onSiteNumber = json['onSiteNumber'];
    customerId = json['customerId'];
    siteOwnerName = json['siteOwnerName'];
    branchId = json['branchId'];
    siteOwnerNumber = json['siteOwnerNumber'];
    primaryNumber = json['primaryNumber'];
    locationPIN = json['locationPIN'];
    secondryNumber = json['secondryNumber'];
    dueDate = json['dueDate'];
    designation = json['designation'];
    email = json['email'];
    charger = json['charger'].cast<String>();
    connectionType = json['connectionType'];
    powerCapacity = json['powerCapacity'];
    powerDemand = json['powerDemand'];
    availablePower = json['availablePower'];
    earthingValue = json['earthingValue'];
    distance = json['distance'];
    parkingLength = json['parking_length'];
    parkingWidth = json['parking_width'];
    isSeperateLine = json['isSeperateLine'];
    isEvMeter = json['isEvMeter'];
    isExit = json['isExit'];
    isParkingArea = json['isParkingArea'];
    isChargerArea = json['isChargerArea'];
    addressModel = json['addressModel'];
    footFallId = json['footFall_Id'];
    chargerMountId = json['chargerMountId'];
    createdByUserId = json['createdByUserId'];
    surveyedByUserId = json['surveyedByUserId'];
    siteStatus = json['siteStatus'];
    if (json['documentsModels'] != null) {
      documentsModels = <DocumentsModels>[];
      json['documentsModels'].forEach((v) {
        documentsModels!.add(DocumentsModels.fromJson(v));
      });
    }
    civilWorkCharger = json['civilWorkCharger'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['siteId'] = siteId;
    data['status'] = status;
    data['salesHandlerId'] = salesHandlerId;
    data['onSiteName'] = onSiteName;
    data['contactNumber'] = contactNumber;
    data['onSiteNumber'] = onSiteNumber;
    data['customerId'] = customerId;
    data['siteOwnerName'] = siteOwnerName;
    data['branchId'] = branchId;
    data['siteOwnerNumber'] = siteOwnerNumber;
    data['primaryNumber'] = primaryNumber;
    data['locationPIN'] = locationPIN;
    data['secondryNumber'] = secondryNumber;
    data['dueDate'] = dueDate;
    data['designation'] = designation;
    data['email'] = email;
    data['charger'] = charger;
    data['connectionType'] = connectionType;
    data['powerCapacity'] = powerCapacity;
    data['powerDemand'] = powerDemand;
    data['availablePower'] = availablePower;
    data['earthingValue'] = earthingValue;
    data['distance'] = distance;
    data['parking_length'] = parkingLength;
    data['parking_width'] = parkingWidth;
    data['isSeperateLine'] = isSeperateLine;
    data['isEvMeter'] = isEvMeter;
    data['isExit'] = isExit;
    data['isParkingArea'] = isParkingArea;
    data['isChargerArea'] = isChargerArea;
    data['addressModel'] = addressModel;
    if (footFallId != null) {
      data['footFall_Id'] = footFallId!.map((v) => v.toJson()).toList();
    }
    data['chargerMountId'] = chargerMountId;
    data['createdByUserId'] = createdByUserId;
    data['surveyedByUserId'] = surveyedByUserId;
    data['siteStatus'] = siteStatus;
    if (documentsModels != null) {
      data['documentsModels'] =
          documentsModels!.map((v) => v.toJson()).toList();
    }
    if (civilWorkCharger != null) {
      data['civilWorkCharger'] =
          civilWorkCharger!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DocumentsModels {
  int? id;
  dynamic fileModel;
  String? title;
  dynamic siteSurveyId;
  dynamic multipartFile;
  String? filePath;

  DocumentsModels(
      {this.id,
        this.fileModel,
        this.title,
        this.siteSurveyId,
        this.multipartFile,
        this.filePath});

  DocumentsModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileModel = json['fileModel'];
    title = json['title'];
    siteSurveyId = json['siteSurveyId'];
    multipartFile = json['multipartFile'];
    filePath = json['filePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fileModel'] = fileModel;
    data['title'] = title;
    data['siteSurveyId'] = siteSurveyId;
    data['multipartFile'] = multipartFile;
    data['filePath'] = filePath;
    return data;
  }
}
