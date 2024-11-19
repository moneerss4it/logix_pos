
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helper/theme/text_theme.dart';


class CustomSubmitDialog extends StatelessWidget {
   CustomSubmitDialog({

    Key ?key, required this.onPress, this.text
  }) : super(key: key);

 final Function() onPress;
 final String ?text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

        //alignment: Alignment.center,
        height: 250,
        width: .7.sw,

        decoration: BoxDecoration(
          color: Get.theme.cardColor,
            borderRadius: BorderRadius.circular(10.r),

            border: Border.all(color: Get.theme.primaryColor,width: .3)

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(

                  alignment: Alignment.center,
                  width: .7.sw,
                  child: Text(text.toString(),textAlign: TextAlign.center,style: AppTextStyleTheme.supLargeTxtBld,)),
            ),
            Divider(color: context.theme.primaryColor,thickness: .3,),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(


                      child: TextButton(
                        style: TextButton.styleFrom( minimumSize:Size(double.infinity,  40),
                          shape: RoundedRectangleBorder(borderRadius:
                          BorderRadius.circular(10.r,),side: BorderSide(color: Get.theme.primaryColor,width: .3))
                          ,),
                       onPressed: (){
                        Get.back();
                      }, child: Text('Cancel'.tr,style:AppTextStyleTheme.madelTextView),),
                    ),
                    SizedBox(

                      child: TextButton(

                          style: TextButton.styleFrom(backgroundColor: Get.theme.primaryColor, minimumSize:Size(double.infinity,  40),
                            shape: RoundedRectangleBorder(borderRadius:
                            BorderRadius.circular(10.r,),)
                            ,),
                          onPressed: onPress, child: Text('Confirm'.tr,style:AppTextStyleTheme.madelTextView!.copyWith(color: Get.theme.cardColor)),),
                    ),
                  ],),
              ),
            )
          ],
        ),
      ),

    );
  }
}