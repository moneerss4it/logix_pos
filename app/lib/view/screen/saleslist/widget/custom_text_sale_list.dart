
import 'package:app/helper/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextSaleList extends StatelessWidget {
  const CustomTextSaleList({
    super.key, required this.text, required this.value,
  });
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 4),
      child: Row(

          children: [
            Text(text+" : ",style: AppTextStyleTheme.smallTxtBld.copyWith(color:context.theme.hintColor),),
            SizedBox(width: 2,),
            Text(value,style: AppTextStyleTheme.smallTxtBld,),



          ]

      ),
    );
  }
}