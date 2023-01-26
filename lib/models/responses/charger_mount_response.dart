class ChargerMountResponse {
  String? message;
  List<Data>? data;
  String? httpStatus;
  int? httpStatusCode;

  ChargerMountResponse(
      {this.message, this.data, this.httpStatus, this.httpStatusCode});

  ChargerMountResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    httpStatus = json['httpStatus'];
    httpStatusCode = json['httpStatusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['httpStatus'] = httpStatus;
    data['httpStatusCode'] = httpStatusCode;
    return data;
  }
}

class Data {
  int? id;
  String? mountingOption;

  Data({this.id, this.mountingOption});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mountingOption = json['mountingOption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mountingOption'] = mountingOption;
    return data;
  }
}
