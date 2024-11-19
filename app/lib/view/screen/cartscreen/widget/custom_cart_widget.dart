import 'dart:io';

import 'package:app/controller/cart_controller.dart';
import 'package:app/data/model/cart_model.dart';
import 'package:app/view/screen/home_screen/widget/custom_dialog_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../helper/theme/text_theme.dart';
import '../../../../helper/utill/image_helper.dart';
import '../../../widget/input_text.dart';



class CustomCartWidget extends StatelessWidget {
   CustomCartWidget({
    super.key, required this.item, required this.index,
  });
final CartItem item;
final int index;
  late TextEditingController _quantityController ;
   @override
  Widget build(BuildContext context) {
      _quantityController = TextEditingController(text: item.quantity.toString());

     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: context.theme.hoverColor, width: .1),


        ),
        elevation: 0,

        child:    GetBuilder<CartController>(
          builder: (con) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [

                    Row(
                      children: [
                        Expanded(child: Text(item.name,style: AppTextStyleTheme.appParTxtBld,)),

                   Row(
                              children: [
                                // InkWell(
                                //     onTap:   () {
                                //
                                //
                                //     }
                                //     ,
                                //     child: SvgPicture.asset(ImageHelper.messageEdit)),
                                SizedBox(width: 10,),
                                InkWell(
                                    onTap: () {

                                      con.removeItem(item);
                                    },
                                    child: SvgPicture.asset(ImageHelper.delete)),

                              ]),



                      ],),

                    Row(
                      children: [
                        Expanded(child: CustomTextInput(text: "Price".tr,inetValue: (item.price).toStringAsFixed(2) ,isEnabled: false,showBorder: true,onChangeText: (value){
                           //  item.price=double.parse(value);
                       // con.updateItem(item);
                    }),),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:  CrossAxisAlignment.start,
                            
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:2.0),
                                child: Text("Quantity".tr,style: AppTextStyleTheme.madelTextView.copyWith(color: context.theme.hoverColor),),
                              ),
                              SizedBox(height: 5,),
                              Card(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: context.theme.hoverColor, width: .1),
                                ),
                                child: Row(
                                
                                
                                
                                
                                
                                  mainAxisAlignment: MainAxisAlignment.center,
                                
                                  children: [
                                
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed:  (){
                                
                                      //  item.quantity = item.quantity > 1 ? item.quantity - 1 : 1;


                                        con.updateItem(item,item.quantity > 1 ? item.quantity - 1 : 1 );

                                      }, icon: Icon(FontAwesomeIcons.circleMinus,color: context.theme.primaryColor,),),
                                    Text(
                                
                                      item.quantity.toStringAsFixed(2),
                                      style: AppTextStyleTheme.appParTxtBld,textAlign: TextAlign.center,
                                
                                
                                    ),
                                    IconButton(
                                
                                      padding: EdgeInsets.zero,
                                      onPressed:  (){
                                          //item.quantity += 1;
                                          print(item.price);
                                
                                
                                         con.updateItem(item, item.quantity+1 );
                                
                                
                                      }, icon: Icon(FontAwesomeIcons.circlePlus,color: context.theme.primaryColor,),),
                                  ],),
                              ),
                            ],
                          ),
                        ),
                        // Expanded(child: CustomTextInput(textEditingController: _quantityController,text: "الكمية" ,isEnabled: true,showBorder: true,
                        //   keyboardType: Platform.isIOS? TextInputType.numberWithOptions(decimal: true,signed: true):TextInputType.number,
                        //   inputFormatters: [
                        //     FilteringTextInputFormatter.digitsOnly,
                        //   ],
                        //
                        //
                        //   onChangeText: (va){
                        //     if (va.isEmpty) {
                        //       _quantityController.text = '1'; // Automatically set to '0' when empty
                        //     }
                        //
                        //   item.quantity = int.parse( _quantityController.text);
                        //
                        //
                        //   con.updateItem(item);
                        // },)),

                      ],),


                  ],
                )             );
          }
        ),
      ),
    );
  }
}