// import 'dart:io';
// import '../../Operation/Controllers/sale_invoices_controller.dart';
// import '../../Operation/models/bil_mov_d.dart';
// import '../../PrintFile/share_mode.dart';
// import '../../PrintFile/simple_pdf.dart';
// import '../../Setting/controllers/login_controller.dart';
// import '../../Setting/controllers/setting_controller.dart';
// import '../../Widgets/config.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart' as intl;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import '../invoice_controller.dart';
// import 'file_helper.dart';
// import 'package:flutter/material.dart' as ma;
// import 'package:fluttertoast/fluttertoast.dart';
//
// Pdf_Invoices_Samplie({
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
//
//   final imageByteData = await rootBundle.load(ImagePathPDF);
//   final imagefile = File(SignPicture);
//   final imageBytes_b = LoginController().SOSI=='null' || LoginController().SOSI=='0' || LoginController().SOSI.isEmpty
//       ||  LoginController().Image_Type=='2'?imageByteData.buffer.asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes)
//       :imagefile.readAsBytesSync();
//   final image = pw.MemoryImage(imageBytes_b);
//
//   pdf.addPage(
//         MultiPage(
//       pageFormat: PdfPageFormat.a4,
//           textDirection: TextDirection.rtl,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           theme: ThemeData.withFont(base: Font.ttf(await rootBundle.load("Assets/fonts/HacenTunisia.ttf"))),
//           header: (context) =>Row(
//             mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//             children: <pw.Widget>[
//               Expanded(child:
//               Column(
//                   children: [
//                     Text(controller.SONE,style: TextStyle(fontWeight: FontWeight.bold, color: PdfColors.black, fontSize: 10.5.sp)),
//                     Text(controller.SOLN,style: TextStyle(fontWeight: FontWeight.bold, color: PdfColors.black, fontSize: 10.5.sp)),
//                     SimplePdf.text( controller.SVVL_TAX!='2'?'الرقم الضريبي:  ${ controller.SOTX.toString()} ':'', font, fontSize: 10.5.sp, color: PdfColors.black,),
//                   ]),),
//               Expanded(child:Column(children: [
//                 Container(
//                     width: 50.w,
//                     child: Image(image)
//                 ),
//                 Container( margin: const EdgeInsets.symmetric(vertical: 2),
//                     decoration: BoxDecoration(
//                       color: PdfColor.fromHex("#ABABAB"),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(controller.SVVL_TAX!='2'?controller.BMKID==4 || controller.BMKID==12?' مردرد فاتورة ضريبية مبسطة-$GetPKNA ':
//                     controller.BMKID==7?'عرض سعر-$GetPKNA':controller.BMKID==10?'طلب عميل-$GetPKNA': ' فاتورة ضريبية مبسطة-$GetPKNA '
//                         :controller.BMKID==3?'فاتورة مبيعات-$GetPKNA':controller.BMKID==7?'عرض سعر-$GetPKNA':controller.BMKID==10?'طلب عميل-$GetPKNA':
//                     controller.BMKID==1?'فاتورة مشتريات-$GetPKNA':controller.BMKID==4?'فاتورة مردود مبيعات-$GetPKNA':controller.BMKID==12?' مردود مبيعات فوريه-$GetPKNA'
//                         :'فاتورة مبيعات فورية-$GetPKNA',
//                         style: TextStyle(color: PdfColors.black, fontSize:controller.BMKID==4 || controller.BMKID==12?13: 13.sp))),
//               ])),
//               Expanded(
//                 child: Column(
//                     children: [
//                       Text(controller.SONA,style: TextStyle(color: PdfColors.black, fontSize: 11.sp)),
//                       Text(controller.SORN,style: TextStyle(color: PdfColors.black, fontSize: 11.sp)),
//                       SimplePdf.text(
//                         'العنوان : '
//                             '${ controller.SOAD.toString()} ',
//                         font,
//                         fontSize: 11.sp,
//                         color: PdfColors.black,
//                       ),
//                     ]),)
//             ],
//           ),
//           build: (Context context)=> [
//          Table(border: TableBorder.all(), children: [
//            TableRow(
//              children: [
//                Container(
//                  padding: const EdgeInsets.only(right: 1, left: 1),
//                  /// height: 630,
//                  child: Column(children: [
//                    Padding(
//                        padding: const EdgeInsets.only(right: 2, left: 2, top: 3),
//                        child: Row(children: [
//                          Table(border: TableBorder.all(), children: [
//                            TableRow(
//                              children: [
//                                Container(
//                                  width: 476,
//                                  padding: const pw.EdgeInsets.only(right: 8, left: 8),
//                                  child: Column(children: [
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            controller.BIF_MOV_M_PRINT.elementAt(0).BMMST.toString()=='2' ? 'StringNotfinal'.tr
//                                                : '${controller.BIF_MOV_M_PRINT.elementAt(0).BMMST}'.toString() == '3' ? 'StringPending'.tr : 'Stringfinal'.tr,
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'تاريخ اصدار الفاتورة: ${GetBMMDO!}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            '${controller.BIF_MOV_M_PRINT.elementAt(0).BMMRE.toString()=='null' || controller.BIF_MOV_M_PRINT.elementAt(0).BMMRE.toString().isEmpty
//                                                ?'الرقم اليدوي:--------': " الرقم اليدوي: ${controller.BIF_MOV_M_PRINT.elementAt(0).BMMRE}"}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            ' رقم الفاتورة: ${GetBMMNO!}',
//                                           // '${GetBMMNO!}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          SimplePdf.text(
//                                            'المخزن:${controller.BIF_MOV_M_PRINT.elementAt(0).SINA.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'العمله:${controller.BIF_MOV_M_PRINT.elementAt(0).SCNA_D.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    controller.BMKID==11?
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            'رقم النقطه:${controller.BIF_MOV_M_PRINT.elementAt(0).BPNA_D.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                        children: [
//                                          controller.BIF_MOV_M_PRINT.elementAt(0).BMKID.toString()=='10'?SimplePdf.text(
//                                            ' تاريخ التسليم: ${controller.BIF_MOV_M_PRINT.elementAt(0).BMMDD.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ):
//                                          controller.BIF_MOV_M_PRINT.elementAt(0).BMKID.toString()=='7'?SimplePdf.text(
//                                            ' العرض حتى تاريخ: ${controller.BIF_MOV_M_PRINT.elementAt(0).BMMCD.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ):
//                                          SimplePdf.text(
//                                            '',
//                                            font,
//                                            fontSize: 1,
//                                            color: PdfColors.black,
//                                          ),
//                                          controller.BIF_MOV_M_PRINT.elementAt(0).PKID.toString()=='1'?SimplePdf.text(
//                                            'الصندوق:${controller.BIF_MOV_M_PRINT.elementAt(0).ACNA.toString()}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ):
//                                          SimplePdf.text(
//                                            '',
//                                            font,
//                                            fontSize: 1,
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
//                                  width: 476,
//                                  padding: const pw.EdgeInsets.only(right: 8, left: 8),
//                                  child: Column(children: [
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            ' الاسم: ${controller.BIF_MOV_M_PRINT.elementAt(0).BMMNA}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMKID==7 || controller.BIF_MOV_M_PRINT.elementAt(0).BMKID==10?
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            ' عناية السيد:${controller.BIF_MOV_M_PRINT.elementAt(0).BMMGR}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            ' تفاصيل:${controller.BIF_MOV_M_PRINT.elementAt(0).BMMIN}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]),
//                                    controller.BIF_MOV_M_PRINT.elementAt(0).BMKID==7?
//                                    Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            controller.Statement_Quotation,
//                                            font, fontSize: 9,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]): controller.BIF_MOV_M_PRINT.elementAt(0).BMKID==10?Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            ' تفاصيل:${controller.BIF_MOV_M_PRINT.elementAt(0).BMMIN}',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                        ]):Row(
//                                        mainAxisAlignment: MainAxisAlignment.end,
//                                        children: [
//                                          SimplePdf.text(
//                                            'Tel:${controller.SOTL} ,',
//                                            font,
//                                            fontSize: 13,
//                                            color: PdfColors.black,
//                                          ),
//                                          SimplePdf.text(
//                                            'المنطقه:${controller.SOSN}',
//                                            font,
//                                            fontSize: 13,
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
//          Table(border: TableBorder.all(), columnWidths: {
//               0: const FlexColumnWidth(1.7),
//               1: const FlexColumnWidth(1),
//               2: const FlexColumnWidth(0.7),
//               3: const FlexColumnWidth(0.7),
//               4: const FlexColumnWidth(2),
//               5: const FlexColumnWidth(0.8),
//               6: const FlexColumnWidth(0.4),
//             },
//              children: [
//                   TableRow(
//                     decoration: const BoxDecoration(
//                       color: PdfColors.MyColors,
//                     ),
//                     children: [
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: controller.SVVL_TAX!='2'?SimplePdf.text(
//                           'المجموع )شامل ضريبه القيمه المضافة(',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ):SimplePdf.text(
//                           'الاجمالي',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           'سعر الوحدة',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           'الوحده',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           'الكميه',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           'تفاصيل السلع او الخدمات',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           'الصنف',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(),
//                         padding: const EdgeInsets.all(1),
//                         child: SimplePdf.text(
//                           '#',
//                           font,
//                           fontSize: 9,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ]),
//          Table(
//                 border: pw.TableBorder.all(),
//                 columnWidths: {
//                   0: const FlexColumnWidth(1.7),
//                   1: const FlexColumnWidth(1),
//                   2: const FlexColumnWidth(0.7),
//                   3: const FlexColumnWidth(0.7),
//                   4: const FlexColumnWidth(2),
//                   5: const FlexColumnWidth(0.8),
//                   6: const FlexColumnWidth(0.4),
//                 },
//                 children: List.generate(controller.InvoiceList.length, (index) {
//                   Bil_Mov_D_Local product = controller.InvoiceList[index];
//                   return pw.TableRow(
//                     children: [
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding: const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                             controller.formatter.format(((product.BMDAM!-product.BMDDI!)*product.BMDNO!)+product.BMDTXT1!).toString(),
//                             font,
//                             fontSize: 9),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           controller.formatter.format(product.BMDAM).toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           product.MUNA_D.toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           controller.formatter.format(product.BMDNO!+product.BMDNF!).toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           product.MINA_D.toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           product.MINO.toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           product.BMDID.toString() , font,
//                           fontSize: 9,color: PdfColors.black,
//                         ),
//                       ),
//                     ],
//                   );
//                 })),
//          SizedBox(height: 3),
//          Table(border: TableBorder.all(), children: [
//            TableRow(
//              children: [
//                pw.Container(
//                  padding: const EdgeInsets.only(right: 1, left: 1),
//                  /// height: 630,
//                  child: controller.SVVL_TAX!='2'?Column(children: [
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
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child:  controller.SVVL_TAX!='2'?SimplePdf.text(
//                                        'الاجمالي )غير شامله ضريبه القيمه المضافة(',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ):SimplePdf.text(
//                                        'الاجمالي',
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
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: controller.SVVL_TAX!='2'?SimplePdf.text(
//                                        'Total (Excluding VAT)',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ):SimplePdf.text(
//                                        'Total',
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
//                              ]),
//                            ]),
//                          ],
//                        ),
//                      ]),
//                    ),
//                    SizedBox(height: 3),
//                  ]):
//                  Column(children: [
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
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 175,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child:  controller.SVVL_TAX!='2'?SimplePdf.text(
//                                        'الاجمالي )غير شامله ضريبه القيمه المضافة(',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ):SimplePdf.text(
//                                        'الاجمالي',
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
//                              ]),
//                              Table(border: TableBorder.all(), children: [
//                                TableRow(
//                                  children: [
//                                    Container(
//                                      width: 160,
//                                      decoration: const BoxDecoration(),
//                                      padding: const EdgeInsets.all(1),
//                                      child: controller.SVVL_TAX!='2'?SimplePdf.text(
//                                        'Total (Excluding VAT)',
//                                        font,
//                                        align: TextAlign.center,
//                                        fontSize: 11,
//                                        color: PdfColors.black,
//                                      ):SimplePdf.text(
//                                        'Total',
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
//             StteingController().Print_Balance==true && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=4
//                 && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=1 && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=12
//                 && controller.BIF_MOV_M_PRINT.elementAt(0).PKID==3 && controller.BIF_MOV_M_PRINT.elementAt(0).BCID!='null'
//                 ? SizedBox(height: 3): SizedBox(height: 0),
//             StteingController().Print_Balance==true && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=4
//                 && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=1 && controller.BIF_MOV_M_PRINT.elementAt(0).BMKID!=12
//                 && controller.BIF_MOV_M_PRINT.elementAt(0).PKID==3 && controller.BIF_MOV_M_PRINT.elementAt(0).BCID!='null'
//                 ? Row( mainAxisAlignment: MainAxisAlignment.start ,
//                 children: <pw.Widget>[
//                   SimplePdf.text(
//                        controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' &&
//                        controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0 && controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC!>0
//                        && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                           || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                         " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//                         " ${'StringReturn_Am'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC).toString()}":
//                         controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' &&
//                         controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                         || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                         " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}":
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMMT!+controller.BACBA!).toString()}"
//                     , font, fontSize: 10.5, align: TextAlign.center, color: PdfColors.black,
//                   )
//                 ]) : controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP.toString()!='null' &&
//                 controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                 || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                   SimplePdf.text(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC!>0?
//                 " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//                     " ${'StringReturn_Am'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMTC).toString()}"
//                       :  " ${'StringBMMCP'.tr} ${controller.formatter.format(controller.BIF_MOV_M_PRINT.elementAt(0).BMMCP).toString()}"
//                     , font, fontSize: 10.5, align: TextAlign.center, color: PdfColors.black,)
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
//           controller.SVVL_TAX!='2'?SizedBox(height: 10):SizedBox(height: 1),
//           controller.SVVL_TAX!='2'?pw.Container(
//             alignment: pw.Alignment.center,
//             child: Container(
//               width: 70,
//               height: 70,
//               child: pw.BarcodeWidget(
//                 color: PdfColor.fromHex("#000000"),
//                 barcode: pw.Barcode.qrCode(),
//                 data: qrData,
//               ),
//             ),
//           ):Container(),
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
