class UpdateSiteSurveyStatus {
  String? message;
  Data? data;
  String? httpStatus;
  int? httpStatusCode;

  UpdateSiteSurveyStatus(
      {this.message, this.data, this.httpStatus, this.httpStatusCode});

  UpdateSiteSurveyStatus.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  int? id;
  String? status;
  String? onSiteName;
  String? contactNumber;
  dynamic onSiteNumber;
  String? primaryNumber;
  String? siteOwnerName;
  String? secondryNumber;
  dynamic siteOwnerNumber;
  String? designation;
  String? email;
  String? locationPIN;
  dynamic dueDate;
  List<String>? charger;
  dynamic connectionType;
  String? siteStatus;
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
  List<dynamic>? civilWorkCharger;
  Site? site;
  Address? address;
  List<dynamic>? footFall;
  dynamic chargerMount;
  Handler? createdByUser;
  Handler? surveyedByUser;
  List<Documents>? documents;

  Data(
      {this.createdAt,
        this.id,
        this.status,
        this.onSiteName,
        this.contactNumber,
        this.onSiteNumber,
        this.primaryNumber,
        this.siteOwnerName,
        this.secondryNumber,
        this.siteOwnerNumber,
        this.designation,
        this.email,
        this.locationPIN,
        this.dueDate,
        this.charger,
        this.connectionType,
        this.siteStatus,
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
        this.site,
        this.address,
        this.footFall,
        this.chargerMount,
        this.createdByUser,
        this.surveyedByUser,
        this.documents});

  Data.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    id = json['id'];
    status = json['status'];
    onSiteName = json['onSiteName'];
    contactNumber = json['contactNumber'];
    onSiteNumber = json['onSiteNumber'];
    primaryNumber = json['primaryNumber'];
    siteOwnerName = json['siteOwnerName'];
    secondryNumber = json['secondryNumber'];
    siteOwnerNumber = json['siteOwnerNumber'];
    designation = json['designation'];
    email = json['email'];
    locationPIN = json['locationPIN'];
    dueDate = json['dueDate'];
    charger = json['charger'].cast<String>();
    connectionType = json['connectionType'];
    siteStatus = json['siteStatus'];
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
    civilWorkCharger = json['civilWorkCharger'];
    site = json['site'] != null ? Site.fromJson(json['site']) : null;
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    footFall = json['footFall'];
    chargerMount = json['chargerMount'];
    createdByUser = json['createdByUser'] != null
        ? Handler.fromJson(json['createdByUser'])
        : null;
    surveyedByUser = json['surveyedByUser'] != null
        ? Handler.fromJson(json['surveyedByUser'])
        : null;
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['id'] = id;
    data['status'] = status;
    data['onSiteName'] = onSiteName;
    data['contactNumber'] = contactNumber;
    data['onSiteNumber'] = onSiteNumber;
    data['primaryNumber'] = primaryNumber;
    data['siteOwnerName'] = siteOwnerName;
    data['secondryNumber'] = secondryNumber;
    data['siteOwnerNumber'] = siteOwnerNumber;
    data['designation'] = designation;
    data['email'] = email;
    data['locationPIN'] = locationPIN;
    data['dueDate'] = dueDate;
    data['charger'] = charger;
    data['connectionType'] = connectionType;
    data['siteStatus'] = siteStatus;
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
    if (civilWorkCharger != null) {
      data['civilWorkCharger'] =
          civilWorkCharger!.map((v) => v.toJson()).toList();
    }
    if (site != null) {
      data['site'] = site!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (footFall != null) {
      data['footFall'] = footFall!.map((v) => v.toJson()).toList();
    }
    data['chargerMount'] = chargerMount;
    if (createdByUser != null) {
      data['createdByUser'] = createdByUser!.toJson();
    }
    if (surveyedByUser != null) {
      data['surveyedByUser'] = surveyedByUser!.toJson();
    }
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Site {
  int? id;
  String? projectName;
  String? phoneNumber;
  String? alternateNumber;
  String? website;
  String? email;
  String? gstNumber;
  String? dealer;
  String? opportunitySize;
  dynamic status;
  List<String>? charger;
  int? proposed;
  String? projectNumber;
  Address? address;
  Handler? handler;
  Branch? branch;
  Customer? customer;
  Category? category;
  ProjectSource? projectSource;
  ProjectStatus? projectStatus;
  ProjectScope? projectScope;
  dynamic mainCPOId;

  Site(
      {this.id,
        this.projectName,
        this.phoneNumber,
        this.alternateNumber,
        this.website,
        this.email,
        this.gstNumber,
        this.dealer,
        this.opportunitySize,
        this.status,
        this.charger,
        this.proposed,
        this.projectNumber,
        this.address,
        this.handler,
        this.branch,
        this.customer,
        this.category,
        this.projectSource,
        this.projectStatus,
        this.projectScope,
        this.mainCPOId});

  Site.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['projectName'];
    phoneNumber = json['phoneNumber'];
    alternateNumber = json['alternateNumber'];
    website = json['website'];
    email = json['email'];
    gstNumber = json['gstNumber'];
    dealer = json['dealer'];
    opportunitySize = json['opportunitySize'];
    status = json['status'];
    charger = json['charger'].cast<String>();
    proposed = json['proposed'];
    projectNumber = json['projectNumber'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    handler =
    json['handler'] != null ? Handler.fromJson(json['handler']) : null;
    branch =
    json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    projectSource = json['projectSource'] != null
        ? ProjectSource.fromJson(json['projectSource'])
        : null;
    projectStatus = json['projectStatus'] != null
        ? ProjectStatus.fromJson(json['projectStatus'])
        : null;
    projectScope = json['projectScope'] != null
        ? ProjectScope.fromJson(json['projectScope'])
        : null;
    mainCPOId = json['mainCPOId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['projectName'] = projectName;
    data['phoneNumber'] = phoneNumber;
    data['alternateNumber'] = alternateNumber;
    data['website'] = website;
    data['email'] = email;
    data['gstNumber'] = gstNumber;
    data['dealer'] = dealer;
    data['opportunitySize'] = opportunitySize;
    data['status'] = status;
    data['charger'] = charger;
    data['proposed'] = proposed;
    data['projectNumber'] = projectNumber;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (handler != null) {
      data['handler'] = handler!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (projectSource != null) {
      data['projectSource'] = projectSource!.toJson();
    }
    if (projectStatus != null) {
      data['projectStatus'] = projectStatus!.toJson();
    }
    if (projectScope != null) {
      data['projectScope'] = projectScope!.toJson();
    }
    data['mainCPOId'] = mainCPOId;
    return data;
  }
}

class Address {
  int? id;
  String? address;
  String? pincode;
  City? city;

  Address({this.id, this.address, this.pincode, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    pincode = json['pincode'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['pincode'] = pincode;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  State? state;

  City({this.id, this.name, this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}

class State {
  int? id;
  String? name;
  Country? country;

  State({this.id, this.name, this.country});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country =
    json['country'] != null ? Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? iso2;
  String? iso3;
  String? callingCode;

  Country({this.id, this.name, this.iso2, this.iso3, this.callingCode});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    callingCode = json['callingCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['callingCode'] = callingCode;
    return data;
  }
}

class Handler {
  int? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  List<Authorities>? authorities;
  Address? address;
  dynamic mainCPOId;
  dynamic companyName;
  dynamic fullName;
  dynamic website;
  dynamic gstNumber;
  dynamic logo;
  dynamic vendorInfo;

  Handler(
      {this.id,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.authorities,
        this.address,
        this.mainCPOId,
        this.companyName,
        this.fullName,
        this.website,
        this.gstNumber,
        this.logo,
        this.vendorInfo});

  Handler.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    if (json['authorities'] != null) {
      authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        authorities!.add(Authorities.fromJson(v));
      });
    }
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    mainCPOId = json['mainCPOId'];
    companyName = json['companyName'];
    fullName = json['fullName'];
    website = json['website'];
    gstNumber = json['gstNumber'];
    logo = json['logo'];
    vendorInfo = json['vendorInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    if (authorities != null) {
      data['authorities'] = authorities!.map((v) => v.toJson()).toList();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['mainCPOId'] = mainCPOId;
    data['companyName'] = companyName;
    data['fullName'] = fullName;
    data['website'] = website;
    data['gstNumber'] = gstNumber;
    data['logo'] = logo;
    data['vendorInfo'] = vendorInfo;
    return data;
  }
}

class Authorities {
  int? id;
  String? authority;
  dynamic parentAuthority;
  List<Privileges>? privileges;

  Authorities({this.id, this.authority, this.parentAuthority, this.privileges});

  Authorities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authority = json['authority'];
    parentAuthority = json['parentAuthority'];
    if (json['privileges'] != null) {
      privileges = <Privileges>[];
      json['privileges'].forEach((v) {
        privileges!.add(Privileges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['authority'] = authority;
    data['parentAuthority'] = parentAuthority;
    if (privileges != null) {
      data['privileges'] = privileges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Privileges {
  int? id;
  String? privilege;

  Privileges({this.id, this.privilege});

  Privileges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    privilege = json['privilege'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['privilege'] = privilege;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? phoneNumber;
  String? website;
  String? email;
  String? gstNumber;
  BranchType? branchType;
  Address? address;
  Handler? user;
  String? status;

  Branch(
      {this.id,
        this.name,
        this.phoneNumber,
        this.website,
        this.email,
        this.gstNumber,
        this.branchType,
        this.address,
        this.user,
        this.status});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    website = json['website'];
    email = json['email'];
    gstNumber = json['gstNumber'];
    branchType = json['branchType'] != null
        ? BranchType.fromJson(json['branchType'])
        : null;
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    user = json['user'] != null ? Handler.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['website'] = website;
    data['email'] = email;
    data['gstNumber'] = gstNumber;
    if (branchType != null) {
      data['branchType'] = branchType!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class BranchType {
  int? id;
  String? branchType;
  String? status;

  BranchType({this.id, this.branchType, this.status});

  BranchType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchType = json['branchType'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branchType'] = branchType;
    data['status'] = status;
    return data;
  }
}

class Customer {
  int? id;
  String? customerName;
  String? phoneNumber;
  String? website;
  String? email;
  String? gstNumber;
  Address? address;
  Handler? user;
  String? status;

  Customer(
      {this.id,
        this.customerName,
        this.phoneNumber,
        this.website,
        this.email,
        this.gstNumber,
        this.address,
        this.user,
        this.status});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customerName'];
    phoneNumber = json['phoneNumber'];
    website = json['website'];
    email = json['email'];
    gstNumber = json['gstNumber'];
    address =
    json['address'] != null ? Address.fromJson(json['address']) : null;
    user = json['user'] != null ? Handler.fromJson(json['user']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customerName'] = customerName;
    data['phoneNumber'] = phoneNumber;
    data['website'] = website;
    data['email'] = email;
    data['gstNumber'] = gstNumber;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Category {
  int? id;
  String? category;

  Category({this.id, this.category});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    return data;
  }
}

class ProjectSource {
  int? id;
  String? source;

  ProjectSource({this.id, this.source});

  ProjectSource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['source'] = source;
    return data;
  }
}

class ProjectStatus {
  int? id;
  String? status;

  ProjectStatus({this.id, this.status});

  ProjectStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    return data;
  }
}

class ProjectScope {
  int? id;
  String? scope;

  ProjectScope({this.id, this.scope});

  ProjectScope.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scope'] = scope;
    return data;
  }
}

class Documents {
  int? id;
  FileUrl? fileUrl;
  String? title;

  Documents({this.id, this.fileUrl, this.title});

  Documents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileUrl =
    json['fileUrl'] != null ? FileUrl.fromJson(json['fileUrl']) : null;
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (fileUrl != null) {
      data['fileUrl'] = fileUrl!.toJson();
    }
    data['title'] = title;
    return data;
  }
}

class FileUrl {
  int? id;
  String? blobName;
  String? contentType;
  int? contentLength;
  String? fileName;

  FileUrl(
      {this.id,
        this.blobName,
        this.contentType,
        this.contentLength,
        this.fileName});

  FileUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    blobName = json['blobName'];
    contentType = json['contentType'];
    contentLength = json['contentLength'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['blobName'] = blobName;
    data['contentType'] = contentType;
    data['contentLength'] = contentLength;
    data['fileName'] = fileName;
    return data;
  }
}
