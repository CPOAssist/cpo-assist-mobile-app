class LoginResponse {
  String? message;
  Data? data;
  String? httpStatus;
  int? httpStatusCode;

  LoginResponse(
      {this.message, this.data, this.httpStatus, this.httpStatusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
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
  String? email;
  dynamic password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  List<String>? authorities;
  String? token;
  String? url;
  dynamic addressModel;
  dynamic companyName;
  dynamic fullName;
  dynamic website;
  dynamic gstNumber;
  dynamic logo;
  dynamic logoModel;
  dynamic infoModel;

  Data(
      {this.id,
        this.email,
        this.password,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.authorities,
        this.token,
        this.url,
        this.addressModel,
        this.companyName,
        this.fullName,
        this.website,
        this.gstNumber,
        this.logo,
        this.logoModel,
        this.infoModel});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    authorities = json['authorities'].cast<String>();
    token = json['token'];
    url = json['url'];
    addressModel = json['addressModel'];
    companyName = json['companyName'];
    fullName = json['fullName'];
    website = json['website'];
    gstNumber = json['gstNumber'];
    logo = json['logo'];
    logoModel = json['logoModel'];
    infoModel = json['infoModel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['phoneNumber'] = phoneNumber;
    data['authorities'] = authorities;
    data['token'] = token;
    data['url'] = url;
    data['addressModel'] = addressModel;
    data['companyName'] = companyName;
    data['fullName'] = fullName;
    data['website'] = website;
    data['gstNumber'] = gstNumber;
    data['logo'] = logo;
    data['logoModel'] = logoModel;
    data['infoModel'] = infoModel;
    return data;
  }
}