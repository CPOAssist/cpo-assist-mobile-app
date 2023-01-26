import 'dart:convert';

class UploadDocData {
  UploadDocData({this.siteSurveyId, this.title});

  String? siteSurveyId;
  String? title;

  factory UploadDocData.fromRawJson(String str) =>
      UploadDocData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UploadDocData.fromJson(Map<String, dynamic> json) => UploadDocData(
    siteSurveyId: (json["siteSurveyId"] == null) ? null : json["siteSurveyId"],
    title: (json["title"] == null) ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "siteSurveyId": (siteSurveyId == null) ? null : siteSurveyId,
    "title": (title == null) ? null : title,
  };
}