// import 'dart:io';
// import '../../PrintFile/share_mode.dart';
// import '../../PrintFile/simple_pdf.dart';

// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/widgets.dart';
// import '../../data/model/master_model.dart';
// import '../invoice_controller.dart';
// import 'file_helper.dart';

// taxTikcetReport58({
//   required Master orderDetails,
//   String? msg,
//   required ShareMode mode,
//   // required UserTaxInfo userTaxInfo,
//   // required InvoiceSetting invoiceSetting,
// }) async {
//   //try {

//     // String qrData = await InvoiceController.zatcaQrData(
//     //   nameSaller: controller.SONA.toString(),
//     //   invoiceTotalAmount: orderDetails.total.toString(),
//     //   invoiceTaxAmount: orderDetails.vatAmount.toString(),
//     //   taxNumber: controller.SOTX.toString(),
//     // );
//     final pdf = pw.Document();
//     final Uint8List fontData = await FileHelper.getFileFromAssets('fonts/HacenTunisia.ttf');
//     final ttf = pw.Font.ttf(fontData.buffer.asByteData());
//     // final image = await networkImage(invoiceSetting.logoUrl ?? '');
//     // final imageByteData = await rootBundle.load(ImagePathPDF);
//     // final imagefile = File(SignPicture);
//     // print('imagefile');
//     // final imageBytes_b = LoginController().SOSI == 'null' ||
//     //         LoginController().SOSI == '0' ||
//     //         LoginController().SOSI.isEmpty ||
//     //         LoginController().Image_Type == '2'
//     //     ? imageByteData.buffer.asUint8List(
//     //         imageByteData.offsetInBytes, imageByteData.lengthInBytes)
//     //     : imagefile.readAsBytesSync();
//     // final image = pw.MemoryImage(imageBytes_b);
//     pdf.addPage(
//       pw.Page(
//         margin: const EdgeInsets.all(2.5),
//         pageFormat: PdfPageFormat.roll57,
//         build: (pw.Context context) {
//           return pw.Column(
//                   children: [
//                     Table( children: [TableRow(
//                         children: [
//                           Column(children: [


//                             SimplePdf.text(
//                               'controller.SONA.toString()',
//                               ttf,
//                               fontSize: 10,
//                               color: PdfColors.black,
//                             ),

//                            SimplePdf.text('ooooooooo ',
//                               ttf,
//                               fontSize: 8,
//                               color: PdfColors.black,
//                             ),
//                             SimplePdf.spaceH(height: 5),

//                             //data
//                             pw.Table(border: pw.TableBorder.all(width: .1), columnWidths: {
//                               0: pw.FlexColumnWidth(1),
//                               1: pw.FlexColumnWidth(1),
//                               2: pw.FlexColumnWidth(1),
//                               3: pw.FlexColumnWidth(1),
//                               4: pw.FlexColumnWidth(2),
//                               5: pw.FlexColumnWidth(1),
//                               6: pw.FlexColumnWidth(2),
//                             },
//                                 children: [
//                                   pw.TableRow(decoration: pw.BoxDecoration(
//                                       color: PdfColor.fromHex("#E4F4FC")
//                                   ),
//                                     children: [
//                                       pw.Container(
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الإجمالي',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Total',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),
//                                       pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الخصم',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Discount',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),

//                                       pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الضريبة',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Vat',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),
//                                       pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الكمية',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Qty',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),
//                                       pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'السعر شامل الضريبة',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Price Inc. Vat',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),
//                                       pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الوحدة',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Unit',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),    pw.Container(
//                                         width: 100,
//                                         decoration: pw.BoxDecoration(),
//                                         padding: pw.EdgeInsets.all(1),
//                                         child: pw.Column(children: [
//                                           SimplePdf.text(
//                                             'الصنف',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                           SimplePdf.text(
//                                             'Items',
//                                             ttf,
//                                             fontSize: 6,
//                                             color: PdfColors.black,
//                                           ),
//                                         ]),
//                                       ),
//                                     ],
//                                   ),

//                                   ///data Rows

//                                   // Now the next table row
//                                 ]),

//                           ]),
//                         ],
//                       ),
//                     ]),


//                   ],
//                 );
//         },
//       ),
//     );

//     List<int> bytes = await pdf.save();
//     FileHelper.share(
//         msg: "iiiiiiiiii",
//         mode: mode,
//         bytes: bytes,

//         BMMID: 12345, fileName: 'Invoice-12.pdf');
//  // } catch (e) {
//     //Fluttertoast.showToast(
//     //    msg: e.toString(),
//     //    toastLength: Toast.LENGTH_LONG,
//     //    textColor: ma.Colors.white,
//     //    backgroundColor: ma.Colors.redAccent);
//    // print(e.toString());
//   //}
// }
