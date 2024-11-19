
import 'package:app/controller/auth_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/home_screen/home_screen.dart';
import 'package:app/view/screen/pos/pos_screen.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:app/view/widget/password_input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _formKey = GlobalKey<FormState>();
  final FocusNode _userFocus = FocusNode();
  final FocusNode _memberIdFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _memberIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String result = '';
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:        GetBuilder<AuthController>(

            builder: (controller) =>Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                
                    SizedBox(
                        height: 150,
                
                        child: Image.asset(ImageHelper.logoPng,)),
                
                    CustomTextInput(text:  'Sign in'.tr,showBorder: true,exText: 'Sign in'.tr ,textEditingController: _userController,isRequired: true,),
                    PasswordInputText(exText:  'Password'.tr ,textEditingController: _passwordController,),
                    SizedBox(height: 30,),
                
                       SizedBox(height: 30,),
                   !controller.isLoading ?CustomButton(text: 'Sign in'.tr,onPress: (){
                      if (_formKey.currentState!.validate()) {
                        controller.login(_userController.text, _passwordController.text).then((value) {
                
                          if(value.isSuccess){
                            Get.to(PosScreen());
                          }else{
                            showCustomSnackBar(value.message);
                          }
                        });
                      }
                
                    }): Center(child: CircularProgressIndicator(color:LightColor.dividerColor,)),
                
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
