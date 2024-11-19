import 'dart:async';

import 'package:app/PrintFile/Invoice/invoice_view58.dart';
import 'package:app/PrintFile/share_mode.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/customer_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/data/model/customer_model.dart';
import 'package:app/data/model/invoice_model.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/inv_print/invoice_view.dart';
import 'package:app/view/inv_print/widget/file_helper.dart';
import 'package:app/view/inv_print/widget/share_mode.dart';
import 'package:app/view/screen/cartscreen/widget/payment_type_selection_widget.dart';
import 'package:app/view/screen/cartscreen/widget/total_cart_wid.dart';
import 'package:app/view/screen/home_screen/home_screen.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/button_navigator_bar.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:app/view/widget/lookupDataWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../PrintFile/Invoice/file_helper.dart';
import '../../widget/custom_snackbar.dart';

class TypePayScreen extends StatefulWidget {
  const TypePayScreen({super.key});

  @override
  State<TypePayScreen> createState() => _TypePayScreenState();
}

class _TypePayScreenState extends State<TypePayScreen> {
  TextEditingController _customerController = TextEditingController();

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.find<CustomerController>().getCustomers(true);
  }
  int custId = 0;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CusAppBar(context, "السلة".tr, show: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<CartController>(builder: (con) {
          if (con.selectedPayment != 4) {
            _customerController.clear();
            custId = 0;
          }
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TotalCartWidget(total:con.totalAmountWithVat,),
                SizedBox(
                  height: 20,
                ),
                PaymentTypeSelection(),
                GetBuilder<CartController>(builder: (con) {
                  return con.selectedPayment != 4
                      ?const SizedBox()
                      :

                      //
                      // Row(
                      //   children: [
                      //     Expanded(child: CustomTextInput(text: "رقم العميل",showBorder: true,exText: "ادخل رقم العميل ",)),
                      //     Expanded(flex: 2,child: CustomTextInput(text: "",showBorder: true,exText: "ادخل اسم العميل ",)),
                      //
                      //   ],
                      // )
                      GetBuilder<CustomerController>(builder: (controller) {
                          return InkWell(
                              onTap: () {
                                LookUpCustomWidget(
                                  context,
                                  _customerController,
                                  controller,
                                  (p0) {
                                    custId = p0.id!;
                                  },
                                );
                              },
                              child: CustomTextInput(
                                showBorder: true,
                                textEditingController: _customerController,
                                icon2: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Get.theme.hintColor,
                                ),
                                text: 'العميل'.tr,
                                exText: 'Choose'.tr,
                                isEnabled: false,
                                isRequired:
                                    con.selectedPayment != 4 ? false : true,
                              ));
                        });
                }),
                const Spacer(),
              const  SizedBox(
                  height: 20,
                ),
                GetBuilder<ItemController>(builder: (pointController) {
                  return pointController.running
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          sizeWidth: .9.sw,
                          text: "Payment".tr,
                          onPress: () async {
                            if (_formKey.currentState!.validate()) {
                              pointController.onPrint();
                              InvoiceModel invoiceModel =
                                  FileHelper.generateUniqueCode(pointController
                                      .dataSalesPoints);

                              Master master = Master(
                                no: invoiceModel.no,
                                code: invoiceModel.code,
                                recipientName:  pointController
                                    .dataSalesPoints.customerName.toString(),
                                date: DateTime.now().toString(),
                                dueDate: DateTime.now().toString(),
                                documentNote: "from logix POS",
                                privateNote: "from logix POS",
                                inventoryId: pointController
                                    .dataSalesPoints.inventoryId
                                    .toString(),
                                discountRate: "0",
                                discountAmount: "0",
                                vatAmount:
                                    (con.totalVatAmount).toStringAsFixed(2),
                                vat: "15",
                                isPosting: false,
                                subtotal: con.totalAmount.toStringAsFixed(2),
                                total: con.totalAmount.toStringAsFixed(2),
                                userId:
                                    "${Get.find<AuthController>().getUserId()}",
                                customerId: con.selectedPayment == 4
                                    ? custId.toString()
                                    : pointController.dataSalesPoints.customerId
                                        .toString(),
                                sysAppTypeId: 2,
                                posId: pointController.dataSalesPoints.id
                                    .toString(),
                                transTypeId: "1",
                                refranceId: 0,
                                paymentTermsId: con.selectedPayment.toString(),
                                cashAmount: con.selectedPayment == 1
                                    ? con.totalAmountWithVat.toStringAsFixed(2)
                                    : "0",
                                bankAmount: con.selectedPayment == 2
                                    ? con.totalAmountWithVat.toStringAsFixed(2)
                                    : "0",
                                isRecorded: pointController
                                            .dataSalesPoints.lnkAccounting ==
                                        1
                                    ? true
                                    : false, // Set to false,
                                products: con.cartItems,
                                forward: con.selectedPayment == 4
                                    ? con.totalAmountWithVat.toStringAsFixed(2)
                                    : "0",
                                customerName: pointController
                                    .dataSalesPoints.customerName
                                    .toString(), // Pass the CartItem list
                              );

                              // Get.offAll(HomeScreen());

                              FileHelper().initPlatformState();
                              if (SettingController().Printer_Name.isNotEmpty) {
                                Timer(const Duration(seconds: 1), () async {
                                  await printReport(
                                      master: master,
                                      msg: "Payment Success".tr,
                                      mode: ShareMode.print);


                                  //   taxTikcetReport58(orderDetails:master,msg:"تم الدفع بنجاح",mode: ShareMode.print);
                                  //   StteingController()
                                  //       .Thermal_printer_paper_size ==
                                  //       '58'
                                  //       ? taxTikcetReport58(
                                  //       mode: ShareMode
                                  //           .print,
                                  //       msg: 'مرحبا',
                                  //       orderDetails: controller
                                  //           .BIF_MOV_M_PRINT)
                                  //       : taxTikcetReport80(
                                  //       mode: ShareMode
                                  //           .print,
                                  //       msg: 'مرحبا',
                                  //       orderDetails: controller
                                  //           .BIF_MOV_M_PRINT);
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'StrinPrinter_Error'.tr,
                                    toastLength: Toast.LENGTH_LONG,
                                    textColor: Colors.white,
                                    backgroundColor: Colors.redAccent);
                              }
                              Future.delayed(const Duration(seconds: 3), () {
                                pointController.onPrint();
                               con.saveMaster(master);
                                   Get.offAll(const HomeScreen());
                                showCustomSnackBar("Payment Success".tr,
                                    isError: false);
                              });
                            }
                          });
                }),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.cart),
    );
  }
}
