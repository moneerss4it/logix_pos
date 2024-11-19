

import 'dart:io';

import 'package:app/PrintFile/share_mode.dart';
import 'package:app/controller/Posting_invoices_controller.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/inv_print/invoice_posting.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/drawer.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../PrintFile/Invoice/file_helper.dart';
import '../../../funaction.dart';
import '../../widget/button_navigator_bar.dart';



class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final itemController = Get.find<ItemController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemController.loadDataSalesPoints();
    Get.find<CartController>().loadMaster();
 Get.find<AuthController>().getGenerateToken();
  }
TextEditingController recipientController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MainDrawer(),

      appBar: CusAppBar(context, "Total Sales".tr, ),


      body:GetBuilder<CartController>(
          builder: (con) {
            return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                
                  children: [
                    Row(
                      children: [
                        Text("Total Sales By Payment".tr,style: AppTextStyleTheme.appParTxtBld.copyWith(color:context.theme.hoverColor),),
                      ],
                    ),
                 const SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                
                              CardSaleWodget(total: con.bankAmount, text: "Network".tr, img: ImageHelper.network),
                              CardSaleWodget(total:con.totalCash, text: 'Cash'.tr, img: ImageHelper.cash),
                              CardSaleWodget(total: con.forward, text: 'Forward'.tr, img: ImageHelper.forward),
                
                             ],
                
                
                      ),
                    ),
                    const SizedBox(height: 10,),
                
                
                    Card(
                
                      color: context.theme.primaryColor.withOpacity(.1),
                      shape: RoundedRectangleBorder(
                
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                
                        children: [
                
                          Text("${"Total".tr}:",style: AppTextStyleTheme.madelTxtBld.copyWith(color:context.theme.hoverColor.withOpacity(.7)),),
                         const SizedBox(width: 10,),
                          Text(con.totalInvoices.toStringAsFixed(2),style: AppTextStyleTheme.madelTxtBld.copyWith(color:context.theme.hoverColor,),)
                
                        ],
                      ),
                    ),),
                     const SizedBox(height: 20,),
                     CustomTextInput(textEditingController: recipientController,text: "Amount Received".tr,showBorder: true,isRequired: true,  keyboardType: Platform.isIOS? TextInputType.numberWithOptions(decimal: true,signed: true):TextInputType.number,
                     inputFormatters: allowSingleDecimalInput(),),
                    const SizedBox(height: 20,),
                             
                    GetBuilder<PostingInvoicesController>(
                      builder: (postingInvoicesController) {
                        return
                          //postingInvoicesController.isLoading?Center(child: CircularProgressIndicator(),):
                
                          Column(
                            children: [
                             !postingInvoicesController.isLoading?Container():     Column(
                                  children: [
                                    LinearProgressIndicator(
                                      value: con.progress / con.master.length,
                                      minHeight: 20,
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      'Posting Inv: ${con.progress}/${con.master.length}',
                                      style: const TextStyle(fontSize: 20),
                                    ),

                
                
                                  ]),
                
                
                              postingInvoicesController.isLoading?Container():    CustomButton(text: "Posting".tr,color:con.master.isEmpty?Colors.grey:LightColor.primary ,onPress: con.master.isEmpty ? null : () async {
                             if(_formKey.currentState!.validate()){
                        List<Master> masters = con.master; // Assuming con.master holds the list of Master items



        if (SettingController().Printer_Name.isNotEmpty) {
      invoicesPosting(mode: ShareMode.print,
          total: con.totalInvoices,
          recipient: recipientController.text.trim());

      con.startPosting(masters.length);
      // Loop through the masters in batches
        await buildPostSaleTransaction(postingInvoicesController, con);
      for (var item in masters) {
        // Update master status locally


        // Post the master and its products
        await buildCreateTransactionWebDio(postingInvoicesController, item, con);
      }

    } else {
      Fluttertoast.showToast(
          msg: 'StrinPrinter_Error'.tr,
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          backgroundColor: Colors.redAccent);



      con.startPosting(masters.length);
      // Loop through the masters in batches
      await buildPostSaleTransaction(postingInvoicesController, con);
      for (var item in masters) {
        // Update master status locally


        // Post the master and its products
        await buildCreateTransactionWebDio(postingInvoicesController, item, con);
      }
    }
                        // Batch size is 20
                

                
                
                        }
                
                        },)
                
                        ],
                          );
                
                            }
                    ),
                
                
                
                
                  ],
                ),
              ),
            ),
          );
        }
      ),



      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.sale),

    );

  }

  Future<void> buildCreateTransactionWebDio(PostingInvoicesController postingInvoicesController, Master item, CartController con) {
    return postingInvoicesController.createTransactionWebDio(
          {
            "master": {
              "No": item.no.toString(),
              "Code": item.code.toString(),
              "RecipientName": item.recipientName.toString(),
              "Address": item.address.toString(),
              "Date": item.date.toString(),
              "Due_Date": item.dueDate.toString(),
              "Document_Note": item.documentNote.toString(),
              "Private_Note": item.privateNote.toString(),
              "Inventory_ID": item.inventoryId.toString(),
              "Phone": item.phone.toString(),
              "Discount_Rate": item.discountRate.toString(),
              "Discount_Amount": item.discountAmount.toString(),
              "VAT_Amount": item.vatAmount.toString(),
              "VAT": item.vat.toString(),
              "Subtotal": item.subtotal.toString(),
              "Total": item.total.toString(),
              "User_ID": item.userId.toString(),
              "Customer_ID": item.customerId.toString(),
              "Sys_App_Type_Id": item.sysAppTypeId.toString(),
              "POS_ID": item.posId.toString(),
              "Trans_Type_ID": item.transTypeId.toString(),
              "Refrance_ID": 0,
              "Payment_Terms_ID": item.paymentTermsId.toString(),
              "Cash_Amount": item.cashAmount.toString(),
              "Bank_Amount": item.bankAmount.toString(),
              "IsRecorded": item.isRecorded.toString(),
            },
            "products": [
              ...item.products.map((e) => {
                "ID": e.id,
                "Price": e.price,
                "Unit_ID": e.unitId,
                "Description": "from Application",
                "Qty": e.quantity,
                "Disc_rate": e.discountRate,
                "Discount_Amount": e.discountAmount,
                "VAT": e.vat,
                "VAT_Amount": e.vatAmount.toStringAsFixed(2),
                "Total": e.total.toStringAsFixed(2) ,
              }).toList(),
            ],
          },
          {
            'token': Get.find<AuthController>().generateTokenModel.token.toString(),
            'User_Id': Get.find<AuthController>().generateTokenModel.userId.toString(),
          }
          ,() async {
        item.isPosting = true;
        await con.updateMaster(item);


      });
  }

  Future<void> buildPostSaleTransaction(PostingInvoicesController postingInvoicesController, CartController con) {
    return postingInvoicesController.postSaleTransaction(
          {

            "amounCash": con.totalCash,
            "amountBank": con.bankAmount,
            "branchId": itemController.dataSalesPoints.branchId,
            "facilityId": itemController.dataSalesPoints.facilityId,

            "posId": itemController.dataSalesPoints.id,
            "accountIdTo": 0,
            "accountIdFrom": 0,
            "salesAmount": con.totalInvoices,
            "reSalasAmount": recipientController.text.trim(),
          });
  }
}

class CardSaleWodget extends StatelessWidget {
  const CardSaleWodget({
    super.key, required this.total, required this.text, required this.img,
  });
  final double total ;
  final String text ;
  final String img ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 120,
    height: 110,
    //  padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(total.toStringAsFixed(2),style: AppTextStyleTheme.appParTxtBld.copyWith(color: context.theme.hoverColor),overflow:  TextOverflow.ellipsis ,maxLines: 1,),
              const SizedBox(height: 10,),
              SvgPicture.asset(img),
              const SizedBox(height: 15,),
              Text(text,style: AppTextStyleTheme.madelTxtBld),
            ],
          ),
      )),
    );
  }
}
