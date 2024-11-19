
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingController extends GetxController  implements GetxService {
  //TODO: Implement HomeController
 // bool connected = false;
  RxBool connected = false.obs;
  late TextEditingController
  DEFAULTSNNOController,
  PrintController;

  static SettingController instance = SettingController._();
  String?  USING_TAX_SALES,PRINT_INV='1';
  SettingController._();
  int? QIID;

  factory SettingController() {
    return instance;
  }

  RxnString errorText = RxnString(null);
  late final userDataBox;
  @override
  void onInit() async {
    PrintController = TextEditingController();
    DEFAULTSNNOController = TextEditingController();
    PrintController.text=Printer;
    //getImage();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    PrintController.dispose();
    DEFAULTSNNOController.dispose();
   super.dispose();
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    userDataBox = await Hive.openBox('userData');
  }





  // getAll() {
  //   GetSysCom().then((data) {
  //     Sys_Com_List = data;
  //   });
  // }

  String? validateDefault_SNNO(String value) {
    errorText.value = null;
    try {
      if (value.trim().isEmpty) {
        errorText.value = 'StringDefault_SNNO_ISNULL'.tr;
        return 'StringDefault_SNNO_ISNULL'.tr;
        // }else if (value.contains('..')) {
        //   errorText.value = StringDefault_SNNO_NUM;
        //   return StringDefault_SNNO_NUM;
      } else if (double.parse(value.trim()) < 0) {
        errorText.value = 'StringDefault_SNNO_NUM'.tr;
        return 'StringDefault_SNNO_NUM'.tr;
      } else {
        SET_D_P('Default_SNNO',double.parse(DEFAULTSNNOController.text));
        errorText.value = null;
        return null;
      }
    }catch (e) {
      errorText.value = 'StringErrorDefault_SNNO_NUM'.tr;
      print("error1${e.toString()}");
    }
    return null;
  }


  void setPrint_Balance(bool Print_Balance) async {
    return userDataBox.put('Print_Balance', Print_Balance);
  }

  void SET_P(String GETTYPE,String GET_V) async {
    return userDataBox.put(GETTYPE, GET_V);
  }

  void SET_B_P(String GETTYPE,bool GET_V) async {
    return userDataBox.put(GETTYPE, GET_V);
  }

  void SET_N_P(String GETTYPE,int GET_V) async {
    return userDataBox.put(GETTYPE, GET_V);
  }

  void SET_D_P(String GETTYPE,double GET_V) async {
    return userDataBox.put(GETTYPE, GET_V);
  }

  bool get isSwitchCollectionOfItems => userDataBox.get('isSwitchCollectionOfItems',defaultValue: true);
  bool get isSwitchShowMesMat => userDataBox.get('isSwitchShowMesMat',defaultValue: false);
  bool get isShow_Mat_No_SNNO => userDataBox.get('isShow_Mat_No_SNNO',defaultValue: true);
  bool get isSave_Automatic => userDataBox.get('isSave_Automatic',defaultValue: false);
  bool get isShow_SNNO_OR_DEF => userDataBox.get('isShow_SNNO_OR_DEF',defaultValue: true);
  double get Default_SNNO => userDataBox.get('Default_SNNO',defaultValue: 1.0);
  int get Type_Serach => userDataBox.get('Type_Serach',defaultValue: 0);
  String get Type_Inventory => userDataBox.get('Type_Inventory',defaultValue: '2');
  String get Type_Inventory_Name => userDataBox.get('Type_Inventory_Name',defaultValue: 'StringInventory_Insert'.tr);
  bool get isActivateInteractionScreens => userDataBox.get('isActivateInteractionScreens',defaultValue: true);
  // bool get isPrint => userDataBox.get('isPrint',defaultValue: STMID=='EORD'?false:true);
  String get Printer_Name => userDataBox.get('Printer_Name',defaultValue: '');
  String get Printer => userDataBox.get('Printer',defaultValue: '');
  bool get UPIN_USING_TAX_SALES => userDataBox.get('UPIN_USING_TAX_SALES',defaultValue: true);
  bool get Save_Sync_Invo => userDataBox.get('Save_Sync_Invo',defaultValue: true);
  String get Size_Font => userDataBox.get('Size_Font',defaultValue: 'M');
  String get Size_Font_Name => userDataBox.get('Size_Font_Name',defaultValue: 'متوسط');
  String get Thermal_printer_paper_size => userDataBox.get('Thermal_printer_paper_size',defaultValue: '58');
  String get Thermal_printer_paper_size_Name => userDataBox.get('Thermal_printer_paper_size_Name',defaultValue: '58 mm حراري');
  String get Image => userDataBox.get('Image');
  String get TYPE_SHOW_DATA => userDataBox.get('TYPE_SHOW_DATA',defaultValue: '1');
  bool get isSwitchUse_Gro => userDataBox.get('isSwitchUse_Gro',defaultValue: false);
  bool get isSwitchSend_SMS => userDataBox.get('isSwitchSend_SMS',defaultValue: false);
  bool get isSwitchSend_PDF => userDataBox.get('isSwitchSend_PDF',defaultValue: false);
  bool get Show_MINO => userDataBox.get('Show_MINO',defaultValue: false);
  bool get Show_BMDID => userDataBox.get('Show_BMDID',defaultValue: false);
  bool get Print_Balance => userDataBox.get('Print_Balance',defaultValue: false);
  bool get Type_Print => userDataBox.get('Type_Print',defaultValue: false);
  bool get Print_Image => userDataBox.get('Print_Image',defaultValue: true);
  int get Type_Model => userDataBox.get('Type_Model',defaultValue: 1);
  String get Type_Model_Name => userDataBox.get('Type_Model_Name',defaultValue: 'النموذج الاول');
  bool get Show_Inv_Pay => userDataBox.get('Show_Inv_Pay',defaultValue: true);
  bool get isShow_Notification => userDataBox.get('isShow_Notification',defaultValue: true);
  bool get Print_Balance_Pay => userDataBox.get('Print_Balance_Pay',defaultValue: false);
  bool get Install_BDID => userDataBox.get('Install_BDID',defaultValue: false);
  int get Standard_Form => userDataBox.get('Standard_Form',defaultValue: 1);
  bool get SHOW_TAB => userDataBox.get('SHOW_TAB',defaultValue: false);
  String get Standard_Form_Name => userDataBox.get('Standard_Form_Name',defaultValue: 'النموذج الاول');
  bool get PRINT_AD => userDataBox.get('PRINT_AD',defaultValue: false);


  Future<int> logout() async {
    return await userDataBox.clear();
  }
}
