
class AppConstants {
 // static const String APP_NAME = '';
  static const String APP_VERSION = '1.0';

 static const String BASE_URL = 'https://testapi.ss4it.com.sa/api/';
   //static const String BASE_URL = 'http://localhost:5034/api/';

  static const String LOGIN_URI = 'users/authenticate';
  static const String GET_MEMBER_URL = 'users/GetCompany';
  static const String GET_ITEM_URL = 'WhItems/getAllItembyInventory';
  static const String GET_CUSTOMER_URL = 'SysCustomer/GetAllCustomer';
  static const String GENERATE_TOKEN_URL = 'SalTransaction/Generate_Token';
  static const String GET_LAST_INVENTORY = 'SalTransaction/getLastInv';
  static const String GET_SALES_POINT_URL = 'SalPosSetting/GetAllSalesPoints';
  static const String INSERT_SAL_POS_CLOSE_CASH = 'SalPosSetting/insertsalPosCloseCash';
  static const String CREATE_TRANSACTION_URL = '/WebService/LogixSalseApp.asmx/CreateTransaction';


//http://localhost:44367/swagger/index.html
//-----------------------------------------------------|||-------------------------------------------------------
//-----------------------------------------------------|||------------------------------------------------------
//-----------------------------------------------------|||------------------------------------------------------


  // sharePreference
  static const String TOKEN = 'token';
  static const String MEMBER_ID = 'memberid';
  static const String GETLOGO = 'getLogo';
  static const String INTRO = 'intro';
  static const String ERP_URL = 'erpUrl';
  static const String USER_ID = 'userID';
  static const String INV_ID = 'invId';
  static const String DATA_SALES_POINTS = 'dataSalesPoints';
  static const String  MASTER = 'master';

  static const String ITEM_BY_INVENTORY = 'item_by_inventory';
  static const String DATA_CUSTOMER = 'Datacustomer';
  static const String changeLang = "lang";
  static const String ar = "ar";
  static const String en = "en";
  static const String  ur = "ur";
}
