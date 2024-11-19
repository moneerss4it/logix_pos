


import 'package:app/data/model/master_model.dart';
import 'package:app/funaction.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/view/screen/saleslist/sales_list_screen.dart';
import 'package:app/view/screen/saleslist/widget/custom_text_sale_list.dart';
import 'package:app/view/screen/saleslist/widget/item_list_card_sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helper/theme/color.dart';



class CustomCardSalesList extends StatelessWidget {
  const CustomCardSalesList({
    super.key, required this.master, required this.index,
  });
final Master master;
final int index ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Get.bottomSheet(ItemsListCardSalesWidget(master: master));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
          child: Card(
              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: context.theme.hoverColor, width: .2),

              ),

              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextSaleList(text:   "Invoice ID".tr, value: master.code.toString()),

                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(getFormattedDateYesterdayWithHour(master.date.toString()),style: AppTextStyleTheme.smallTxtBld.copyWith(color:context.theme.hintColor)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 2),
                        child: Divider(height: 0,thickness: .1,),
                      ),

                      //CustomTextSaleList(text: 'الكمية', value: '91'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:16.0,vertical: 2),
                        child: Divider(height: 0,thickness: .1,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextSaleList(text:"Price with VAT".tr, value:( double.parse(master.total.toString())+double.parse(master.vatAmount.toString())).toStringAsFixed(2)),
                          CustomTextSaleList(text: 'VAT'.tr, value:master.vatAmount.toString()),
                        ],
                      ),

                      Card(
                        color:master.isPosting?LightColor.error.withOpacity(.1): LightColor.primary.withOpacity(.1),

                        child:  Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CustomTextSaleList(text: "Payment Type".tr, value: master.paymentTermsId=="1"?'Cash'.tr: master.paymentTermsId=="2"?'Network'.tr:'Forward'.tr),
                        ),)

                    ],)



              )
          )),
    );
  }
}

