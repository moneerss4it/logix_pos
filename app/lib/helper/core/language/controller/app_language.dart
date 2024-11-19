
import 'package:app/helper/utill/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/local_storage/local_storgae.dart';

class AppLanguageController extends GetxController  implements GetxService {
  var appLocale=''.obs ;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    LocalStorage localStorage = LocalStorage();
    appLocale.value = await localStorage.languageSelected ;



    Get.updateLocale(Locale(appLocale.value));

  }


  String valueRadio='';
  String nameRadio='';

onClickRadio(String value,String name) {

  valueRadio = value;
  nameRadio = name;


  update();

}
  void changeLanguage(String type) async {
    LocalStorage localStorage = LocalStorage();
    GetStorage().write(AppConstants.changeLang, type );
    if (appLocale.value == type) {
      return;
    }else{


      appLocale.value = type;

      localStorage.saveLanguageToDisk(type);
    }


   // update();
  }

}

