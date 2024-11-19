





import 'dart:typed_data';
import 'package:app/PrintFile/Invoice/file_helper.dart';
import 'package:app/PrintFile/invoice_controller.dart';
import 'package:app/PrintFile/share_mode.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/data/model/cart_model.dart';
import 'package:app/data/model/get_logo_model.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/data/model/sale_of_points_model.dart';

import 'package:app/view/inv_print/widget/simple_pdf.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

invoicesPosting({
  required double total,
  required String recipient,


  required ShareMode mode,
}) async {
  final Uint8List fontData =
  await FileHelper.getFileFromAssets('fonts/HacenTunisia.ttf');
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());
  final pdf = pw.Document(
    theme: pw.ThemeData(softWrap: true, textAlign: pw.TextAlign.right),
  );
  DataSalesPoints logo =  Get.find<ItemController>().dataSalesPoints;
  CartController cartController = Get.find<CartController>();


  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.roll57,
      margin: const pw.EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      build: (pw.Context context) {
        return pw.Directionality(
            textDirection: pw.TextDirection.rtl,
            child: pw.Container(
                color: PdfColor.fromHex("#ffffff"),
                alignment: pw.Alignment.topCenter,
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),

                    //header
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          SimplePdf.text(
                            logo.facilityName.toString(),
                            ttf,
                            fontSize: 6,
                          ),
                          // SimplePdf.spaceH(height: 0.3),
                        ]),
                    // pw.Image(image,width: 80,height: 80),

                    pw.Container(
                      // padding: pw.EdgeInsets.all(4),
                      //  margin: pw.EdgeInsets.symmetric(vertical: 5),

                      child: SimplePdf.text(
                          'العنوان : '
                              ' ${logo.address.toString()} ',
                          ttf,
                          fontSize: 6),
                    ),
                    pw.Container(
                      //  width: 100,
                      //padding: pw.EdgeInsets.all(4),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            // SimplePdf.text('Tel', ttf),
                            // pw.Spacer(),
                            SimplePdf.text(
                                ' ${logo.facilityMobile.toString()} ',
                                ttf,
                                fontSize: 7),
//SimplePdf.spaceW(width: 5),
                            SimplePdf.text(
                                'رقم الجوال'
                                    ' : ',
                                ttf,
                                fontSize: 7),
                          ]),
                    ),

                    pw.Container(
                      // padding: pw.EdgeInsets.all(4),
                      child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            // SimplePdf.text('VAT', ttf),
                            // pw.Spacer(),
                            SimplePdf.text(
                                ' ${logo.vatNumber.toString()} ', ttf,
                                fontSize: 7),
                            //    SimplePdf.spaceW(width: 5),
                            SimplePdf.text(
                                'الرقم الضريبي '
                                    ' : ',
                                ttf,
                                fontSize: 6),
                          ]),
                    ),

                    pw.Container(
                      child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            SimplePdf.text(
                                ' ${DateFormat('dd/MM/yyyy').format(DateTime.now())} ',
                                ttf,
                                fontSize: 7),
                            //  SimplePdf.spaceW(width: 6),
                            SimplePdf.text(
                                'التاريخ'
                                    ' : ',
                                ttf,
                                fontSize: 7),
                          ]),
                    ),


                    SimplePdf.spaceH(height: 5),
                    pw.Divider(),



                    pw.Table(columnWidths: {
                      0: const pw.FlexColumnWidth(2),
                      1: const pw.FlexColumnWidth(2),
                      2: const pw.FlexColumnWidth(4),
                    }, children: [

                      pw.TableRow(
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(cartController.bankAmount.toStringAsFixed(2), ttf,
                                fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text('شبكة', ttf, fontSize: 6),
                          ),
                        ],
                      ),
                      pw.TableRow(
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(cartController.totalCash.toStringAsFixed(2), ttf,
                                fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text('كاش', ttf, fontSize: 6),
                          ),
                        ],
                      ),
                      pw.TableRow(
                        decoration: pw.BoxDecoration(),
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child:
                            SimplePdf.text( cartController.forward.toStringAsFixed(2), ttf, fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(
                              'أجل',
                              ttf,
                              fontSize: 6,
                              color: PdfColors.black,
                            ),
                          ),
                        ],
                      ),
                      pw.TableRow(
                        decoration: const pw.BoxDecoration(),
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child:
                            SimplePdf.text(total.toStringAsFixed(2), ttf, fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(
                              'الاجمالي',
                              ttf,
                              fontSize: 6,
                              color: PdfColors.black,
                            ),
                          ),
                        ],
                      ),
                      pw.TableRow(
                        decoration: const pw.BoxDecoration(),
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child:
                            SimplePdf.text( recipient, ttf, fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(
                              'المستلم',
                              ttf,
                              fontSize: 6,
                              color: PdfColors.black,
                            ),
                          ),
                        ],
                      ),

                      pw.TableRow(
                        decoration: const pw.BoxDecoration(),
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child:
                            SimplePdf.text(  (total-double.parse(recipient)).toStringAsFixed(2), ttf, fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(
                              'المتبقي',
                              ttf,
                              fontSize: 6,
                              color: PdfColors.black,
                            ),
                          ),
                        ],
                      ),
                    ]),

         pw.SizedBox(height: 10),
                  ],
                )));
      },
    ),
  );

  List<int> bytes = await pdf.save();

  FileHelper.share(
    mode: mode,
    bytes: bytes,
    fileName:
    'Invoice_${DateFormat('yyyy-MM-dd_HH-mm-ss').format(DateTime.now())}.pdf',
    qr: "",
    BMMID: 12345,
  );
  // } catch (e) {
  //   showSnakBarErorr(msg: e.toString());
  // }
}
