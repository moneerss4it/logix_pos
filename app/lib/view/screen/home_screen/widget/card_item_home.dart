

import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../data/model/item_by_inventory_model.dart';
import '../../../../helper/theme/color.dart';
import '../../../../helper/theme/text_theme.dart';
import 'custom_dialog_item_widget.dart';


class CardAddItemWidgetHome extends StatelessWidget {
  const CardAddItemWidgetHome({super.key, required this.dataItem});
final DataItem dataItem;
  @override
  Widget build(BuildContext context) {
    final bool languageCode = Get.locale!.languageCode == 'ar';
    return Container(
      decoration: BoxDecoration(
        color: context.theme.primaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
        languageCode? dataItem.itemName.toString() :   dataItem.itemName2.toString(),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppTextStyleTheme.largeTxtNor,
            ),
            const Spacer(),
            Text(
              dataItem.priceSale.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyleTheme.largeTxtNor,
            ),
            
           const Spacer(),
            InkWell(
              onTap: () {
                Get.dialog(CustomDialogItem(dataItem: dataItem,));

              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: context.theme.primaryColor,
                ),
                child: Text(
                  "Add".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: LightColor.cardColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
