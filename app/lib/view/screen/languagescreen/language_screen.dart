

import 'package:app/helper/core/language/controller/app_language.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/theme/text_theme.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: CusAppBar(context, "Language".tr,show: true ),

      body: GetBuilder<AppLanguageController>(
        init: AppLanguageController(),
        builder: (con) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
            RadioListTile(

              activeColor: LightColor.primary,
            title: Text('العريية'.tr,style: AppTextStyleTheme.appParTxtBld,),
            value: "ar",
            groupValue: con.appLocale.value,
            onChanged: (value) {
              con.changeLanguage(AppConstants.ar);
              Get.updateLocale(const Locale(AppConstants.ar));
              print("con.ar.value");

            },
          ),     RadioListTile(
                  activeColor: LightColor.primary,
            title: Text('English',style: AppTextStyleTheme.appParTxtBld,),
            value: "en",
            groupValue: con.appLocale.value,
            onChanged: (value) {
              con.changeLanguage(AppConstants.en);
              Get.updateLocale(const Locale(AppConstants.en));
              print("con.appLocale.value");

            },
          ),     RadioListTile(
                  activeColor: LightColor.primary,
            title: Text('Urdu'.tr,style: AppTextStyleTheme.appParTxtBld,),
            value: con.appLocale.value,
            groupValue: "ur",
            onChanged: (value) {
              con.changeLanguage(AppConstants.ur);
              Get.updateLocale(const Locale(AppConstants.ur));
              print(  con.appLocale.value);

            },
          ),
           SizedBox(height: 30,),

                CustomButton(text: "تغير",)
              ],
            ),
          );
        }
      ),

    );
  }
}
