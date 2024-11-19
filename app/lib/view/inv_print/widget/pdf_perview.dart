// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';
//
// import 'package:share_plus/share_plus.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// import 'package:flutter/material.dart';
//
// class PdfPerview extends GetWidget {
//   String filePath;
//
//   PdfPerview({
//     required this.filePath,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             " ",
//           //  style: titleMedium,
//           ),
//           leading: InkWell(onTap: () {
//             Get.back();
//           },child: Icon(Icons.arrow_back,)),
//           actions: [
//             IconButton(
//                 onPressed: () async {
//                   File file = File(filePath);
//                   await Printing.layoutPdf(
//                       onLayout: (PdfPageFormat format) async =>
//                           file.readAsBytes());
//                 },
//                 icon: Icon(Icons.print,)),
//             IconButton(
//                 onPressed: () async {
//                   // await Share.shareFiles([filePath],
//                   //     mimeTypes: ['application/pdf'], text: '');
//                 await Share.shareXFiles([XFile(filePath, mimeType: 'application/pdf')], text: '');
//                 },
//                 icon: Icon(Icons.share,)),
//           ],
//         ),
//         body: Container(
//
//             child: SfPdfViewer.file(
//
//           File(filePath),
//          // pageLayoutMode: PdfPageLayoutMode.single,
//         )));
//   }
// }
