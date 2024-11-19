
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../helper/theme/color.dart';
import '../../helper/theme/text_theme.dart';


class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
        this.textEditingController,
        this.labelText = "",
        this.exText = "",
        this.maxLgh,
        this.maxLin = 1,
        this.minLin = 1,
        this.obscureTxt = false,
        this.onChangeText,
        this.icon1,
        this.icon2,
        this.isRequired = false,
        this.withMaxLgh = false,
        this.textInputAction = TextInputAction.next,
        this.keyboardType = TextInputType.text,
        this.validatorError,

        this.filled = true,
        this.isEnabled = true,this.paddingHorizontal=5, this.paddingVertical=8,this.withBolder=true, this.stringLgh, this.wedgetIcon1, this.text, this.styleText, this.fillColor, this.focusNode,  this.showBorder=false, this.inetValue, this.inputFormatters})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final String exText;
  final int maxLin;
  final int minLin;
  final FocusNode? focusNode;
  final double paddingHorizontal;
  final bool showBorder;
  final String? inetValue;
  final String? text;
  final int? maxLgh;
  final TextStyle? styleText;
  final int? stringLgh;
  final double paddingVertical;
  final bool obscureTxt, isRequired, isEnabled,withMaxLgh, filled,withBolder;
  final IconData? icon1;
  final Widget? icon2;
  final Color? fillColor;
  final String? wedgetIcon1;
  final ValueChanged<String>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:paddingVertical,horizontal: paddingHorizontal),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text==null?SizedBox(): Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:2.0),
                child: Text(text.toString(),style: styleText??AppTextStyleTheme.madelTextView.copyWith(color: context.theme.hoverColor),),
              ),
              SizedBox(height: 5,)
            ],
          ),
          TextFormField(
            inputFormatters: inputFormatters,
            textAlign: wedgetIcon1!=null? TextAlign.start:TextAlign.start,
            focusNode: focusNode,
            cursorColor:context.theme.primaryColor ,
            initialValue: inetValue,
            decoration: InputDecoration(
              labelStyle:AppTextStyleTheme.smallTxtNor.copyWith(color: Get.theme.hintColor.withOpacity(.3)) ,
              hintStyle:AppTextStyleTheme.smallTxtNor.copyWith(color: Get.theme.hintColor.withOpacity(.3)) ,
              fillColor: Get.theme.cardColor.withOpacity(.4) ,
              filled: filled,
              isCollapsed: false,
              // labelText:withBolder?labelText.tr:null ,
              hintText:withBolder?exText.isNotEmpty?"${""}\t$exText":"":labelText.tr,
              suffixText: '   ',
              prefixIconColor:Get.theme.primaryColor ,
              suffixIconColor: Get.theme.indicatorColor,
              prefixIcon: wedgetIcon1!=null?Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(

                  wedgetIcon1.toString(),


                ),
              ): icon1 != null
                  ? Icon(icon1,
                color:context.theme.iconTheme.color ,
              ) : null,
              suffixIcon: icon2,
              focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.theme.colorScheme.error, width: 0.5),
              ) ,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width:1.5,color:showBorder? Get.theme.hintColor.withOpacity(.1):Colors.transparent),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide( color:showBorder? Get.theme.hintColor.withOpacity(.1):Colors.transparent, width: 1),
              ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide( color:showBorder? Get.theme.hintColor.withOpacity(.1):Colors.transparent, width: 1),
              ) ,
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide( color:LightColor.error, width: 1),
              ) ,

              disabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color:showBorder? Get.theme.hintColor.withOpacity(.1):Colors.transparent, width: 1),
              ) ,

              // disabledBorder:OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(0),
              //   borderSide: BorderSide(color: Colors.transparent, width: 1),
              // ) ,
            ),
            onChanged: onChangeText,
            style: AppTextStyleTheme.smallTxtNor.copyWith(color: Get.theme.dividerColor,),
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            obscureText: obscureTxt,
            enabled: isEnabled,
            controller: textEditingController,
            maxLines: maxLin,
            minLines: minLin,
            maxLength:maxLgh,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator:(x) {
              if(isRequired&& x!.trim().isEmpty) {
                return '${labelText.tr} ${"مطلوب"}';
              } else if(withMaxLgh&& x!.length>stringLgh!) {
                return "لقد تجاوزت القبمةالمدخلة اكثر من 50 حرفا";
              }else if( validatorError != null){
                return validatorError!(x);
              }
            },
          ),
        ],
      ),
    );
  }
}
