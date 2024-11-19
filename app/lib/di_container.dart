

import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/customer_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/data/repository/cart_repo.dart';
import 'package:app/data/repository/customer_repo.dart';
import 'package:app/data/repository/item_repo.dart';

import 'package:get/get.dart';

import 'package:app/data/api/api_client.dart';
import 'package:app/data/repository/auth_repo.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'controller/Posting_invoices_controller.dart';
import 'controller/setting_controller.dart';
import 'data/repository/posting_invoices_repo.dart';
import 'helper/core/language/controller/app_language.dart';


// final sl = GetIt.instance;

Future<void> init() async {
  // Core

  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
 // sl.registerLazySingleton(() => NetworkInfo(sl()));
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  // Repository
    Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    Get.lazyPut(() => ItemRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    Get.lazyPut(() => CartRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    Get.lazyPut(() => CustomerRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
    Get.lazyPut(() => PostingInvoicesRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

 // controller

  Get.lazyPut(() => AppLanguageController());
  Get.lazyPut(() => SettingController());
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ItemController(repo: Get.find()));
  Get.lazyPut(() => CartController(repo: Get.find()));
  Get.lazyPut(() => CustomerController(repo: Get.find()));
  Get.lazyPut(() => PostingInvoicesController(repo: Get.find()));


  // External


}
