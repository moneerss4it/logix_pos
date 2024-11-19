
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../../helper/theme/color.dart';
import '../../helper/theme/text_theme.dart';
class CustomDatePickerInput extends StatelessWidget {
  const CustomDatePickerInput(
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
        this.inetValue,
        this.filled = true,
        this.isEnabled = true,this.paddingHorizontal=5, this.paddingVertical=8,this.withBolder=true, this.stringLgh, this.wedgetIcon1, this.text, this.styleText, this.fillColor, this.focusNode})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String labelText;
  final String exText;
  final int maxLin;
  final int minLin;
  final FocusNode? focusNode;
  final double paddingHorizontal;
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
  final ValueChanged<DateTime?>? onChangeText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validatorError;

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
          DateTimeField(

            onShowPicker: (context, currentValue) {


              return showDatePicker(

builder: (context, child) {
  return Theme(
    data: ThemeData.dark().copyWith(
      colorScheme: ColorScheme.dark(
        primary: Get.theme.primaryColor,
        onPrimary:Get.theme.cardColor ,
        surface: Get.theme.cardColor,
        onSurface:Get.theme.primaryColor,



      ),
      dialogBackgroundColor:Get.theme.colorScheme.background,
    ),
    child: child!,
  );
},
                  context: context,
                  firstDate: DateTime(2000),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            }, format:  DateFormat("yyyy/MM/dd"),
            textAlign: wedgetIcon1!=null? TextAlign.center:TextAlign.start,
            focusNode: focusNode,



            cursorColor:context.theme.hoverColor ,

            decoration: InputDecoration(

              labelStyle:AppTextStyleTheme.smallTxtNor.copyWith(color: Get.theme.hintColor.withOpacity(.3)) ,
              hintStyle:AppTextStyleTheme.smallTxtNor.copyWith(color: Get.theme.hintColor.withOpacity(.3)) ,
              fillColor:Get.theme.cardColor.withOpacity(.6) ,
              filled: filled,
              isCollapsed: false,
              // labelText:withBolder?labelText.tr:null ,
              hintText:withBolder?exText.isNotEmpty?"${""}\t$exText":"":labelText.tr,
              suffixText: '   ',
              prefixIconColor:Get.theme.primaryColor ,
              suffixIconColor: Get.theme.indicatorColor,
              prefixIcon: wedgetIcon1!=null?Card(
                margin: EdgeInsets.all(0),elevation: 0,
                color:Get.theme.primaryColor.withOpacity(.2),

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(

                    wedgetIcon1.toString(),
                    color:context.theme.iconTheme.color ,
                    width: 30,
                    height: 30,
                  ),
                ),
              ): icon1 != null
                  ? Icon(icon1,
                color:context.theme.iconTheme.color ,
              ) : null,

              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.calendar,color: Get.theme.hintColor,),
              ),
              focusedErrorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: context.theme.colorScheme.error, width: 0.5),
              ) ,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(width:1.5,color:Get.theme.dividerColor.withOpacity(.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:  BorderSide( color:Get.theme.dividerColor.withOpacity(.2), width: 1),
              ),
              border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:  BorderSide( color:Get.theme.dividerColor.withOpacity(.2), width: 1),
              ) ,
              errorBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:  BorderSide( color:LightColor.error, width: 1),
              ) ,

              disabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Get.theme.dividerColor.withOpacity(.2), width: 1),
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
    if(isRequired&& x==null) {
    return '${labelText.tr} ${"مطلوب"}';
    }else if( validatorError != null){
    return validatorError!(x.toString());
    }},
          ),
        ],
      ),
    );
  }
}
