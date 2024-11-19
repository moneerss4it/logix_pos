




import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:app/controller/auth_controller.dart';
import 'package:app/data/api/api_client.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostingInvoicesRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  late final String  appUrl;

  PostingInvoicesRepo({required this.apiClient, required this.sharedPreferences}) {
     appUrl = Get.find<AuthController>().getErpUrl() ;
    //appUrl = "http://localhost:8080" ;

  }





  Future<Response>  createTransaction( Map<String,dynamic> body,Map<String, String>  headers ) async {
    return apiClient.postData(AppConstants.CREATE_TRANSACTION_URL,appUrl: appUrl,body: body

    ,headers:headers );
  }


  Future<Response>  postSaleTransaction( Map<String,dynamic> body,) async {
    return apiClient.postData(AppConstants.INSERT_SAL_POS_CLOSE_CASH,body:json.encode(body)

);
  }



  Future<dio.Response> postDataWebService(Map<String,dynamic> body,Map<String, String>  headers) async {

    print(appUrl+AppConstants.CREATE_TRANSACTION_URL);
      return apiClient.postDataWebService(url:appUrl+AppConstants.CREATE_TRANSACTION_URL,body: body, headers:  headers, );

  }


}