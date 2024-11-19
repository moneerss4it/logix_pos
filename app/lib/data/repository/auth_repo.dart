import 'dart:convert';
import 'package:app/data/api/api_client.dart';

import 'package:app/data/model/get_logo_model.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as Http;
class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login({required String memberId,required String user, required String password}) async {

    return await apiClient.postData(AppConstants.LOGIN_URI,body: json.encode({
      "userName":user,
      "password": password,
      "memberId": memberId
    }),
    headers: {
      'Content-Type':'application/json'
    }
    );
  }
  Future<Response> getMember({required String memberId}) async {


    return await apiClient.postData(AppConstants.GET_MEMBER_URL+"?MemberId=$memberId",
      headers: {'accept':' */*'}

    ,);
  }



  Future<Response> getToken() async {
    return apiClient.postData(AppConstants.GENERATE_TOKEN_URL,);
  }
  Future<bool> saveUserToken(String token,String erpUrl,int userId) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    await sharedPreferences.setString(AppConstants.ERP_URL, erpUrl);
    await sharedPreferences.setInt(AppConstants.USER_ID, userId);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<bool> saveMember(String member) async {



    return await sharedPreferences.setString(AppConstants.MEMBER_ID, member);
  }

  Future<bool> saveGetLogoModel(GetLogoModel model) async {



    return await sharedPreferences.setString(AppConstants.GETLOGO,jsonEncode(model.toJson()));
  }
  Future<bool> SaveIntroScreen() async {



    return await sharedPreferences.setBool(AppConstants.INTRO, true);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<GetLogoModel> getLogo() async {
    String? jsonString = sharedPreferences.getString(AppConstants.GETLOGO); // Retrieve JSON string from SharedPreferences
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString); // Convert JSON string back to map
      return GetLogoModel.fromJson(jsonMap);
  }
    return GetLogoModel();}

  bool isGetMember() {
    return sharedPreferences.containsKey(AppConstants.MEMBER_ID);
  }
  bool isIntroScreen() {
    return sharedPreferences.containsKey(AppConstants.INTRO);
  }

  String GetMember() {
    return sharedPreferences.getString(AppConstants.MEMBER_ID).toString();
  }
  String erpUrl() {
    return sharedPreferences.getString(AppConstants.ERP_URL).toString();
  }

  int getUserId() {
    return sharedPreferences.getInt(AppConstants.USER_ID)??0;
  }

  void logOut() {
    sharedPreferences.remove(AppConstants.TOKEN);
  }



  void logOutMember() {
    sharedPreferences.remove(AppConstants.MEMBER_ID);
  }


}