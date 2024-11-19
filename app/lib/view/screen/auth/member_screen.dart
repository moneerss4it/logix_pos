
import 'package:app/controller/auth_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/auth/login_screen.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class MemberScreen extends StatelessWidget {
   MemberScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _memberIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:   GetBuilder<AuthController>(

            builder: (controller) =>  Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                
                    SizedBox(
                      height: 150,
                
                        child: Image.asset(ImageHelper.logoPng,)),
                
                    CustomTextInput(text: "ID Member".tr,showBorder: true,exText: "ID Member".tr ,textEditingController: _memberIdController,isRequired: true,),
                   const SizedBox(height: 30,),
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16.0),
                    //     child: Row(
                    //       children: [
                    //         Expanded(
                    //           child: Divider(
                    //             color: Get.theme.hintColor,
                    //             thickness: 1,
                    //           ),
                    //         ),
                    //        const Padding(
                    //           padding:  EdgeInsets.symmetric(horizontal: 8.0),
                    //           child: Text("او الدخول باستخدام"),
                    //         ),
                    //         Expanded(
                    //           child: Divider(
                    //             color: Get.theme.hintColor,
                    //             thickness: 1,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // CustomButton(row: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       SvgPicture.asset(ImageHelper.scanBarcode),
                    //      const SizedBox(width: 10,),
                    //       Text("الدخول عبر الباركود",style: AppTextStyleTheme.textButton.copyWith(color: context.theme.dividerColor),)
                    //     ],
                    //
                    // ),

                    //  color: context.theme.cardColor,fontColor: context.theme.dividerColor,borderColor: context.theme.dividerColor,),
                   const SizedBox(height: 30,),
                !controller.isLoading?    CustomButton(text:'Sign in'.tr, onPress: (){
                
                      if (_formKey.currentState!.validate()) {
                        controller.Member(_memberIdController.text.trim()).then((value) {
                
                          if(value==200){
                            Get.offAll( const LoginScreen());
                          }
                
                        });
                      }
                    },): const Center(child: CircularProgressIndicator(color:LightColor.dividerColor,)),
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
