// import 'dart:io';
// import '../../Operation/Controllers/sale_invoices_controller.dart';
// import '../../Operation/models/bil_mov_d.dart';
// import '../../Operation/models/bil_mov_m.dart';
// import '../../PrintFile/share_mode.dart';
// import '../../PrintFile/simple_pdf.dart';
// import '../../Setting/controllers/setting_controller.dart';
// import 'package:flutter/services.dart';
// import '../../Setting/controllers/login_controller.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import '../invoice_controller.dart';
// import '../../Widgets/config.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import 'package:flutter/material.dart' as ma;
// import 'file_helper.dart';
//
//
// taxTikcetReport80({
//     required List<Bil_Mov_M_Local> orderDetails,
//   String? msg,
//   required ShareMode mode,
//   // required UserTaxInfo userTaxInfo,
//   // required InvoiceSetting invoiceSetting,
// }) async {
//    try {
//   final Sale_Invoices_Controller controller = Get.find();
//   String qrData = await  InvoiceController.zatcaQrData(
//     nameSaller: controller.SONA.toString(),
//     invoiceTotalAmount: orderDetails.elementAt(0).BMMMT.toString(),
//     invoiceTaxAmount: orderDetails.elementAt(0).BMMTX1.toString(),
//     taxNumber: controller.SOTX.toString() ,
//   );
//
//   final pdf = pw.Document();
//
//   final Uint8List fontData = await FileHelper.getFileFromAssets('Assets/fonts/HacenTunisia.ttf');
//   final ttf = pw.Font.ttf(fontData.buffer.asByteData());
//   final imageByteData = await rootBundle.load(ImagePathPDF);
//   final imagefile = File(SignPicture);
//   final imageBytes_b = LoginController().SOSI=='null' || LoginController().SOSI=='0' || LoginController().SOSI.isEmpty
//       ||  LoginController().Image_Type=='2'?imageByteData.buffer.asUint8List(imageByteData.offsetInBytes, imageByteData.lengthInBytes)
//       :imagefile.readAsBytesSync();
//   final image = pw.MemoryImage(imageBytes_b);
//   print('BMDTXController.text');
//   print(controller.BMDTXController.text);
//   pdf.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.roll80,
//       margin:const EdgeInsets.all(2.5),
//       build: (Context context) {
//         return StteingController().Type_Model == 2
//             ? Column(
//           children: [
//             Row(
//               mainAxisAlignment: pw.MainAxisAlignment.center,
//               children: [
//                 pw.Expanded(
//                   child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.center,
//                       children: [
//                         StteingController().Print_Image==true? Container(
//                             width: 50.w,
//                             child: Image(image)
//                         ):Container(),
//                         LoginController().experimentalcopy==1?    pw.Image(image, height: 60, width: 60):Container(),
//                         SimplePdf.text(
//                           controller.SONA.toString(),
//                           ttf,
//                           fontSize: 11,
//                           color: PdfColors.black,
//                         ),
//                         SimplePdf.spaceH(height: 4),
//                       ]),
//                 ),
//               ],
//             ),
//             controller.View_Tax_number_when_print_Invoices=='1'?Container(
//                 alignment: pw.Alignment.center,
//                 child: SimplePdf.text(controller.SVVL_TAX!='2'?'الرقم الضريبي)TAV(:  ''${ controller.SOTX.toString()} ':'',
//                     ttf,
//                   fontSize: 10,
//                   color: PdfColors.black,
//                 ),
//               ):Container(),
//             Container(
//               alignment: pw.Alignment.center,
//               child: SimplePdf.text(
//                   'العنوان : '
//                       '${ controller.SOAD.toString()} ',
//                   ttf,
//                 fontSize: 10,
//                 color: PdfColors.black,
//               ),
//             ),
//             // /// Simplified Tax Invoice
//             pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
//               pw.Container(
//                 margin: const pw.EdgeInsets.symmetric(vertical: 4),
//                   decoration: pw.BoxDecoration(
//                     color: PdfColor.fromHex("#ABABAB"),
//                     borderRadius: pw.BorderRadius.circular(5),
//                   ),
//                 child: SimplePdf.text(
//                   controller.SVVL_TAX != '2'
//                       ? controller.BCTX.toString() == 'null' || controller.BCTX.toString().isEmpty
//                       ? orderDetails.elementAt(0).BMKID == 4 || orderDetails.elementAt(0).BMKID == 12
//                       ? 'مردود فاتورة ضريبية  '
//                       'Return Tax Invoice  '
//                       :  controller.BMKID == 7 ? ' عرض سعر CQuotations  '
//                       : controller.BMKID == 10 ? ' طلب عميل Customer Orders  ':
//                   ' فاتورة ضريبية مبسطة  '
//                       ' Simplified Tax Invoice  '
//                       : orderDetails.elementAt(0).BMKID == 4 || orderDetails.elementAt(0).BMKID == 12
//                       ? 'مردود فاتورة ضريبية مبسطة  '
//                       'Return Simplified Tax Invoice  '
//                       :  controller.BMKID == 7 ? ' عرض سعر CQuotations  '
//                       : controller.BMKID == 10 ? ' طلب عميل Customer Orders  '
//                       : ' فاتورة ضريبية  '
//                       'Tax Invoice  '
//                       : controller.BMKID == 3 ? ' فاتورة مبيعات Sale Invoices  '
//                       : controller.BMKID == 1 ? ' فاتورة مشتريات Purchases Invoices  '
//                       : controller.BMKID == 5 ? ' فاتورة خدمات Service Bills  '
//                       : controller.BMKID == 7 ? ' عرض سعر CQuotations  '
//                       : controller.BMKID == 10 ? ' طلب عميل Customer Orders  '
//                       : controller.BMKID == 4 ? ' مردود مبيعات  Return Sale '
//                       : ' فاتورة مبيعات فورية Sale Invoices',
//                   ttf,
//                     fontSize: controller.BMKID==4 || controller.BMKID==12?9:10
//                 ),
//               ),
//             ]),
//             pw.Container(
//              // width: 100,
//               alignment: pw.Alignment.center,
//               padding: const pw.EdgeInsets.all(2),
//               child: SimplePdf.text(
//                 orderDetails.elementAt(0).BMMPR==1?
//                 'نسخة':'' , ttf,
//                 fontSize: 9,color: PdfColors.black,
//               ),
//             ),
//             Table(border: pw.TableBorder.all(), children: [
//               TableRow(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(right: 2,left: 1),
//                     child: Column(
//                         children: [
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SimplePdf.text('Invoice NO:', ttf,),
//                                 SimplePdf.text( ' ${orderDetails.elementAt(0).BMMNO.toString()} ', ttf),
//                                 SimplePdf.text('رقم الفاتورة: ', ttf,),
//                               ]),
//                           pw.Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SimplePdf.text('Invoice Date:', ttf,),
//                                 SimplePdf.text( ' ${orderDetails.elementAt(0).BMMDO.toString()} ', ttf,),
//                                 SimplePdf.text('تاريخ الفاتوره: ', ttf,),
//                               ]),
//                           pw.Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SimplePdf.text('Currency:', ttf),
//                                 SimplePdf.text( '${orderDetails.elementAt(0).SCNA_D.toString()}-${orderDetails.elementAt(0).PKNA_D.toString()}', ttf),
//                                 SimplePdf.text('العمله: ', ttf),
//                               ]),
//                         ]),
//                   ),
//                 ],
//               ),
//               // Now the next table row
//             ]),
//             SimplePdf.spaceH(height: 3),
//             controller.SVVL_TAX!='2'?
//             orderDetails.elementAt(0).BCID.toString()!='null'?pw.Table(border: pw.TableBorder.all(), children: [
//               pw.TableRow(
//                 children: [
//                   pw.Container(
//                     padding: const pw.EdgeInsets.only(right: 2,left: 1),
//                     child: SimplePdf.text('العميل Customer', ttf,),
//                   ),
//                 ],
//               ),
//               pw.TableRow(
//                 children: [
//                   pw.Container(
//                     padding: const pw.EdgeInsets.only(right: 2,left: 1),
//                     child: pw.Column( children: [
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                         SimplePdf.text('Name:', ttf,),
//                         SimplePdf.text( ' ${orderDetails.elementAt(0).BMMNA.toString()} ', ttf,),
//                         SimplePdf.text('الاسم: ', ttf,),
//                       ]),
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SimplePdf.text('Tax Number:', ttf,),
//                             SimplePdf.text( ' ${controller.BCTX.toString()=='null'?'':controller.BCTX.toString()}  ', ttf,),
//                             SimplePdf.text('الرقم الضريبي: ', ttf,),
//                           ]),
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                         SimplePdf.text('Address:', ttf,),
//                         //pw.Spacer(),
//                         SimplePdf.text( ' ${controller.BCAD.toString()=='null'?'':controller.BCAD.toString()} ', ttf,),
//                         //SimplePdf.spaceW(width: 13),
//                         SimplePdf.text('العنوان: ', ttf,),
//                       ]),
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SimplePdf.text('phone: ', ttf,),
//                             SimplePdf.text( ' ${controller.BCTL.toString()=='null'?'':controller.BCTL.toString()} ', ttf,),
//                             SimplePdf.text('هاتف:', ttf,),
//                           ]),
//                     ]),
//
//                   ),
//                 ],
//               )
//             ]):Container():
//             orderDetails.elementAt(0).BCID.toString()!='null'?
//             pw.Table(border: pw.TableBorder.all(), children: [
//               pw.TableRow(
//                 children: [
//                   pw.Container(
//                     padding: const pw.EdgeInsets.only(right: 2,left: 1),
//                    // width: 100,
//                     child: SimplePdf.text('العميل Customer', ttf,),
//                   ),
//                 ],
//               ),
//               pw.TableRow(
//                 children: [
//                   pw.Container(
//                     padding: const pw.EdgeInsets.only(right: 2,left: 1),
//                     child: pw.Column( children: [
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SimplePdf.text('Name:', ttf,),
//                             SimplePdf.text( ' ${orderDetails.elementAt(0).BMMNA.toString()} ', ttf,),
//                             SimplePdf.text('الاسم: ', ttf),
//                           ]),
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SimplePdf.text('Address:', ttf),
//                             SimplePdf.text( ' ${controller.BCAD.toString()=='null'?'':controller.BCAD.toString()} ', ttf),
//                             SimplePdf.text('العنوان: ', ttf),
//                           ]),
//                       pw.Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SimplePdf.text('phone: ', ttf,),
//                             SimplePdf.text( ' ${controller.BCTL.toString()=='null'?'':controller.BCTL.toString()} ', ttf,),
//                             SimplePdf.text('هاتف:', ttf,),
//                           ]),
//                     ]),
//                   ),
//                 ],
//               )
//             ]):Container(),
//             SimplePdf.spaceH(height: 3),
//            // data
//             StteingController().Show_BMDID==true?Table(border:
//             TableBorder.all(), columnWidths: {
//               0: const pw.FlexColumnWidth(1.4),
//               1: const pw.FlexColumnWidth(1),
//               2: const pw.FlexColumnWidth(1),
//               3: const pw.FlexColumnWidth(2.2),
//               4: const pw.FlexColumnWidth(0.3),
//             },
//                 children: [
//               pw.TableRow(decoration: pw.BoxDecoration(
//                 color: PdfColor.fromHex("#ABABAB")
//               ),
//                 children: [
//                   pw.Container(
//                  //   width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: pw.Column(children: [
//                       SimplePdf.text(
//                         'الإجمالي',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                       SimplePdf.text(
//                         controller.SVVL_TAX!='2'?'Total Vat':'Total',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                     ]),
//                   ),
//                   pw.Container(
//                    // width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: pw.Column(children: [
//                       SimplePdf.text(
//                         'الكمية',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                       SimplePdf.text(
//                         'Qty',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                     ]),
//                   ),
//                   pw.Container(
//                    // width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: pw.Column(children: [
//                       SimplePdf.text(
//                         'السعر',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                       SimplePdf.text(
//                         'Price',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                     ]),
//                   ),
//                   pw.Container(
//                   //  width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: pw.Column(children: [
//                       SimplePdf.text(
//                         'الصنف',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                       SimplePdf.text(
//                         'Item',
//                         ttf,
//                         fontSize: 8,
//                         color: PdfColors.black,
//                       ),
//                     ]),
//                   ),
//                   pw.Container(
//                     //  width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.only(top: 7),
//                     child: SimplePdf.text(
//                         '#',
//                         ttf,
//                         fontSize: 6.5,
//                         color: PdfColors.black,
//                       ),
//                   ),
//                 ],
//               ),
//               // Now the next table row
//             ]):
//             Table(border:
//             TableBorder.all(), columnWidths: {
//               0: const pw.FlexColumnWidth(1.4),
//               1: const pw.FlexColumnWidth(1),
//               2: const pw.FlexColumnWidth(1),
//               3: const pw.FlexColumnWidth(2.2),
//             },
//                 children: [
//                   pw.TableRow(decoration: pw.BoxDecoration(
//                       color: PdfColor.fromHex("#ABABAB")
//                   ),
//                     children: [
//                       pw.Container(
//                         //   width: 100,
//                         decoration: const pw.BoxDecoration(),
//                         padding: const pw.EdgeInsets.all(1),
//                         child: pw.Column(children: [
//                           SimplePdf.text(
//                             'الإجمالي',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                           SimplePdf.text(
//                             controller.SVVL_TAX!='2'?'Total Vat':'Total',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                         ]),
//                       ),
//                       pw.Container(
//                         // width: 100,
//                         decoration: const pw.BoxDecoration(),
//                         padding: const pw.EdgeInsets.all(1),
//                         child: pw.Column(children: [
//                           SimplePdf.text(
//                             'الكمية',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                           SimplePdf.text(
//                             'Qty',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                         ]),
//                       ),
//                       pw.Container(
//                         // width: 100,
//                         decoration: const pw.BoxDecoration(),
//                         padding: const pw.EdgeInsets.all(1),
//                         child: pw.Column(children: [
//                           SimplePdf.text(
//                             'السعر',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                           SimplePdf.text(
//                             'Price',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                         ]),
//                       ),
//                       pw.Container(
//                         //  width: 100,
//                         decoration: const pw.BoxDecoration(),
//                         padding: const pw.EdgeInsets.all(1),
//                         child: pw.Column(children: [
//                           SimplePdf.text(
//                             'الصنف',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                           SimplePdf.text(
//                             'Item',
//                             ttf,
//                             fontSize: 8,
//                             color: PdfColors.black,
//                           ),
//                         ]),
//                       ),
//                     ],
//                   ),
//                   // Now the next table row
//                 ]),
//             StteingController().Show_BMDID==true?Table(
//                  border: pw.TableBorder.all(),
//                  columnWidths: {
//                    0: const pw.FlexColumnWidth(1.4),
//                    1: const pw.FlexColumnWidth(1),
//                    2: const pw.FlexColumnWidth(1),
//                    3: const pw.FlexColumnWidth(2.2),
//                    4: const pw.FlexColumnWidth(0.3),
//                  },
//                  children: List.generate(controller.InvoiceList.length, (index) {
//                        Bil_Mov_D_Local product = controller.InvoiceList[index];
//                    return pw.TableRow(
//                      children: [
//                        pw.Container(
//                     //     width: 120,
//                          alignment: pw.Alignment.center,
//                          padding: const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                          child: SimplePdf.text(
//                              controller.formatter.format(controller.roundDouble(((product.BMDAM!-product.BMDDI!)*product.BMDNO!)+product.BMDTXT1!,controller.SCSFL)).toString(),
//                              ttf,
//                              fontSize: 8),
//                        ),
//                        pw.Container(
//                          alignment: pw.Alignment.center,
//                          padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                          child: SimplePdf.text("${controller.formatter.format((product.BMDNO! + product.BMDNF!))} ${product.MUNA_D}".toString() , ttf,
//                              fontSize: 8),
//                        ),
//                        pw.Container(
//                          alignment: pw.Alignment.center,
//                          padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                          child: SimplePdf.text(
//                              controller.formatter.format(product.BMDAM).toString() , ttf,
//                              fontSize: 8),
//                        ),
//                        pw.Container(
//                          alignment: pw.Alignment.center,
//                          padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                          child: SimplePdf.text(
//                            StteingController().Show_MINO==true?
//                            product.NAM_D.toString() : product.MINA_D.toString(),
//                            ttf, fontSize: 8,color: PdfColors.black,
//                          ),
//                        ),
//                        pw.Container(
//                          alignment: pw.Alignment.center,
//                          padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                          child: SimplePdf.text(
//                            product.BMDID.toString(), ttf,
//                            fontSize: 6.5,color: PdfColors.black,
//                          ),
//                        ),
//                      ],
//                    );
//                  })):
//             Table(
//                 border: pw.TableBorder.all(),
//                 columnWidths: {
//                   0: const pw.FlexColumnWidth(1.4),
//                   1: const pw.FlexColumnWidth(1),
//                   2: const pw.FlexColumnWidth(1),
//                   3: const pw.FlexColumnWidth(2.2),
//                 },
//                 children: List.generate(controller.InvoiceList.length, (index) {
//                   Bil_Mov_D_Local product = controller.InvoiceList[index];
//                   return pw.TableRow(
//                     children: [
//                       pw.Container(
//                         //     width: 120,
//                         alignment: pw.Alignment.center,
//                         padding: const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                             controller.formatter.format(controller.roundDouble(((product.BMDAM!-product.BMDDI!)*product.BMDNO!)+product.BMDTXT1!,controller.SCSFL)).toString(),
//                             ttf,
//                             fontSize: 8),
//                       ),
//                       pw.Container(
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text("${controller.formatter.format((product.BMDNO! + product.BMDNF!))} ${product.MUNA_D}".toString() , ttf,
//                             fontSize: 8),
//                       ),  pw.Container(
//                         // width: 100,
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(controller.formatter.format(product.BMDAM).toString() , ttf, fontSize: 8),
//                       ),
//                       pw.Container(
//                         // width: 100,
//                         alignment: pw.Alignment.center,
//                         padding:  const pw.EdgeInsets.only(top: 2,bottom: 2,right: 1,left: 1),
//                         child: SimplePdf.text(
//                           StteingController().Show_MINO==true?
//                           product.NAM_D.toString()
//                               : product.MINA_D.toString(),
//                           ttf, fontSize: 8,color: PdfColors.black,
//                         ),
//                       ),
//                     ],
//                   );
//                 })),
//             SimplePdf.spaceH(height: 5),
//             controller.SVVL_TAX!='2'? Table(columnWidths:
//             {
//               0: const pw.FlexColumnWidth(2),
//               1: const pw.FlexColumnWidth(2),
//               2: const pw.FlexColumnWidth(4),
//             }, children: [
//               pw.TableRow(
//                 children: [
//                   pw.Container(
//                   //  width: 100,
//                     alignment: pw.Alignment.centerLeft,
//                     child: SimplePdf.text('Total not VAT', ttf, fontSize: 8.5),
//                   ),
//                   pw.Container(
//                     //width: 100,
//                     alignment: pw.Alignment.center,
//                     child: SimplePdf.text(
//                     controller.formatter.format(controller.roundDouble(orderDetails.elementAt(0).BMMAM!- orderDetails.elementAt(0).BMMTX!,controller.SCSFL)).toString(),
//                          ttf, fontSize: 8.5),
//                   ),
//                   pw.Container(
//                    // width: 100,
//                     alignment: pw.Alignment.centerRight,
//                     child: SimplePdf.text('اجمالي )غير شامل الضريبه(', ttf, fontSize: 8.5),
//                   ),
//                 ],
//               ),
//               orderDetails.elementAt(0).BMMDIF!>0?pw.TableRow(
//                 children: [
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Discount', ttf, fontSize: 8.5),
//                   ),
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter.format(orderDetails.elementAt(0).BMMDIF).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('تخفيض للمجاني', ttf, fontSize: 8.5),
//                   ),
//                 ],
//               ):TableRow(children: [
//               ]),
//               orderDetails.elementAt(0).BMMDI!+orderDetails.elementAt(0).BMMDIA!>0?pw.TableRow(
//                 children: [
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Total Discount', ttf, fontSize: 8.5),
//                   ),
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter.format(orderDetails.elementAt(0).BMMDI!+orderDetails.elementAt(0).BMMDIA!).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('خصومات', ttf, fontSize: 8.5),
//                   ),
//                 ],
//               ):TableRow(children: []),
//               orderDetails.elementAt(0).TTID2.toString()!='null' && orderDetails.elementAt(0).BMMTX2!>0?TableRow(
//                 children: [
//                   Container(
//                    // width: 100,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Excise tax', ttf, fontSize: 8.5),
//                   ),
//                   Container(
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                     controller.formatter.format(orderDetails.elementAt(0).BMMTX2).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   Container(
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('مجموع الضريبه الانتقائيه', ttf,
//                         fontSize:controller.SVVL_TAX == '5'? 8.1:8.5),
//                   ),
//                 ],
//               )
//                   :TableRow(children: []),
//               TableRow(
//                 children: [
//                   Container(
//                    // width: 100,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Total VAT', ttf, fontSize: 8.5),
//                   ),
//                   Container(
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                     controller.formatter.format(orderDetails.elementAt(0).BMMTX1).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   Container(
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('مجموع ضريبه القيمه المضافه', ttf,
//                         fontSize:controller.SVVL_TAX == '5'? 8.1:8.5),
//                   ),
//                 ],
//               ),
//               pw.TableRow(
//                 decoration: const pw.BoxDecoration(),
//                 children: [
//                   pw.Container(
//                   //  width: 100,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                       'Net Total',
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   pw.Container(
//                   //  width: 100,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                     controller.formatter.format(orderDetails.elementAt(0).BMMMT).toString(),
//                       ttf,
//                       fontSize: 8.5,
//                     ),
//                   ),
//                   pw.Container(
//                   //  width: 100,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                       'الاجمالي شامل الضريبة',
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ]):
//             Table(
//                 columnWidths: {
//                   0: const pw.FlexColumnWidth(2),
//                   1: const pw.FlexColumnWidth(2),
//                   2: const pw.FlexColumnWidth(4),
//                 }, children: [
//               orderDetails.elementAt(0).BMMDIF!>0?TableRow(
//                 children: [
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Discount', ttf, fontSize: 8),
//                   ),
//                   pw.Container(
//                     //width: 80,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter.format(orderDetails.elementAt(0).BMMDIF).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('تخفيض للمجاني', ttf, fontSize: 8.5),
//                   ),
//                 ],
//               ):TableRow(children: []),
//               orderDetails.elementAt(0).BMMDI!+orderDetails.elementAt(0).BMMDIA!>0?TableRow(
//                 children: [
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('Total discount', ttf, fontSize: 8.5),
//                   ),
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                     controller.formatter.format(orderDetails.elementAt(0).BMMDI!+orderDetails.elementAt(0).BMMDIA!).toString(), ttf,
//                         fontSize: 8.5),
//                   ),
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('خصومات', ttf, fontSize: 8.5),
//                   ),
//                 ],
//               )
//                   :TableRow(children: []),
//               pw.TableRow(
//                 decoration: const pw.BoxDecoration(),
//                 children: [
//                   pw.Container(
//                    // width: 80,
//                     alignment: pw.Alignment.centerLeft,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                       'Total',
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.center,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                     controller.formatter.format(orderDetails.elementAt(0).BMMAM).toString(),
//                       ttf,
//                       fontSize: 8.5,
//                     ),
//                   ),
//                   pw.Container(
//                   //  width: 80,
//                     alignment: pw.Alignment.centerRight,
//                     padding:  const pw.EdgeInsets.only(top: 2,bottom: 3),
//                     child: SimplePdf.text(
//                       'الاجمالي',
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//             StteingController().Print_Balance==true && controller.Print_Balance!='1' && orderDetails.elementAt(0).BMKID!=1
//                 && orderDetails.elementAt(0).PKID==3 && orderDetails.elementAt(0).BCID!='null'
//                 ? Row( mainAxisAlignment: MainAxisAlignment.start ,
//                 children: <pw.Widget>[
//                   SimplePdf.text(" ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                       "${'StringAmount_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT).toString()}"
//                       "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT!+controller.BACBA!).toString()}",
//                     ttf, fontSize: 7, align: TextAlign.center, color: PdfColors.black,)]):Container(),
//             StteingController().Print_Balance==true && controller.Print_Balance!='1' && orderDetails.elementAt(0).BMKID!=1
//                 && orderDetails.elementAt(0).PKID==3 && orderDetails.elementAt(0).BCID!='null'
//                 ? Divider(height: 0.3):Container(),
//             Divider(height: 0.5),
//             Row(
//               mainAxisAlignment: pw.MainAxisAlignment.end,
//               children: <pw.Widget>[
//                 SimplePdf.text("${controller.CountRecodeController.text}", ttf, fontSize: 8),
//                 SimplePdf.spaceW(width: 4),
//                 SimplePdf.text("${'StrinCount_MINO2'.tr}", ttf, fontSize: 8),
//                 SimplePdf.spaceW(width: 45),
//                 SimplePdf.text("${controller.formatter.format(double.parse(controller.COUNTBMDNOController.text))}", ttf, fontSize: 8),
//                 SimplePdf.spaceW(width: 4),
//                 SimplePdf.text("${'StringSUMSNNORep2'.tr}", ttf, fontSize: 8),
//                 SimplePdf.spaceW(width: 35),
//               ],
//             ),
//             pw.Container(
//               child: SimplePdf.text(controller.SDDDA, ttf,
//                 color: PdfColors.black,
//               ),
//             ),
//             controller.SVVL_TAX!='2'?   pw.Container(
//               alignment: pw.Alignment.center,
//                 child: Container(
//                   width: 70,
//                   height: 70,
//                   padding:  const pw.EdgeInsets.only(top: 2,bottom: 4),
//                   child: pw.BarcodeWidget(
//                     color: PdfColor.fromHex("#000000"),
//                     barcode: pw.Barcode.qrCode(),
//                     data: qrData,
//                   ),
//                 ),
//             ):Container(),
//             Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: <pw.Widget>[
//                 SimplePdf.text('المستخدم: ${LoginController().SUNA}', ttf, fontSize: 7),
//                 SimplePdf.text('تاريخ الطباعه: ${DateFormat('dd-MM-yyyy HH:m').format(DateTime.now())}', ttf, fontSize: 7),
//               ],
//             ),
//             controller.SUMO!='null'? Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <pw.Widget>[
//                 SimplePdf.text('تلفون: ${controller.SUMO}', ttf, fontSize: 7),
//               ],
//             ):Container(),
//           ],
//         ):
//             Column(children: [
//             Table( children: [
//               TableRow(
//                 children: [
//                   Column(children: [
//                     StteingController().Print_Image == true
//                         ? Container(
//                         width: 50.w, child: Image(image))
//                         : Container(),
//                     LoginController().experimentalcopy == 1
//                         ? pw.Image(image, height: 55, width: 55)
//                         : Container(),
//                     SimplePdf.text(
//                       controller.SONA.toString(),
//                       ttf,
//                       fontSize: 12,
//                       color: PdfColors.black,
//                     ),
//                     controller.View_Tax_number_when_print_Invoices == '1'
//                         ? Container(
//                       alignment: Alignment.center,
//                       child: SimplePdf.text(
//                         controller.SVVL_TAX != '2'
//                             ? 'الرقم الضريبي)TAV(:  ${controller.SOTX.toString()} '
//                             : '',
//                         ttf,
//                         fontSize: 11,
//                         color: PdfColors.black,
//                       ),
//                     )
//                         : Container(),
//                     SimplePdf.text('StringAddress'.tr+' : '+ '${controller.SOAD.toString() == 'null' ? '' : controller.SOAD.toString()} ',
//                       ttf,
//                       fontSize: 11,
//                       color: PdfColors.black,
//                     ),
//                     Container(
//                       margin: const pw.EdgeInsets.symmetric(
//                           vertical: 4),
//                       decoration: pw.BoxDecoration(
//                         color: PdfColor.fromHex("#ABABAB"),
//                         borderRadius: pw.BorderRadius.circular(5),
//                       ),
//                       child:SimplePdf.text(
//                         controller.SVVL_TAX != '2'
//                             ? controller.BCTX.toString() == 'null' || controller.BCTX.toString().isEmpty
//                             ? orderDetails.elementAt(0).BMKID == 4 || orderDetails.elementAt(0).BMKID == 12
//                             ? 'مردود فاتورة ضريبية  '
//                             : controller.BMKID == 7
//                             ? 'StringQuotations'.tr
//                             : controller.BMKID == 10
//                             ? 'StringCustomer_Requests'.tr
//                             : 'StringSimplifiedTaxInvoicee'.tr
//                             : orderDetails.elementAt(0).BMKID == 4 ||
//                             orderDetails.elementAt(0).BMKID == 12
//                             ? 'مردود فاتورة ضريبية مبسطة  '
//                             : controller.BMKID == 7
//                             ? 'StringQuotations'.tr
//                             : controller.BMKID == 10
//                             ? 'StringCustomer_Requests'.tr
//                             : 'String_Tax_Invoice'.tr
//                             : controller.BMKID == 3
//                             ? 'StringSalesInvoices'.tr
//                             : controller.BMKID == 1
//                             ? 'StringPurchases_Invoices'.tr
//                             : controller.BMKID == 4
//                             ? 'StringReturn_Sale'.tr
//                             : controller.BMKID == 7
//                             ? 'StringQuotations'.tr
//                             : controller.BMKID == 10
//                             ? 'StringCustomer_Requests'.tr
//                             : 'StringPOSInvoice'.tr,
//                         ttf,
//                         fontSize: 11,
//                       ),
//                     ),
//                   ]),
//                 ],
//               ),
//             ]),
//             Table(border: pw.TableBorder.all(), children: [
//               TableRow(
//                 children: [
//                   Row(children: [
//                     Table(border: pw.TableBorder.all(), children: [
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 140,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 orderDetails
//                                     .elementAt(0)
//                                     .BMMNO
//                                     .toString(),
//                                 ttf,
//                                 align: TextAlign.center,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 140,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 orderDetails.elementAt(0).BMMDO.toString(),
//                                 ttf,
//                                 align: TextAlign.center,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 140,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 '${orderDetails.elementAt(0).SCNA_D.toString()}-${orderDetails.elementAt(0).PKNA_D.toString()}',
//                                 ttf,
//                                 align: TextAlign.center,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       // Now the next table row
//                     ]),
//                     Table(border: pw.TableBorder.all(), children: [
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 82,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 '  '+'StringInvoiceNO'.tr,
//                                 ttf,
//                                 align: TextAlign.right,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 82,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 '  '+'StringInvoiceDate'.tr,
//                                 ttf,
//                                 align: TextAlign.right,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       TableRow(
//                         children: [
//                           Container(
//                               width: 82,
//                               decoration: const BoxDecoration(),
//                               padding: const EdgeInsets.all(1),
//                               child: SimplePdf.text(
//                                 '  '+'StringSCIDlableText'.tr,
//                                 ttf,
//                                 align: TextAlign.right,
//                                 fontSize: 9,
//                                 color: PdfColors.black,
//                               )),
//                         ],
//                       ),
//                       // Now the next table row
//                     ]),
//                   ]),
//                 ],
//               ),
//             ]),
//             SimplePdf.spaceH(height: 3),
//               //بيانات العميل
//               orderDetails.elementAt(0).BCID!='null' && orderDetails.elementAt(0).BCID!=null?
//             Table(border: TableBorder.all(),
//                   children: [
//                     TableRow(
//                       decoration: BoxDecoration(
//                           color: PdfColor.fromHex("#ABABAB")
//                       ),
//                       children: [
//                         pw.Container(
//                           padding: const pw.EdgeInsets.only(
//                               right: 2, left: 1),
//                           child: SimplePdf.text(
//                             'بيانات العميل',
//                             ttf,
//                             fontSize: 9,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ]):Container(),
//             controller.SVVL_TAX != '2'
//                 ? orderDetails.elementAt(0).BCID.toString() != 'null'
//                 ? Table(border: pw.TableBorder.all(), children: [
//                      TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     orderDetails
//                                         .elementAt(0)
//                                         .BMMNA
//                                         .toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ),
//                         ]),
//                     Table(
//                         children: [
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringBMMNA'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ),
//                         ]),
//                   ]),
//                 ],
//               ),
//                      TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           controller.BCTX.toString() != 'null' && controller.BCTX.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     controller.BCTX
//                                         .toString() ==
//                                         'null'
//                                         ? ''
//                                         : controller.BCTX
//                                         .toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           controller.BCTX.toString() != 'null' && controller.BCTX.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringTaxnumber'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                   ]),
//                 ],
//               ),
//                      TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           controller.BCAD.toString() != 'null' && controller.BCAD.isNotEmpty?
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     controller.BCAD.toString() == 'null'
//                                         ? '' : controller.BCAD.toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           controller.BCAD.toString() != 'null' && controller.BCAD.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringAddress'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                   ]),
//                 ],
//               ),
//                      TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           controller.BCTL.toString() != 'null' && controller.BCTL.isNotEmpty?
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     controller.BCTL
//                                         .toString() ==
//                                         'null'
//                                         ? ''
//                                         : controller.BCTL
//                                         .toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           controller.BCTL.toString() != 'null' && controller.BCTL.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration: const BoxDecoration(),
//                                   padding: const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringPhone'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                   ]),
//                 ],
//               ),
//             ])
//                 : Container()
//                 : orderDetails.elementAt(0).BCID.toString() != 'null'
//                 ? Table(border: TableBorder.all(), children: [
//               TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     orderDetails
//                                         .elementAt(0)
//                                         .BMMNA
//                                         .toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringBMMNA'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ),
//                         ]),
//                   ]),
//                 ],
//               ),
//               TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           controller.BCAD.toString() != 'null' && controller.BCAD.isNotEmpty?
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     controller.BCAD.toString() == 'null'
//                                         ? '' : controller.BCAD.toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           controller.BCAD.toString() != 'null' && controller.BCAD.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringAddress'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                   ]),
//                 ],
//               ),
//               TableRow(
//                 children: [
//                   Row(children: [
//                     Table(
//                         border: pw.TableBorder(right: BorderSide( width: 1),),
//                         children: [
//                           controller.BCTL.toString() != 'null' && controller.BCTL.isNotEmpty?
//                           TableRow(
//                             children: [
//                               Container(
//                                   width: 140,
//                                   decoration:
//                                   const BoxDecoration(),
//                                   padding:
//                                   const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     controller.BCTL
//                                         .toString() ==
//                                         'null'
//                                         ? ''
//                                         : controller.BCTL
//                                         .toString(),
//                                     ttf,
//                                     align: TextAlign.center,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                     Table(
//                         children: [
//                           controller.BCTL.toString() != 'null' && controller.BCTL.isNotEmpty
//                               ?TableRow(
//                             children: [
//                               Container(
//                                   width: 82,
//                                   decoration: const BoxDecoration(),
//                                   padding: const EdgeInsets.all(1),
//                                   child: SimplePdf.text(
//                                     '  '+'StringPhone'.tr,
//                                     ttf,
//                                     align: TextAlign.right,
//                                     fontSize: 9,
//                                     color: PdfColors.black,
//                                   )),
//                             ],
//                           ):TableRow(children: []),
//                           // Now the next table row
//                         ]),
//                   ]),
//                 ],
//               ),
//             ])
//                 : Container(),
//             SimplePdf.spaceH(height: 3),
//             // data
//             StteingController().Show_BMDID == true
//                 ? Table(border: TableBorder.all(), columnWidths: {
//               0: const pw.FlexColumnWidth(1.4),
//               1: const pw.FlexColumnWidth(1),
//               2: const pw.FlexColumnWidth(1),
//               3: const pw.FlexColumnWidth(2.2),
//               4: const pw.FlexColumnWidth(0.3),
//             },
//                 children: [
//               TableRow(
//                 decoration: BoxDecoration(
//                     color: PdfColor.fromHex("#ABABAB")),
//                 children: [
//                   Container(
//                     //  width: 100,
//                     decoration: const BoxDecoration(),
//                     padding: const EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StrinCount_BMDAMC'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(),
//                     padding: const EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StringPrice'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(),
//                     padding: const EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StrinlChice_item_QUANTITY'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(),
//                     padding: const EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StringMINO'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     //  width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.only(top: 6),
//                     child: SimplePdf.text(
//                       '#',
//                       ttf,
//                       fontSize: 6,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//
//               ///data Rows
//               // Now the next table row
//             ])
//                 : Table(border: TableBorder.all(), columnWidths: {
//               0: const pw.FlexColumnWidth(1.4),
//               1: const pw.FlexColumnWidth(1),
//               2: const pw.FlexColumnWidth(1),
//               3: const pw.FlexColumnWidth(2.2),
//             },
//                 children: [
//               TableRow(
//                 decoration: BoxDecoration(color: PdfColor.fromHex("#ABABAB")),
//                 children: [
//                   Container(
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StrinCount_BMDAMC'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StringPrice'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     decoration: const BoxDecoration(),
//                     padding: const EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StrinlChice_item_QUANTITY'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                   Container(
//                     //  width: 100,
//                     decoration: const pw.BoxDecoration(),
//                     padding: const pw.EdgeInsets.all(1),
//                     child: SimplePdf.text(
//                       'StringMINO'.tr,
//                       ttf,
//                       fontSize: 8.5,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//
//               ///data Rows
//               // Now the next table row
//             ]),
//             StteingController().Show_BMDID == true
//                 ? Table(
//                 border: pw.TableBorder.all(),
//                 columnWidths: {
//                   0: const pw.FlexColumnWidth(1.4),
//                   1: const pw.FlexColumnWidth(1),
//                   2: const pw.FlexColumnWidth(1),
//                   3: const pw.FlexColumnWidth(2.2),
//                   4: const pw.FlexColumnWidth(0.3),
//                 },
//                 children: List.generate(
//                     controller.InvoiceList.length, (index) {
//                   Bil_Mov_D_Local product =
//                   controller.InvoiceList[index];
//                   return pw.TableRow(
//                     children: [
//                       Container(
//                         //  width: 100,
//                         alignment: Alignment.center,
//                         padding: const pw.EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(controller.formatter.format(controller.roundDouble(
//                                 ((product.BMDAM! - product.BMDDI!) * product.BMDNO!) + product.BMDTXT1!, controller.SCSFL)).toString(),
//                             ttf, fontSize: 8.5),
//                       ),
//                       Container(
//                         // width: 100,
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(
//                             controller.formatter
//                                 .format(product.BMDAM)
//                                 .toString(),
//                             ttf,
//                             fontSize: 8.5),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text("${controller.formatter.format((product.BMDNO! + product.BMDNF!))} ${product.MUNA_D}".toString(),
//                             ttf, fontSize: 8.5),
//                       ),
//                       Container(
//                         //  width: 100,
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(
//                           StteingController().Show_MINO == true
//                               ? product.NAM_D.toString()
//                               : product.MINA_D.toString(),
//                           ttf, fontSize: 8.5,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(
//                           product.BMDID.toString(),
//                           ttf,
//                           fontSize: 6,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                     ],
//                   );
//                 }))
//                 : Table(
//                 border: pw.TableBorder.all(),
//                 columnWidths: {
//                   0: const pw.FlexColumnWidth(1.4),
//                   1: const pw.FlexColumnWidth(1),
//                   2: const pw.FlexColumnWidth(1),
//                   3: const pw.FlexColumnWidth(2.2),
//                 },
//                 children: List.generate(
//                     controller.InvoiceList.length, (index) {
//                   Bil_Mov_D_Local product = controller.InvoiceList[index];
//                   return TableRow(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(
//                             controller.formatter.format(controller.roundDouble(
//                                 ((product.BMDAM! - product.BMDDI!) * product.BMDNO!) + product.BMDTXT1!,
//                                 controller.SCSFL)).toString(),
//                             ttf,
//                             fontSize: 8.5),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(controller.formatter.format(product.BMDAM).toString(),
//                             ttf, fontSize: 8.5),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text("${controller.formatter.format((product.BMDNO! + product.BMDNF!))} ${product.MUNA_D}".toString(),
//                             ttf, fontSize: 8.5),
//                       ),
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(
//                             top: 2, bottom: 2, right: 1, left: 1),
//                         child: SimplePdf.text(
//                           StteingController().Show_MINO == true
//                               ? product.NAM_D.toString()
//                               : product.MINA_D.toString(),
//                           ttf, fontSize: 8.5, color: PdfColors.black,
//                         ),
//                       ),
//                     ],
//                   );
//                 })),
//             SimplePdf.spaceH(height: 5),
//             controller.SVVL_TAX != '2'
//                 ? Table(columnWidths: {
//               0: const pw.FlexColumnWidth(3),
//               1: const pw.FlexColumnWidth(8),
//             },
//                 children: [
//               TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(controller.roundDouble(
//                             orderDetails.elementAt(0).BMMAM! -
//                                 orderDetails
//                                     .elementAt(0)
//                                     .BMMTX!,
//                             controller.SCSFL))
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     child: SimplePdf.text(
//                         'اجمالي )غير شامل الضريبه القيمه المضافة(',
//                         ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               ),
//               orderDetails.elementAt(0).BMMDI! +
//                   orderDetails.elementAt(0).BMMDIA! >
//                   0
//                   ? pw.TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(orderDetails
//                             .elementAt(0)
//                             .BMMDI! +
//                             orderDetails
//                                 .elementAt(0)
//                                 .BMMDIA!)
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('خصومات', ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               )
//                   : TableRow(children: []),
//               orderDetails.elementAt(0).BMMDIF! > 0
//                   ? pw.TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(orderDetails
//                             .elementAt(0)
//                             .BMMDIF)
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: pw.Alignment.centerRight,
//                     padding:
//                     const pw.EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         'تخفيض للمجاني', ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               )
//                   : TableRow(children: []),
//                   orderDetails.elementAt(0).TTID2.toString()!='null' && orderDetails.elementAt(0).BMMTX2!>0?
//                   TableRow(
//                     children: [
//                       Container(
//                         alignment: Alignment.center,
//                         padding: const EdgeInsets.only(top: 2),
//                         child: SimplePdf.text(
//                             controller.formatter
//                                 .format(
//                                 orderDetails.elementAt(0).BMMTX2)
//                                 .toString(),
//                             ttf,
//                             fontSize: 9),
//                       ),
//                       Container(
//                         alignment: Alignment.centerRight,
//                         padding: const EdgeInsets.only(top: 2),
//                         child: SimplePdf.text(
//                             'مجموع الضريبه الانتقائيه',
//                             ttf,
//                             fontSize: 9),
//                       ),
//                     ],
//                   ) : TableRow(children: []),
//               TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(
//                             orderDetails.elementAt(0).BMMTX1)
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         'مجموع ضريبه القيمه المضافه',
//                         ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               ),
//               TableRow(
//                 decoration: const BoxDecoration(),
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding:
//                     const EdgeInsets.only(top: 2, bottom: 3),
//                     child: SimplePdf.text(
//                       controller.formatter
//                           .format(orderDetails.elementAt(0).BMMMT)
//                           .toString(),
//                       ttf,
//                       fontSize: 9,
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding:
//                     const EdgeInsets.only(top: 2, bottom: 3),
//                     child: SimplePdf.text(
//                       'الاجمالي شامل الضريبة',
//                       ttf,
//                       fontSize: 9,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ])
//                 : Table(columnWidths: {
//               0: const pw.FlexColumnWidth(3),
//               1: const pw.FlexColumnWidth(8),
//             }, children: [
//               orderDetails.elementAt(0).BMMDIF! > 0
//                   ? TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(orderDetails
//                             .elementAt(0)
//                             .BMMDIF)
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         'تخفيض للمجاني', ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               )
//                   : TableRow(children: []),
//               orderDetails.elementAt(0).BMMDI! +
//                   orderDetails.elementAt(0).BMMDIA! >
//                   0
//                   ? TableRow(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text(
//                         controller.formatter
//                             .format(orderDetails
//                             .elementAt(0)
//                             .BMMDI! +
//                             orderDetails
//                                 .elementAt(0)
//                                 .BMMDIA!)
//                             .toString(),
//                         ttf,
//                         fontSize: 9),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding: const EdgeInsets.only(top: 2),
//                     child: SimplePdf.text('خصومات', ttf,
//                         fontSize: 9),
//                   ),
//                 ],
//               )
//                   : TableRow(children: []),
//               TableRow(
//                 decoration: const BoxDecoration(),
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     padding:
//                     const EdgeInsets.only(top: 2, bottom: 3),
//                     child: SimplePdf.text(
//                       controller.formatter
//                           .format(orderDetails.elementAt(0).BMMAM)
//                           .toString(),
//                       ttf,
//                       fontSize: 9,
//                     ),
//                   ),
//                   Container(
//                     alignment: Alignment.centerRight,
//                     padding:
//                     const EdgeInsets.only(top: 2, bottom: 3),
//                     child: SimplePdf.text(
//                       'الاجمالي',
//                       ttf,
//                       fontSize: 9,
//                       color: PdfColors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//             orderDetails.elementAt(0).PKID == 3 && orderDetails.elementAt(0).BMMCP.toString()!='null' &&
//                 orderDetails.elementAt(0).BMMCP! > 0
//                 ? Table(border: pw.TableBorder.all(), children: [
//               TableRow(
//                 children: [
//                   Container(
//                     padding: const pw.EdgeInsets.only(right: 2, left: 1),
//                     child: Column(children: [
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SimplePdf.text('اجل', ttf, fontSize: 8.5,),
//                             SimplePdf.text('نقدا', ttf, fontSize: 8.5,),
//                           ]),
//                       Divider(height: 0.3),
//                       Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SimplePdf.text('${controller.formatter.format(orderDetails.elementAt(0).BMMMT!-orderDetails.elementAt(0).BMMCP!).toString()}', ttf, fontSize:8.5,),
//                             SimplePdf.text(' ${controller.formatter.format(orderDetails.elementAt(0).BMMCP).toString()} ', ttf, fontSize: 8.5,),
//                           ]),
//                     ]),
//                   ),
//                 ],
//               ),
//             ])
//                 : Container(),
//             StteingController().Print_Balance == true &&
//                 controller.Print_Balance != '1' &&
//                 orderDetails.elementAt(0).BMKID != 1 &&
//                 orderDetails.elementAt(0).PKID == 3 &&
//                 orderDetails.elementAt(0).BCID != 'null'
//                 ? Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   SimplePdf.text(
//                     orderDetails.elementAt(0).BMMCP.toString()!='null' && orderDetails.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                         || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT! + controller.BACBA!).toString()}"
//                         " ${'StringBMMCP'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMCP).toString()}":
//                     " ${'StringLast_Balance_Print'.tr} ${controller.BACBA}"
//                         "${'StringAmount_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT).toString()}"
//                         "${'StringTotal_Am_Print'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMMT! + controller.BACBA!).toString()}",
//                     ttf,
//                     fontSize: orderDetails.elementAt(0).BMMCP.toString()!='null' && orderDetails.elementAt(0).BMMCP!>0?6.5:7.5,
//                     align: TextAlign.center,
//                     color: PdfColors.black,
//                   )
//                 ])
//                  :orderDetails.elementAt(0).BMMCP.toString()!='null' && orderDetails.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                 || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                 Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   SimplePdf.text(
//                     " ${'StringBMMCP'.tr} ${controller.formatter.format(orderDetails.elementAt(0).BMMCP).toString()}",
//                     ttf,
//                     fontSize: 7.5,
//                     align: TextAlign.center,
//                     color: PdfColors.black,
//                   )
//                 ])
//                 :  Container(),
//             StteingController().Print_Balance == true &&
//                 controller.Print_Balance != '1' &&
//                 orderDetails.elementAt(0).BMKID != 1 &&
//                 orderDetails.elementAt(0).PKID == 3 &&
//                 orderDetails.elementAt(0).BCID != 'null'
//                 ? Divider(height: 0.3)
//                 :orderDetails.elementAt(0).BMMCP.toString()!='null' && orderDetails.elementAt(0).BMMCP!>0 && ((controller.BMKID==11 && controller.PRINT_PAY_RET=='1')
//                 || ((controller.BMKID==3 || controller.BMKID==5) && controller.PRINT_PAY=='1'))?
//                  Divider(height: 0.3)
//                 : Container(),
//               Divider(height: 0.5),
//               Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.end,
//                 children: <pw.Widget>[
//                   SimplePdf.text("${controller.CountRecodeController.text}", ttf, fontSize: 8),
//                   SimplePdf.spaceW(width: 4),
//                   SimplePdf.text("${'StrinCount_MINO2'.tr}", ttf, fontSize: 8),
//                   SimplePdf.spaceW(width: 45),
//                   SimplePdf.text("${controller.formatter.format(double.parse(controller.COUNTBMDNOController.text))}", ttf, fontSize: 8),
//                   SimplePdf.spaceW(width: 4),
//                   SimplePdf.text("${'StringSUMSNNORep2'.tr}", ttf, fontSize: 8),
//                   SimplePdf.spaceW(width: 35),
//                 ],
//               ),
//             Container(
//               padding: const EdgeInsets.only(top: 2, bottom: 3),
//               child: SimplePdf.text(
//                 controller.SDDDA,
//                 ttf,
//                 fontSize: 9,
//                 color: PdfColors.black,
//               ),
//             ),
//             controller.SVVL_TAX != '2'
//                 ? Container(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 70,
//                 height: 70,
//                 child: BarcodeWidget(
//                   color: PdfColor.fromHex("#000000"),
//                   barcode: pw.Barcode.qrCode(),
//                   data: qrData,
//                 ),
//               ),
//             )
//                 : Container(),
//             Row(
//               mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//               children: <pw.Widget>[
//                 SimplePdf.text('StrinUser'.tr+' ${LoginController().SUNA}', ttf,
//                     fontSize: 7.5),
//                 SimplePdf.text('StringDateofPrinting'.tr+': '+'${DateFormat('dd-MM-yyyy HH:m').format(DateTime.now())}', ttf,
//                     fontSize: 7.5),
//               ],
//             ),
//               controller.SUMO != 'null' && controller.SUMO.toString().isNotEmpty
//                 ? Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <pw.Widget>[
//                 SimplePdf.text('StringPhone'.tr+': '+'${controller.SUMO}', ttf,
//                     fontSize: 7.5),
//               ],
//             )
//                 : Container(),
//             SimplePdf.text(
//               ' ',
//               ttf,
//               fontSize: 3,
//               color: PdfColors.black,
//             )
//           ],
//         );
//       },
//     ),
//   );
//
//   List<int> bytes = await pdf.save();
//
//   FileHelper.share(
//     msg: "iiiiiiiiii",
//       mode: mode,
//       bytes: bytes,
//       fileName: 'Invoice - ${orderDetails.elementAt(0).BMMNO}.pdf',
//       BMMID: orderDetails.elementAt(0).BMMID!);
//
//    } catch (e) {
//      Fluttertoast.showToast(
//          msg:e.toString(),
//          toastLength: Toast.LENGTH_LONG,
//          textColor: ma.Colors.white,
//          backgroundColor: ma.Colors.redAccent);
//      print(e.toString());
//    }
//
// }