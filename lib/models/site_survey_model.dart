class SiteSurveyModel {
  int? id;
  String? onSiteName;
  String? onSiteNumber;
  String? siteOwnerNumber;
  String? siteOwnerName;
  String? locationPIN;
  String? dueDate;
  List<String>? charger;
  String? connectionType;
  double? powerCapacity;
  double? powerDemand;
  double? availablePower;
  double? earthingValue;
  int? distance;
  int? parkingLength;
  int? parkingWidth;
  bool? isSeperateLine;
  bool? isEvMeter;
  bool? isExit;
  bool? isParkingArea;
  bool? isChargerArea;
  List<String>? civilWorkCharger;
  List<int>? footFallId;
  int? chargerMountId;
  int? surveyedByUserId;

  SiteSurveyModel(
      {this.id,
        this.onSiteName,
        this.onSiteNumber,
        this.siteOwnerNumber,
        this.siteOwnerName,
        this.locationPIN,
        this.dueDate,
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
        this.civilWorkCharger,
        this.footFallId,
        this.chargerMountId,
        this.surveyedByUserId});

  SiteSurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    onSiteName = json['onSiteName'];
    onSiteNumber = json['onSiteNumber'];
    siteOwnerNumber = json['siteOwnerNumber'];
    siteOwnerName = json['siteOwnerName'];
    locationPIN = json['locationPIN'];
    dueDate = json['dueDate'];
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
    civilWorkCharger = json['civilWorkCharger'].cast<String>();
    footFallId = json['footFall_Id'].cast<int>();
    chargerMountId = json['chargerMountId'];
    surveyedByUserId = json['surveyedByUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['onSiteName'] = onSiteName;
    data['onSiteNumber'] = onSiteNumber;
    data['siteOwnerNumber'] = siteOwnerNumber;
    data['siteOwnerName'] = siteOwnerName;
    data['locationPIN'] = locationPIN;
    data['dueDate'] = dueDate;
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
    data['civilWorkCharger'] = civilWorkCharger;
    data['footFall_Id'] = footFallId;
    data['chargerMountId'] = chargerMountId;
    data['surveyedByUserId'] = surveyedByUserId;
    return data;
  }
}
