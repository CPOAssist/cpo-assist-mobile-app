
import 'package:hive/hive.dart';

class DatabaseOperation {
  DatabaseOperation._internal();

  static DatabaseOperation databaseOperation = DatabaseOperation._internal();

  factory DatabaseOperation() {
    return databaseOperation;
  }

  late Box applicationUtils;

  final String boxAppUtils = "applicationUtils";

  final String keyBearerToken = "keyBearerToken";
  final String keyUserId = "keyUserId";
  final String keyEmail = "keyEmail";
  final String keyFirstName = "keyFirstName";
  final String keyLastName = "keyLastName";
  final String keyPhoneNumber = "keyPhoneNumber";
  final String keyVendorName = "keyVendorName";
  final String keySiteSurvey = "keySiteSurvey";

  void clearApplicationUtils() async {
    await applicationUtils.clear();
  }

  void clearKeyValue(String key) async {
    await applicationUtils.put(key, null);
  }

  void setBearerToken(String? refreshToken) async {
    await applicationUtils.put(keyBearerToken, refreshToken);
  }

  String? getBearerToken() {
    dynamic result = applicationUtils.get(keyBearerToken);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setUserId(int? userId) async {
    await applicationUtils.put(keyUserId, userId);
  }

  int? getUserId() {
    dynamic result = applicationUtils.get(keyUserId);
    if (result != null) {
      return result;
    }
  }

  void setEmail(String? email) async {
    await applicationUtils.put(keyEmail, email);
  }

  String getEmail() {
    dynamic result = applicationUtils.get(keyEmail);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setFirstName(String? firstName) async {
    await applicationUtils.put(keyFirstName, firstName);
  }

  String getFirstName() {
    dynamic result = applicationUtils.get(keyFirstName);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setLastName(String? lastName) async {
    await applicationUtils.put(keyLastName, lastName);
  }

  String getLastName() {
    dynamic result = applicationUtils.get(keyLastName);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setPhoneNumber(String? phoneNumber) async {
    await applicationUtils.put(keyPhoneNumber, phoneNumber);
  }

  String getPhoneNumber() {
    dynamic result = applicationUtils.get(keyPhoneNumber);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setVendorName(String? vendorName) async {
    await applicationUtils.put(keyVendorName, vendorName);
  }

  String getVendorName() {
    dynamic result = applicationUtils.get(keyVendorName);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }

  void setSiteSurvey(String? siteSurvey) async {
    await applicationUtils.put(keySiteSurvey, siteSurvey);
  }

  String getSiteSurvey() {
    dynamic result = applicationUtils.get(keySiteSurvey);
    if (result != null) {
      return result;
    } else {
      return "";
    }
  }
}