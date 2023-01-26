class UploadDocResponse {
  String? message;
  UploadDData? data;
  String? httpStatus;
  int? httpStatusCode;

  UploadDocResponse(
      {this.message, this.data, this.httpStatus, this.httpStatusCode});

  UploadDocResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? UploadDData.fromJson(json['data']) : null;
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

class UploadDData {
  int? id;
  FileUrl? fileUrl;
  String? title;

  UploadDData({this.id, this.fileUrl, this.title});

  UploadDData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['blobName'] = blobName;
    data['contentType'] = contentType;
    data['contentLength'] = contentLength;
    data['fileName'] = fileName;
    return data;
  }
}
