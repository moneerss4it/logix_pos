import 'package:app/data/api/api_checker.dart';
import 'package:app/data/model/generate_token_model.dart';
import 'package:app/data/model/get_logo_model.dart';
import 'package:app/data/model/login_model.dart';
import 'package:app/data/repository/auth_repo.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}) {

  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  bool isGetMember() {
    return authRepo.isGetMember();
  }
  bool isIntro() {
    return authRepo.isIntroScreen();
  }
  String getErpUrl() {
    return authRepo.erpUrl();

  }

  int getUserId() {
    return authRepo.getUserId();
  }
  logOut(){
    authRepo.logOut();
  }

  Future<GetLogoModel> getLogo() async {
    return await authRepo.getLogo();
  }
  SaveIntroScreen(){
    authRepo.SaveIntroScreen();
  }
  logOutMember(){
    authRepo.logOutMember();
  }

  bool get isLoading => _isLoading;
  bool _isLoading = false;
  Future<LoginModel> login(String user, String password) async {
    _isLoading = true;
    update();
    print(authRepo.GetMember());
    Response response = await authRepo.login(memberId: authRepo.GetMember(),user: user, password: password);
    LoginModel responseModel;
    if (response.statusCode == 200) {


        if(response.body['success']==true){
          authRepo.saveUserToken(response.body['data']['token'],response.body['data']['erpUrl'],response.body['data']['userId']);
          responseModel = LoginModel(true,token: response.body['data']['token'], erpUrl: response.body['data']['erpUrl'],message: "");

        }else{

          responseModel = LoginModel(false,token:"", erpUrl: "",message:"");
          showCustomSnackBar(response.body['message']);
        }
       //  await authRepo.updateToken();

         } else {
      print(response.body);

      responseModel = LoginModel(false,token:"", erpUrl: "",message:"");
      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  GenerateTokenModel _generateTokenModel = GenerateTokenModel();
  GenerateTokenModel get generateTokenModel => _generateTokenModel;

  Future<void> getGenerateToken() async {


    Response response = await  authRepo.getToken();
    print(response.statusCode);
    if(response.statusCode==200){
      print(response.body);


      _generateTokenModel=    GenerateTokenModel.fromJson(response.body);
      print("test  token ${_generateTokenModel.token}");
      print("test  useR_ID ${_generateTokenModel.userId}");
    }else{

      ApiChecker.checkApi(response);
    }


  }

  Future<int> Member(String memberId) async {
    _isLoading = true;
    update();
    Response response = await authRepo.getMember(memberId: memberId,);

    if (response.statusCode == 200) {

      authRepo.saveMember(memberId);
      // print(response.body['member']['member_ID']);
      //  await authRepo.updateToken();
      GetLogoModel getLogoModel=GetLogoModel.fromJson(response.body);
      authRepo.saveGetLogoModel(getLogoModel);

    } else {
      print(response.body);
      ApiChecker.checkApi(response);

    }
    _isLoading = false;
    update();
    return response.statusCode!;
  }















}