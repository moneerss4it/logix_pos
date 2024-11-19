



import 'package:app/data/api/api_checker.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/data/repository/posting_invoices_repo.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../view/widget/custom_snackbar.dart';
class PostingInvoicesController extends GetxController implements GetxService {

  final PostingInvoicesRepo repo;
  PostingInvoicesController({required this.repo}) ;


  bool get isLoading => _isLoading;
  bool _isLoading = false;


  Future<void> postSaleTransaction( Map<String,dynamic> body  ) async {

    _isLoading = true;
    update();

    Response response = await  repo.postSaleTransaction(body);
    print(response.statusCode);
    if(response.statusCode==200){
      print(response.body);



    }else{

      ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }

  Future<void> createTransactionWebDio( Map<String,dynamic> body ,Map<String, String>  headers,Function callback ) async {

    _isLoading = true;
    update();
    print(body);

    dio.Response response = await  repo.postDataWebService(body,headers);
    print(response.statusCode);
    if(response.statusCode==200){
      print(response.data);
callback()  ;


    }else{
      print(response.data);
      showCustomSnackBar(response.data.toString());
     // ApiChecker.checkApi(response);
    }

    _isLoading = false;
    update();
  }




}