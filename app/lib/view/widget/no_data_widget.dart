


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helper/theme/text_theme.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key, this.img, this.text,
  });
  final String ?img;
  final String ?text;

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img??"icons/no_data.png",width: .5.sw,height:  .5.sw),
      SizedBox(height: 10,),
      Text(text??  "No Data !".tr,style: AppTextStyleTheme.supLargeTxtBld.copyWith(color: Get.theme.hoverColor),)
      ],
    ),);
  }
}