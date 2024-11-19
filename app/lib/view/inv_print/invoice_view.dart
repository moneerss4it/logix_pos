import 'dart:typed_data';
import 'package:app/PrintFile/Invoice/file_helper.dart';
import 'package:app/PrintFile/invoice_controller.dart';
import 'package:app/PrintFile/share_mode.dart';
import 'package:app/controller/auth_controller.dart';
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

printReport({
  required Master master,
  String? msg,
  required ShareMode mode,
}) async {
  final Uint8List fontData =
      await FileHelper.getFileFromAssets('fonts/HacenTunisia.ttf');
  final ttf = pw.Font.ttf(fontData.buffer.asByteData());
  final pdf = pw.Document(
    theme: pw.ThemeData(softWrap: true, textAlign: pw.TextAlign.right),
  );
   DataSalesPoints logo =  Get.find<ItemController>().dataSalesPoints;

  String qrData = await InvoiceController.zatcaQrData(
    nameSaller: logo.facilityName.toString(),
    invoiceTotalAmount: master.total.toString(),
    invoiceTaxAmount: master.vatAmount.toString(),
    taxNumber: logo.vatNumber.toString(),
  );


  // pw.ImageProvider image;
  // try{
  //   image = await networkImage(erpUrl+"/images/"+logo.getLogo!.facilityLogo.toString(),cache: true,pdfCache: PdfMemoryCache());
  //
  // }catch (e){
  //    image = pw.MemoryImage(
  //     await FileHelper.getFileFromAssets('assets/image/error.png',),
  //   );
  // }

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
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      //margin: pw.EdgeInsets.symmetric(vertical: 10),

                      child: SimplePdf.text(
                        'فاتورة ضريبية مبسطة  ',
                        ttf,
                        fontSize: 7,
                      ),
                    ),
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
                            SimplePdf.text(' ${master.code} ', ttf,
                                fontSize: 7),
                            SimplePdf.text(
                                'رقم الفاتورة'
                                ' : ',
                                ttf,
                                fontSize: 7),
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

                    pw.Container(
                      child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          mainAxisAlignment: pw.MainAxisAlignment.center,
                          children: [
                            SimplePdf.text(' ${master.customerName} ', ttf,
                                fontSize: 7),
                            // pw.Spacer(),
                            //  pw.Expanded(child: pw.Directionality(textDirection: pw.TextDirection.rtl,child: SimplePdf.text("${"fawaz"}", ttf,align: pw.TextAlign.start,)) ),
                            // SimplePdf.spaceW(width: 6),
                            SimplePdf.text(
                                'العميل'
                                ' : ',
                                ttf,
                                fontSize: 7),
                          ]),
                    ),

                    SimplePdf.spaceH(height: 5),

                    //data
                    pw.Table(
                        border: pw.TableBorder.all(width: .1),
                        columnWidths: {
                          0: pw.FlexColumnWidth(1),
                          1: pw.FlexColumnWidth(1),
                          // 2: pw.FlexColumnWidth(1),
                          // 3: pw.FlexColumnWidth(1),
                          // 4: pw.FlexColumnWidth(2),
                          // 5: pw.FlexColumnWidth(1),
                          2: pw.FlexColumnWidth(1),
                        },
                        children: [
                          pw.TableRow(
                            children: [
                              // pw.Container(
                              //
                              //   width: 100,
                              //   decoration: pw.BoxDecoration(),
                              //   padding: pw.EdgeInsets.all(1),
                              //   child: pw.Column(children: [
                              //     SimplePdf.text(
                              //       'الإجمالي',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //     SimplePdf.text(
                              //       'Total',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //   ]),
                              // ),
                              // pw.Container(
                              //   width: 100,
                              //   decoration: pw.BoxDecoration(),
                              //   padding: pw.EdgeInsets.all(1),
                              //   child: pw.Column(children: [
                              //     SimplePdf.text(
                              //       'الخصم',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //     SimplePdf.text(
                              //       'Discount',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //   ]),
                              // ),
                              //
                              // pw.Container(
                              //   width: 100,
                              //   decoration: pw.BoxDecoration(),
                              //   padding: pw.EdgeInsets.all(1),
                              //   child: pw.Column(children: [
                              //     SimplePdf.text(
                              //       'الضريبة',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //     SimplePdf.text(
                              //       'Vat',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //   ]),
                              // ),

                              pw.Container(
                                width: 100,
                                decoration: const pw.BoxDecoration(),
                                padding: const pw.EdgeInsets.all(1),
                                child: pw.Column(children: [
                                  SimplePdf.text(
                                    'السعر ',
                                    ttf,
                                    fontSize: 6,
                                    color: PdfColors.black,
                                  ),
                                ]),
                              ),
                              pw.Container(
                                width: 100,
                                decoration: const pw.BoxDecoration(),
                                padding: const pw.EdgeInsets.all(1),
                                child: pw.Column(children: [
                                  SimplePdf.text(
                                    'الكمية',
                                    ttf,
                                    fontSize: 6,
                                    color: PdfColors.black,
                                  ),
                                ]),
                              ),

                              // pw.Container(
                              //   width: 100,
                              //   decoration: pw.BoxDecoration(),
                              //   padding: pw.EdgeInsets.all(1),
                              //   child: pw.Column(children: [
                              //     SimplePdf.text(
                              //       'الوحدة',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //     SimplePdf.text(
                              //       'Unit',
                              //       ttf,
                              //       fontSize: 6,
                              //       color: PdfColors.black,
                              //     ),
                              //   ]),
                              // ),

                              pw.Container(
                                width: 100,
                                decoration: const pw.BoxDecoration(),
                                padding: const pw.EdgeInsets.all(1),
                                child: pw.Column(children: [
                                  SimplePdf.text(
                                    'الصنف',
                                    ttf,
                                    fontSize: 6,
                                    color: PdfColors.black,
                                  ),
                                ]),
                              ),
                            ],
                          ),

                          ///data Rows

                          // Now the next table row
                        ]),
                    pw.Table(
                        border: pw.TableBorder.all(width: .1),
                        columnWidths: {
                          0: pw.FlexColumnWidth(1),
                          1: pw.FlexColumnWidth(1),
                          // 2: pw.FlexColumnWidth(1),
                          // 3: pw.FlexColumnWidth(1),
                          // 4: pw.FlexColumnWidth(2),
                          // 5: pw.FlexColumnWidth(1),
                          2: pw.FlexColumnWidth(1),
                        },
                        children:
                            List.generate(master.products.length, (index) {
                          CartItem product = master.products[index];

                          return pw.TableRow(
                            children: [
                              // pw.Container(
                              //   width: 100,
                              //   alignment: pw.Alignment.center,
                              //   padding: pw.EdgeInsets.all(4),
                              //   child: SimplePdf.text(
                              //       "${product.total.toString()}" ,
                              //       ttf,
                              //       fontSize: 6),
                              // ),
                              // pw.Container(
                              //   width: 100,
                              //   alignment: pw.Alignment.center,
                              //   padding: pw.EdgeInsets.all(4),
                              //   child: SimplePdf.text(
                              //       product.discountAmount.toString(), ttf,
                              //       fontSize: 6),
                              // ),  pw.Container(
                              //   width: 100,
                              //   alignment: pw.Alignment.center,
                              //   padding: pw.EdgeInsets.all(4),
                              //   child: SimplePdf.text(
                              //       product.vatAmount.toString(), ttf,
                              //       fontSize: 6),
                              // ),

                              pw.Container(
                                width: 100,
                                alignment: pw.Alignment.center,
                                padding: pw.EdgeInsets.all(4),
                                child: SimplePdf.text(
                                    product.price.toStringAsFixed(2), ttf,
                                    fontSize: 6),
                              ),
                              pw.Container(
                                width: 100,
                                alignment: pw.Alignment.center,
                                padding: pw.EdgeInsets.all(4),
                                child: SimplePdf.text(
                                    product.quantity.toString(), ttf,
                                    fontSize: 6),
                              ),

                              // pw.Container(
                              //   width: 100,
                              //   alignment: pw.Alignment.center,
                              //   padding: pw.EdgeInsets.all(4),
                              //   child: SimplePdf.text(
                              //       product.discountAmount.toString(), ttf,
                              //       fontSize: 6),
                              // ),
                              pw.Container(
                                width: 100,
                                alignment: pw.Alignment.centerRight,
                                padding: const pw.EdgeInsets.all(4),
                                child: SimplePdf.text(product.name, ttf,
                                    fontSize: 6),
                              ),
                            ],
                          );
                        })),
                    pw.Table(columnWidths: {
                      0: const pw.FlexColumnWidth(2),
                      1: const pw.FlexColumnWidth(2),
                      2: const pw.FlexColumnWidth(4),
                    }, children: [
                      // pw.TableRow(
                      //   children: [
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.centerLeft,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child: SimplePdf.text('Taxable Amt', ttf, fontSize: 8),
                      //     ),
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.center,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child: SimplePdf.text('40', ttf, fontSize: 8),
                      //     ),
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.centerRight,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child:
                      //           SimplePdf.text('الاجمالي الخاضع للضريبة', ttf, fontSize: 8),
                      //     ),
                      //   ],
                      // ),
                      // pw.TableRow(
                      //   children: [
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.centerLeft,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child: SimplePdf.text('Total', ttf,),
                      //     ),
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.center,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child: SimplePdf.text(
                      //        "987", ttf,
                      //       ),
                      //     ),
                      //     pw.Container(
                      //       width: 100,
                      //       alignment: pw.Alignment.centerRight,
                      //       padding: pw.EdgeInsets.all(4),
                      //       child: SimplePdf.text('المجموع', ttf,),
                      //     ),
                      //   ],
                      // ),
                      pw.TableRow(
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(master.discountAmount, ttf,
                                fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text('الخصم', ttf, fontSize: 6),
                          ),
                        ],
                      ),
                      pw.TableRow(
                        children: [
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.center,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(master.vatAmount, ttf,
                                fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text('الضريبة', ttf, fontSize: 6),
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
                                SimplePdf.text((double.parse(master.total) + double.parse(master.vatAmount)).toStringAsFixed(2), ttf, fontSize: 6),
                          ),
                          pw.Container(
                            width: 100,
                            alignment: pw.Alignment.centerRight,
                            padding: const pw.EdgeInsets.all(4),
                            child: SimplePdf.text(
                              'الاجمالي شامل الضريبة',
                              ttf,
                              fontSize: 6,
                              color: PdfColors.black,
                            ),
                          ),
                        ],
                      ),
                    ]),

            mode== ShareMode.print ? pw.Container() :        pw.Container(
                        alignment: pw.Alignment.center,
                        margin: const pw.EdgeInsets.symmetric(vertical: 5),
                        child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.center,
                            crossAxisAlignment: pw.CrossAxisAlignment.center,
                            children: [
                              pw.Container(
                                width: 60,
                                height: 60,
                                child: pw.BarcodeWidget(
                                  color: PdfColor.fromHex("#000000"),
                                  barcode: pw.Barcode.qrCode(),
                                  data: qrData,
                                ),
                              )
                            ])),
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
    qr: qrData,
    BMMID: 12345,
  );
  // } catch (e) {
  //   showSnakBarErorr(msg: e.toString());
  // }
}
