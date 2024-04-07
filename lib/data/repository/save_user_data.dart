import 'dart:convert';
import 'package:circletraning/core/utils/app_constants.dart';
import 'package:circletraning/data/datasource/remote/dio/api_service.dart';
import 'package:circletraning/data/models/response/login_model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/helpers/extentions.dart';
import '../../features/main_screen.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final ApiService apiService;

  SaveUserData({required this.sharedPreferences, required this.apiService});

  /// save SharedData

  Future<void> saveUserData(LoginBody loginBody) async {
    String userSavedData = json.encode(loginBody.data!.user);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
    apiService.updateHeader(
      token: loginBody.data!.auth!.token,
    );
  }

  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveUserToken(String userTOKEN) async {
    apiService.updateHeader(token: userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveTitle(String title) async {
    try {
      await sharedPreferences.setString(AppConstants.title, title);
    } catch (e) {
      rethrow;
    }
  }

  ///get SharedData
  UserData? getUserData() {
    String? userSavedData = sharedPreferences.getString(AppConstants.userData);
    if (userSavedData != null) {
      Map<String, dynamic> userData = json.decode(userSavedData);
      UserData userModel = UserData.fromJson(userData);
      return userModel;
    }
    return null;
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }

  String getLang() {
    return sharedPreferences.getString(AppConstants.lang) ?? "ar";
  }

  String getCurrency() {
    return sharedPreferences.getString(AppConstants.currency) ?? "USD";
  }

  String getBranchTitle() {
    return sharedPreferences.getString(AppConstants.title) ?? "";
  }

  /// check SharedData
  bool isSaveBranchId() {
    return sharedPreferences.containsKey(AppConstants.branchId);
  }

  ///clear SharedData
  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.userData);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    await sharedPreferences.remove(AppConstants.title);
    pushAndRemoveUntil(const MainScreen());

    return true;
  }
}
