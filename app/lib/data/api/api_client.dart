import 'dart:convert';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';


import 'package:get/get.dart';
import 'package:app/data/api/error_response.dart';

import 'package:app/helper/utill/app_constants.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as Http;
import 'package:dio/dio.dart' as dio;
class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;

  late String token;
  Map<String, String> ?_mainHeaders;
  Map<String, String> ?_mainHeadersMedia;

   ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.TOKEN)??"";
    if(kDebugMode) {
      debugPrint('Token: $token');
    }
//    AddressModel _addressModel;
    try {
      // _addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.USER_ADDRESS)));
      // print( _addressModel.toJson());
    }catch(e) {}
    // updateHeader(
    //   token, _addressModel == null ? null : _addressModel.zoneIds,
    //   sharedPreferences.getString(AppConstants.LANGUAGE_CODE), _addressModel == null ? null : _addressModel.latitude,
    //     _addressModel == null ? null : _addressModel.longitude
    // );
     updateHeader(token);
     updateHeaderMedia(token);

  }

  // void updateHeader(String token, List<int> zoneIDs, String languageCode, String latitude, String longitude) {
  //   _mainHeaders = {
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     AppConstants.ZONE_ID: zoneIDs != null ? jsonEncode(zoneIDs) : null,
  //     AppConstants.LOCALIZATION_KEY: languageCode ?? AppConstants.languages[0].languageCode,
  //     AppConstants.LATITUDE: latitude != null ? jsonEncode(latitude) : null,
  //     AppConstants.LONGITUDE: longitude != null ? jsonEncode(longitude) : null,
  //     'Authorization': 'Bearer $token'
  //   };
  // }

  Future<Response> getData(String uri, {Map<String, dynamic> ?query, Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, {dynamic body, Map<String, String> ?headers,String ?appUrl}) async {
    try {
      if(kDebugMode) {
        debugPrint('====> API Call: ${appUrl??appBaseUrl}$uri\nHeader: ${headers ?? _mainHeaders}');
        debugPrint('====> API Body: $body');
      }
      Http.Response _response = await Http.post(
        Uri.parse(appUrl??appBaseUrl+uri),
        body: body,
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }


  Future<dio.Response> postDataWebService({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) async {
    try {
      dio.Response response = await dio.Dio().post(
        url,
        options: dio.Options(headers: headers),
        data: body,
      );

      return response;
    } on dio.DioException catch (error) {
      if (error.response != null) {
        return error.response!;
      } else {
        throw error;
      }
    }
  }
  void updateHeader(String token) {
    _mainHeaders = {

    'Content-Type':'application/json',

      'Authorization': 'Bearer $token'
    };
  }
  void updateHeaderMedia(String token) {
    _mainHeadersMedia = {

    'Content-Type':'application/json',

      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
  }


  // Future<Response> postMultipartData(String uri, dynamic body, List<MultipartBody> multipartBody, {Map<String, String>? headers}) async {
  //   try {
  //     if(kDebugMode) {
  //       debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
  //       debugPrint('====> API Body: $body with ${multipartBody.length} files');
  //     }
  //     Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
  //   //  _request.headers.addAll({'Content-Type': 'multipart/form-data'});
  //
  //     _request.headers.addAll(headers ?? _mainHeaders!);
  //     print(_request.headers);
  //     // for(MultipartBody multipart in multipartBody) {
  //     //   if(multipart.file != null) {
  //     //     Uint8List _list = await multipart.file.bytes!;
  //     //     _request.files.add(Http.MultipartFile(
  //     //       multipart.key, multipart.file.readStream!, _list.length,
  //     //       filename: multipart.file.name,
  //     //     ));
  //     //   }
  //     // }
  //     for (var multipartBody in multipartBody) {
  //       _request.files.add(multipartBody.file);
  //     }
  //     // for (MultipartBody multipart in multipartBody) {
  //     //   if (multipart.file != null) {
  //     //     Uint8List bytes = await multipart.file.bytes!;
  //     //     _request.files.add(Http.MultipartFile.fromBytes(
  //     //       multipart.key,
  //     //       bytes,
  //     //       filename: multipart.file.name,
  //     //     ));
  //     //   }
  //     // }
  //     print("fawaz");
  //
  //     _request.fields.addEntries(body);
  //
  //     print( _request.fields.length);
  //     print(_request);
  //
  //     Http.Response _response = await Http.Response.fromStream(await _request.send());
  //     return handleResponse(_response, uri);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  // Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String> ?headers}) async {
  //   try {
  //     if(kDebugMode) {
  //       debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
  //       debugPrint('====> API Body: $body with ${multipartBody.length} files');
  //     }
  //     Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
  //     _request.headers.addAll(headers ?? _mainHeaders!);
  //     for(MultipartBody multipart in multipartBody) {
  //       if(multipart.file != null) {
  //         Uint8List _list = await multipart.file.bytes!;
  //         _request.files.add(Http.MultipartFile(
  //           multipart.key, multipart.file.readStream!, _list.length,
  //           filename:  multipart.file.name,
  //         ));
  //       }
  //     }
  //     _request.fields.addAll(body);
  //     Http.Response _response = await Http.Response.fromStream(await _request.send());
  //     return handleResponse(_response, uri);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body');
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }


  // Future<Response> postMultipartData1(String uri, dynamic body, List<MultipartBody> multipartBody, {Map<String, String> ?headers}) async {
  //   try {
  //     if(kDebugMode) {
  //       debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
  //       debugPrint('====> API Body: $body with ${multipartBody.length} files');
  //     }
  //     Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
  //     _request.headers.addAll(headers ?? _mainHeaders!);
  //     for(MultipartBody multipart in multipartBody) {
  //       if(multipart.file  != null) {
  //
  //         _request.files.add(await
  //             Http.MultipartFile.fromPath(
  //           multipart.key, multipart.file.path!)
  //         );
  //       }
  //     }
  //     _request.fields.addAll(body);
  //     Http.Response _response = await Http.Response.fromStream(await _request.send());
  //     return handleResponse(_response, uri);
  //   } catch (e) {
  //     return Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }


  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse _errorResponse = ErrorResponse.fromJson(_response.body);
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _errorResponse.errors![0].message);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if(kDebugMode) {
      debugPrint('====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    }
    return _response;
  }
}

// class MultipartBody {
//   String key;
//   PlatformFile file;
//
//   MultipartBody(this.key, this.file);
// }