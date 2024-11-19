import 'package:app/data/model/master_model.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/view/screen/saleslist/widget/custom_text_sale_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ItemsListCardSalesWidget extends StatelessWidget {
  const ItemsListCardSalesWidget({
    super.key,
    required this.master,
  });

  final Master master;

  @override
  Widget build(BuildContext context) {
    return Container(

      width: Get.width,

      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  Text('Items'.tr, style: AppTextStyleTheme.appParTxtBld),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                        backgroundColor: Get.theme.highlightColor,
                        radius: 12,
                        child: Icon(Icons.clear, size: 20, color: Get.theme.cardColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ... master.products.map((e) =>  Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: context.theme.hoverColor, width: .2),

                          ),

                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: CustomTextSaleList(text: "Item Name".tr, value: e.name2)),
                                  Flexible(child: CustomTextSaleList(text: 'Quantity'.tr, value: e.quantity.toString())),
                                ],
                              ), Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: CustomTextSaleList(text: 'Price'.tr, value: e.price.toString())),
                                  Flexible(child: CustomTextSaleList(text: 'VAT'.tr, value: e.vatAmount.toStringAsFixed(2))),
                                ],
                              ),
                            ],
                          )),
                    )).toList(),
                  ],
                ),
              ),
            )

          ] ) ,
    );
  }
}