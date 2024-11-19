import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/theme/text_theme.dart';

class TotalCartWidget extends StatelessWidget {
  const TotalCartWidget({
    super.key, required this.total,
  });
final double total;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.theme.primaryColor.withOpacity(.1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(

          children: [
            Text("Total Amount".tr+" : ",style: AppTextStyleTheme.appParTxtBld,),
           const  SizedBox(width: 10,),

            Text(total.toStringAsFixed(2),style: AppTextStyleTheme.appParTxtBld,),

          ],
        ),
      ),

    );
  }
}