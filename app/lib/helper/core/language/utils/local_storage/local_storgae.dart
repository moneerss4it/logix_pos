import 'package:get_storage/get_storage.dart';

import '../../../../utill/app_constants.dart';


class LocalStorage {

  /// Write
  void saveLanguageToDisk (String langusage)async{
    await GetStorage().write(AppConstants.changeLang, langusage);
  }

  /// Read
  Future<String> get languageSelected async{
    return await GetStorage().read(AppConstants.changeLang)??'ar';
  }
}