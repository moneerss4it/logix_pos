// import 'dart:io';
// import '../../Operation/Controllers/sale_invoices_controller.dart';
// import '../../Operation/models/bil_mov_d.dart';
// import '../../PrintFile/share_mode.dart';
// import '../../PrintFile/simple_pdf.dart';
// import '../../Setting/controllers/login_controller.dart';
// import '../../Setting/controllers/setting_controller.dart';
// import '../../Widgets/config.dart';
// import 'package:flutter/material.dart' as ma;
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import '../invoice_controller.dart';
// import 'file_helper.dart';
//
//
// Pdf_Invoices({
//   String? GetBMKID,
//   String? GetBMMDO,
//   String? GetBMMNO,
//   String? GetPKNA,
//   required ShareMode mode,
//   // required UserTaxInfo userTaxInfo,
//   // required InvoiceSetting invoiceSetting,
// }) async {
//    try {
//   final Sale_Invoices_Controller controller = Get.find();
//   String qrData = await  InvoiceController.zatcaQrData(
//     nameSaller: controller.SONA.toString(),
//     invoiceTotalAmount: controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT.toString(),
//     invoiceTaxAmount: controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX1.toString(),
//     taxNumber: controller.SOTX.toString(),
//   );
//
//   final pdf = pw.Document();
//   final Uint8List fontData = await FileHelper.getFileFromAssets('Assets/fonts/HacenTunisia.ttf');
//   final font = pw.Font.ttf(fontData.buffer.asByteData());
//   final imageByteData = await rootBundle.load(ImagePathPDF);
//
//   final imagefile = File(SignPicture);
//   print(imagefile);
//   print('imagefile');
//   final imageBytes_b = LoginController().SOSI=='null' || LoginController().SOSI=='0' || LoginController().SOSI.isEmpty
//       ||  LoginController().Image_Type=='2'?imageByteData.buffer.asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes)
//       :imagefile.readAsBytesSync();
//   final image = pw.MemoryImage(imageBytes_b);
//
// // late InformationUserModel informationUserModel;
// // final map = GetStorage().read(informationUserStorage) ?? {};
// // informationUserModel=InformationUserModel.fromJson(map);
//
//   pdf.addPage(
//         MultiPage(
//       pageFormat: PdfPageFormat.a4,
//          // margin: const EdgeInsets.all(10),
//          //  textDirection: TextDirection.rtl,
//          // crossAxisAlignment: CrossAxisAlignment.center,
//          // theme: ThemeData.withFont(base: Font.ttf(await rootBundle.load("Assets/fonts/HacenTunisia.ttf"))),
//           header: (context) =>Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Expanded(child:
//               Column(
//                   children: [
//                     SimplePdf.text(
//                       controller.SONE,
//                       font,
//                       align: TextAlign.right,
//                       fontSize: 11.sp,
//                       color: PdfColors.black,
//                     ),
//                     SimplePdf.text(
//                       controller.SOLN,
//                       font,
//                       align: TextAlign.right,
//                       fontSize: 11.sp,
//                       color: PdfColors.black,
//                     ),
//                   //  Text(controller.SONE, maxLines: 1,style: TextStyle(fontWeight: FontWeight.bold, color: PdfColors.black, fontSize: 11.sp)),
//                    // Text(controller.SOLN,style: TextStyle(fontWeight: FontWeight.bold, color: PdfColors.black, fontSize: 11.sp)),
//                   ]),),
//               Expanded(child:Column(children: [
//                 Container(
//                     width: 50.w,
//                      child: Image(image)
//                 ),
//                 Container( margin: const EdgeInsets.symmetric(vertical: 2),
//                     decoration: BoxDecoration(
//                       color: PdfColor.fromHex("#ABABAB"),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: SimplePdf.text(
//                       controller.BMKID==4 || controller.BMKID==12?' مردرد فاتورة ضريبية -$GetPKNA ':
//                       controller.BMKID==7?' عرض سعر -$GetPKNA ':
//                       controller.BMKID==10?' طلب عميل -$GetPKNA ':' ${'String_Tax_Invoice'.tr}  $GetPKNA ',
//                       font,
//                       align: TextAlign.right,
//                       fontSize: controller.BMKID==4 || controller.BMKID==12?13: 13.sp,
//                       color: PdfColors.black,
//                     )
//                 ),
//               ])),
//               Expanded(
//                 child:
//                 Column(
//                     children: [
//                       SimplePdf.text(
//                         controller.SONA,
//                         font,
//                         align: TextAlign.right,
//                         fontSize: 11.sp,
//                         color: PdfColors.black,
//                       ),
//                       SimplePdf.text(
//                         controller.SORN,
//                         font,
//                         align: TextAlign.right,
//                         fontSize: 11.sp,
//                         color: PdfColors.black,
//                       ),
//                      // Text(controller.SONA, maxLines: 1,style: TextStyle(color: PdfColors.black, fontSize: 11.sp)),
//                      // Text(controller.SORN,style: TextStyle(color: PdfColors.black, fontSize: 11.sp)),
//                     ]),)
//             ],
//           ),
//           build: (Context context)=> [
//          Table(border: TableBorder.all(), children: [
//            TableRow(
//              children: [
//                pw.Container(
//                  padding: const EdgeInsets.only(right: 1, left: 1),
//                  /// height: 630,
//                  child: Column(children: [
//                    Padding(
//                      padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                      child: Table(border: TableBorder.all(), children: [
//                        TableRow(
//                          children: [
//                            Container(
//                              decoration: const BoxDecoration(),
//                              padding: const EdgeInsets.all(1),
//                              child: Padding(
//                                  padding: const EdgeInsets.only(left: 2, top: 2,bottom: 2),
//                                  child: Column(
//                                    children: [
//                                      Row(children: [
//                                        Table(border: TableBorder.all(), children: [
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    '.Invoice NO',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    'Invoice issue date',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    'Date of Supply',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                        ]),
//                                        Table(border: TableBorder.all(), children: [
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(GetBMMNO!,
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    GetBMMDO!,
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    GetBMMDO,
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                        ]),
//                                        Table(border: TableBorder.all(), children: [
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    'رقم الفاتورة',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    'تاريخ اصدار الفاتورة',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 90,
//                                                decoration: const BoxDecoration(),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    'تاريخ التوريد',
//                                                    font,
//                                                    align: TextAlign.right,
//                                                    fontSize: 9,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                        ]),
//                                        Padding(
//                                            padding: const EdgeInsets.only(left: 130,top: 8),
//                                            child:Container(
//                                              alignment: pw.Alignment.center,
//                                              child: Container(
//                                                width: 70,
//                                                height: 40,
//                                                child: pw.BarcodeWidget(
//                                                  color: PdfColor.fromHex("#000000"),
//                                                  barcode: pw.Barcode.qrCode(),
//                                                  data: qrData.toString(),
//                                                ),
//                                              ),
//                                            )),
//                                      ]),
//                                      Row(children: [
//                                        Table(border: TableBorder.all(), children: [
//                                          TableRow(
//                                            children: [
//                                              Container(
//                                                width: 270,
//                                                decoration: const BoxDecoration(
//                                                  color: PdfColors.MyColors,
//                                                ),
//                                                padding: const EdgeInsets.all(1),
//                                                child: Column(children: [
//                                                  SimplePdf.text(
//                                                    GetBMKID=='3'?"فاتورة مبيعات-$GetPKNA":GetBMKID=='4'?"مردود فاتورة مبيعات-$GetPKNA":
//                                                    GetBMKID=='11'?"فاتورة مبيعات فوريه-$GetPKNA": GetBMKID=='12'?"مردود مبيعات فوريه-$GetPKNA":
//                                                    GetBMKID=='7'?"عرض سعر-$GetPKNA":
//                                                    GetBMKID=='10'?"طلب عميل-$GetPKNA":
//                                                    "فاتورة مشتريات-$GetPKNA",
//                                                    font,
//                                                    align: TextAlign.center,
//                                                    fontSize: 10,
//                                                    color: PdfColors.black,
//                                                  ),
//                                                ]),
//                                              ),
//                                            ],
//                                          ),
//                                        ]),
//                                      ]),
//                                    ],
//                                  )),
//                            ),
//                          ],
//                        ),
//                      ]),
//                    ),
//                    Padding(
//                        padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                        child: Row(children: [
//                          Table(border: TableBorder.all(), children: [
//                            TableRow(
//                              children: [
//                                Container(
//                                  width: 238,
//                                  decoration: const BoxDecoration(color: PdfColors.MyColors),
//                                  padding: const EdgeInsets.all(1),
//                                  child: controller.BMKID==1?SimplePdf.text(
//                                    'العميل Customer',
//                                    font,
//                                    align: TextAlign.center,
//                                    fontSize: 11,
//                                    color: PdfColors.black,
//                                  ): SimplePdf.text(
//                                    'المورد/المصنع Supplier',
//                                    font,
//                                    align: TextAlign.center,
//                                    fontSize: 11,
//                                    color: PdfColors.black,
//                                  ),
//                                ),
//                              ],
//                            ),
//                            TableRow(
//                              children: [
//                                Container(
//                                  padding: const EdgeInsets.only(right: 4, left: 4),
//                                  width: 238,
//                                  height: 170,
//                                  child: Column(
//                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                      children: [
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Name',
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SONA,
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                          SimplePdf.text(
//                                            'الاسم',
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Building No.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOBN,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم البنايه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Street Name',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOSN,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'اسم الشارع',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'District\Quarter',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOQN,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الحي/المنطقه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'City',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.CTID=='null'?'':controller.CTID,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'المدينه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Country',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.CWID=='null'?'':controller.CWID,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الدوله',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Postal Code',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOPC,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الرمز البريدي',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Additional Address No.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOAD2,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم اضافي للعنوان',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'VAT Number',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOTX,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم تسجيل ضريبة '
//                                                'القيمه المضافه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Tel.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOTL,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'هاتف',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Commercial registration number',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.SOC1,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم السجل التجاري',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                  ]),
//                                ),
//                              ],
//                            )
//                          ]),
//                          Table(border: TableBorder.all(), children: [
//                            TableRow(
//                              children: [
//                                Container(
//                                  width: 238,
//                                  decoration:
//                                  const BoxDecoration(color: PdfColors.MyColors),
//                                  padding: const EdgeInsets.all(1),
//                                  child: controller.BMKID==1?SimplePdf.text(
//                                    'المورد/المصنع Supplier',
//                                    font,
//                                    align: TextAlign.center,
//                                    fontSize: 11,
//                                    color: PdfColors.black,
//                                  ):SimplePdf.text(
//                                    'العميل Customer',
//                                    font,
//                                    align: TextAlign.center,
//                                    fontSize: 11,
//                                    color: PdfColors.black,
//                                  ),
//                                ),
//                              ],
//                            ),
//                            TableRow(
//                              children: [
//                                Container(
//                                  padding: const EdgeInsets.only(right: 4, left: 4),
//                                  width: 238,
//                                  height: 170,
//                                  child: Column(children: [
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Name',
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCNA,
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                          SimplePdf.text(
//                                            'الاسم',
//                                            font,
//                                            fontSize: 9,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Building No.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCBN,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم البنايه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Street Name',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCSN=='null'?'':controller.BCSN,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'اسم الشارع',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'District\Quarter',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCQND=='null'?'': controller.BCQND,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الحي/المنطقه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'City',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.CTNA=='null'?'':controller.CTNA,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'المدينه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Country',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.CWNA,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الدوله',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Postal Code',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCPC,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الرمز البريدي',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Additional Address No.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCAD2,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم اضافي للعنوان',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'VAT Number',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCTX,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم تسجيل ضريبة القيمه المضافه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Tel.',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCTL,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'هاتف',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Commercial registration number',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BCC1,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم السجل التجاري',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                  ]),
//                                ),
//                              ],
//                            )
//                          ]),
//                        ])),
//                    SizedBox(height: 2),
//                    Divider(height: 1),
//                    Padding(
//                        padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                        child: Row(children: [
//                          Table(border: TableBorder.all(), children: [
//                            TableRow(
//                              children: [
//                                Container(
//                                  width: 238,
//                                  decoration: const BoxDecoration(color: PdfColors.MyColors),
//                                  padding: const EdgeInsets.all(1),
//                                  child: Column(children: [
//                                    SimplePdf.text(
//                                      'Additional Data',
//                                      font,
//                                      align: TextAlign.right,
//                                      fontSize: 11,
//                                      color: PdfColors.black,
//                                    ),
//                                  ]),
//                                ),
//                              ],
//                            ),
//                            TableRow(
//                              children: [
//                                pw.Container(
//                                  padding: const pw.EdgeInsets.only(right: 8, left: 8),
//                                  width: 238,
//                                  height: 50,
//                                  child: Column(children: [
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Currency',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            "${controller.BIF_MOV_M_PRINT.elementAt(0).SCNA_D.toString()} ${controller.BIF_MOV_M_PRINT.elementAt(0).SCSY.toString()}",
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'العمله',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment:
//                                        MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'State',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BIF_MOV_M_PRINT.elementAt(0).BMMST.toString()=='2' ? 'StringNotfinal'.tr
//                                                : '${controller.BIF_MOV_M_PRINT.elementAt(0).BMMST}'.toString() == '3' ? 'StringPending'.tr : 'Stringfinal'.tr,
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الحاله',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                  ]),
//                                ),
//                              ],
//                            )
//                          ]),
//                          Table(border: TableBorder.all(), children: [
//                            TableRow(
//                              children: [
//                                Container(
//                                  width: 238,
//                                  decoration: const BoxDecoration(color: PdfColors.MyColors),
//                                  padding: const EdgeInsets.all(1),
//                                  child: Column(children: [
//                                    SimplePdf.text(
//                                      'بيانات اضافيه',
//                                      font,
//                                      align: TextAlign.right,
//                                      fontSize: 11,
//                                      color: PdfColors.black,
//                                    ),
//                                  ]),
//                                ),
//                              ],
//                            ),
//                            TableRow(
//                              children: [
//                                pw.Container(
//                                  padding:
//                                  const pw.EdgeInsets.only(right: 8, left: 8),
//                                  width: 238,
//                                  height: 50,
//                                  child: Column(children: [
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Branch',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            "${controller.BIF_MOV_M_PRINT.elementAt(0).BINA.toString()} ${controller.BIF_MOV_M_PRINT.elementAt(0).BINE.toString()=='null'?'':controller.BIF_MOV_M_PRINT.elementAt(0).BINE.toString()}",
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الفرع',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                        controller.BMKID==11 || controller.BMKID==12?Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'No. point',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            controller.BIF_MOV_M_PRINT.elementAt(0).BPNA_D.toString(),
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'رقم النقطه',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):
//                                        controller.BIF_MOV_M_PRINT.elementAt(0).PKID.toString()=='1'?Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Cashier',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            "${controller.BIF_MOV_M_PRINT.elementAt(0).ACNA.toString()} ${controller.BIF_MOV_M_PRINT.elementAt(0).ACNE.toString()=='null'?'':controller.BIF_MOV_M_PRINT.elementAt(0).ACNE.toString()}",
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'الصندوق',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):
//                                        controller.BIF_MOV_M_PRINT.elementAt(0).PKID.toString()=='8'?Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Credit Card',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            "${controller.BIF_MOV_M_PRINT.elementAt(0).BCCNA.toString()} ${controller.BIF_MOV_M_PRINT.elementAt(0).BCCNE.toString()=='null'?'':controller.BIF_MOV_M_PRINT.elementAt(0).BCCNE.toString()}",
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'بطاقة ائتمان',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):Container(),
//                                        Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Store',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            "${controller.BIF_MOV_M_PRINT.elementAt(0).SINA.toString()} ${controller.BIF_MOV_M_PRINT.elementAt(0).SINE.toString()=='null'?'':controller.BIF_MOV_M_PRINT.elementAt(0).SINE.toString()}",
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'المخزن',
//                                            font,
//                                            fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                  ]),
//                                ),
//                              ],
//                            )
//                          ]),
//                        ])),
//                    SizedBox(height: 3),
//                  ]),
//                ),
//              ],
//            ),
//          ]),
//           Table(border: TableBorder.all(), columnWidths: {
//             0: const FlexColumnWidth(1.7),
//             1: const FlexColumnWidth(0.8),
//             2: const FlexColumnWidth(0.7),
//             3: const FlexColumnWidth(0.8),
//             4: const FlexColumnWidth(1.1),
//             5: const FlexColumnWidth(1),
//             6: const FlexColumnWidth(0.7),
//             7: const FlexColumnWidth(0.7),
//             8: const FlexColumnWidth(2),
//             9: const FlexColumnWidth(0.8),
//             10: const FlexColumnWidth(0.4),
//           },
//               children: [
//                 TableRow(
//                   decoration: const BoxDecoration(
//                     color: PdfColors.MyColors,
//                   ),
//                   children: [
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'المجموع )شامل ضريبه القيمه المضافة(',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'مبلغ الضريبة',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'نسبه الضريبة',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const pw.BoxDecoration(),
//                       padding: const pw.EdgeInsets.all(1),
//                       child: pw.Column(children: [
//                         SimplePdf.text(
//                           'خصومات',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ]),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'المبلغ الخاضع للضريبه',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'سعر الوحدة',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'الوحده',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'الكميه',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'تفاصيل السلع او الخدمات',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         'الصنف',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(),
//                       padding: const EdgeInsets.all(1),
//                       child: SimplePdf.text(
//                         '#',
//                         font,
//                         fontSize: 9,
//                         color: PdfColors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ]),
//           Table(
//               border: pw.TableBorder.all(),
//               columnWidths: {
//                 0: const FlexColumnWidth(1.7),
//                 1: const FlexColumnWidth(0.8),
//                 2: const FlexColumnWidth(0.7),
//                 3: const FlexColumnWidth(0.8),
//                 4: const FlexColumnWidth(1.1),
//                 5: const FlexColumnWidth(1),
//                 6: const FlexColumnWidth(0.7),
//                 7: const FlexColumnWidth(0.7),
//                 8: const FlexColumnWidth(2),
//                 9: const FlexColumnWidth(0.8),
//                 10: const FlexColumnWidth(0.4),
//               },
//               children: List.generate(controller.InvoiceList.length, (index) {
//                 Bil_Mov_D_Local product = controller.InvoiceList[index];
//                 print('product.MINA_D');
//                 print(product.MINA_D);
//                 return pw.TableRow(
//                   children: [
//                     pw.Container(
//                       alignment: pw.Alignment.center,
//                       padding: const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                           controller.formatter.format(((product.BMDAM!-product.BMDDI!)*product.BMDNO!)+product.BMDTXT1!).toString(),
//                           font,
//                           fontSize: 8),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                           controller.formatter.format(product.BMDTXT1).toString() , font,
//                           fontSize: 8),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                           controller.formatter.format(product.BMDTX1).toString() , font,
//                           fontSize: 8),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         controller.formatter.format((product.BMDDI!+((product.BMDDIA!/100)*product.BMDAM!))*product.BMDNO!+(product.BMDDIF!*product.BMDNF!)).toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         controller.formatter.format((product.BMDAM!-(product.BMDDI!+((product.BMDDIA!/100)*product.BMDAM!)))*product.BMDNO!).toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         controller.formatter.format(product.BMDAM).toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         product.MUNA_D!.toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         controller.formatter.format(product.BMDNO!+product.BMDNF!).toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                        product.MINA_D.toString(),font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         product.MINO.toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                     pw.Container(
//                       alignment: pw.Alignment.center,
//                       padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                       child: SimplePdf.text(
//                         product.BMDID.toString() , font,
//                         fontSize: 8,color: PdfColors.black,
//                       ),
//                     ),
//                   ],
//                 );
//               })),
//           SizedBox(height: 3),
//          Table(border: TableBorder.all(), children: [
//            TableRow(
//              children: [
//                pw.Container(
//                  padding: const EdgeInsets.only(right: 1, left: 1),
//                  /// height: 630,
//                  child: Column(children: [
//                    Padding(padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                      child: Table(border: TableBorder.all(), children: [
//                        TableRow(
//                          children: [
//                            Row(children: [
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format((controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!)).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!+controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!+controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!>0?TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                (controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!)!=(controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!)?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      height:36,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format((controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!-
//                                            controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!-
//                                            controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!)).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).TTID2.toString()!='null' && controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX2!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX2).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX1).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 140,
//                                      decoration: const BoxDecoration( color: PdfColors.grey200,),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString(),
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                        width: 140,
//                                        height:16,
//                                        decoration: const BoxDecoration(),
//                                        padding: const EdgeInsets.all(1),
//                                        child: Text('')
//                                    ),
//                                  ],
//                                ),
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'الاجمالي )غير شامله ضريبه القيمه المضافة(',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!+controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'اجمالي الخصم',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!>0?TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'تخفيض للمجاني',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                (controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!)!=(controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!)?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'الاجمالي الخاضع للضريبه )غير شامل ضريبة القيمه المضافة(',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).TTID2.toString()!='null' && controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX2!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'الضريبه الانتقائيه',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'مجموع ضريبة القيمة المضافة',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration( color: PdfColors.grey200,),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'صافي المبلغ',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        "${'StringTotal_NO'.tr} ${controller.formatter.format(double.parse(controller.COUNTBMDNOController.text))}",
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 9,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Total (Excluding VAT)',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!+controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Total discount',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!>0?TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Discount',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                (controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDI!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIF!-
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMMDIA!)!=(controller.BIF_MOV_M_PRINT.elementAt(0).BMMAM!-controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX!)?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Total Taxable Amount (Excluding VAT)',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                controller.BIF_MOV_M_PRINT.elementAt(0).TTID2.toString()!='null' && controller.BIF_MOV_M_PRINT.elementAt(0).BMMTX2!>0?
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Excise tax',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ):TableRow(children: []),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Total VAT',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration( color: PdfColors.grey200),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        'Net Amount',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: SimplePdf.text(
//                                        " عدد الاصناف= ${ controller. CountRecodeController.text.toString()}",
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 9,
//                                        color: PdfColors.black,
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ]),
//                            ]),
//                          ],
//                        ),
//                      ]),
//                    ),
//                    SizedBox(height: 3),
//                  ]),
//                ),
//              ],
//            ),
//          ]),
//             StteingController().Print_Balance==true && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=1
//             && controller.BIF_MOV_M_PRINT.elementAt(0).PKID==3 && controller.BIF_MOV_M_PRINT.elementAt(0).BCID!='null'
//                 ? SizedBox(height: 3): SizedBox(height: 0),
//             StteingController().Print_Balance==true && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=1
//                 && controller.BIF_MOV_M_PRINT.elementAt(0).PKID==3 && controller.BIF_MOV_M_PRINT.elementAt(0).BCID!='null'
//                 ? Row( mainAxisAlignment: MainAxisAlignment.start,
//                 children: <pw.Widget>[
//                   SimplePdf.text(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' &&
//                     controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0 && controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC!>0
//                         && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                         || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                         " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//                         " ${'StringReturn_Am'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC).toString()}":
//                   controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' && controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0
//                           && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                         || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                   " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                       "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                       "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                       " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}":
//                   " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                       "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                       "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                     , font, fontSize: 10.5, align: TextAlign.center, color: PdfColors.black,
//                   )
//                 ]) : controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' &&
//                 controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                 || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                  SimplePdf.text(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC!>0?
//             " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//                 " ${'StringReturn_Am'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC).toString()}"
//                 :  " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//               , font, fontSize: 10.5, align: TextAlign.center, color: PdfColors.black,)
//                 : SizedBox(height: 0),
//          Table(border: TableBorder.all(), children: [
//            TableRow(
//              children: [
//                Container(
//                  padding: const EdgeInsets.only(right: 1, left: 1),
//                  /// height: 630,
//                  child: Column(children: [
//                    Padding(padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                      child: Container(
//                        padding:  const EdgeInsets.only(top: 2,bottom: 3),
//                        child: SimplePdf.text(controller.SDDDA,
//                          font,
//                          fontSize: 9,
//                          align: TextAlign.center,
//                          color: PdfColors.black,
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 2),
//                    Divider(height: 1),
//                    Padding(padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                      child: Container(
//                        padding:  const EdgeInsets.only(top: 2,bottom: 3),
//                        child: SimplePdf.text(controller.SDDSA,
//                          font,
//                          fontSize: 9,
//                          align: TextAlign.center,
//                          color: PdfColors.black,
//                        ),
//                      ),
//                    ),
//                    SizedBox(height: 2),
//                  ]),
//                ),
//              ],
//            ),
//          ]),
//       ],
//           footer: (context) =>  Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SimplePdf.text(
//                   'المستخدم: ${LoginController().SUNA}',
//                   font,
//                   fontSize: 9,
//                   color: PdfColors.black,
//                 ),
//                 Text('Page ${context.pageNumber}  of ${context.pagesCount}',
//                     style: const TextStyle(fontSize: 9)),
//                 SimplePdf.text(
//                   'تاريخ الطباعه: ${intl.DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now())}',
//                   font,
//                   fontSize: 9,
//                   color: PdfColors.black,
//                 ),
//               ])]),
//     ),
//   );
//
//   List<int> bytes = await pdf.save();
//   FileHelper.share(
//       msg: "iiiiiiiiii",
//       mode: mode,
//       bytes: bytes,
//       fileName:
//       'Invoice - ${controller.BIF_MOV_M_PRINT.elementAt(0).BMMNO}.pdf',
//       BMMID: controller.BIF_MOV_M_PRINT.elementAt(0).BMMID!);
//    } catch (e) {
//      Fluttertoast.showToast(
//          msg:e.toString(),
//          toastLength: Toast.LENGTH_LONG,
//          textColor: ma.Colors.white,
//          backgroundColor: ma.Colors.redAccent);
//      print(e.toString());
//    }
// }
//
