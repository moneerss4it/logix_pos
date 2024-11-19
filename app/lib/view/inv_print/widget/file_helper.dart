// ///Dart import
// import 'dart:developer';
// import 'dart:io';
// import 'dart:math';
//
//
// import 'package:app/view/inv_print/widget/pdf_perview.dart';
// import 'package:app/view/inv_print/widget/share_mode.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:image/image.dart' as im;
//
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:open_file_plus/open_file_plus.dart';
//
//
// ///Package imports
//
// import 'package:path_provider/path_provider.dart';
//
// import 'package:share_plus/share_plus.dart';
//
//
//
// // ignore: avoid_classes_with_only_static_members
// ///To save the pdf file in the device
// class FileHelper {
//   static Future<String> save(List<int> bytes, String fileName) async {
//     Directory? pathSave = await (getApplicationDocumentsDirectory());
//     String path = "${pathSave.path}/$fileName";
//
//     File file = File(path);
//     await file.writeAsBytes(bytes);
//
//     return file.path;
//   }
//
//   static Future<void> saveAndLaunchFile(
//       List<int> bytes, String fileName) async {
//     Directory? pathSave = await (getApplicationDocumentsDirectory());
//     String path = "${pathSave.path}/$fileName";
//
//     File file = File(path);
//     await file.writeAsBytes(bytes);
//     if (path.contains('.pdf')) {
//       Get.to(() => PdfPerview(
//             filePath: path,
//           ));
//       Get.dialog(
//         Center(
//             child: PdfPerview(
//           filePath: path,
//         )),
//       );
//     } else {
//       OpenFile.open(path);
//     }
//   }
//
//   static Future<Uint8List> getFileFromAssets(String asstess) async {
//     ByteData data = await rootBundle.load(asstess);
//     return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//   }
//
//   static share({
//     required ShareMode mode,
//     required List<int> bytes,
//     required String fileName,
//     String? msg,
//   }) async {
//     switch (mode) {
//       case ShareMode.view:
//         FileHelper.saveAndLaunchFile(bytes, fileName); // Page
//         break;
//       case ShareMode.extract:
//         String path = await save(bytes, fileName);
//         if (Get.isBottomSheetOpen!) Get.back();
//         //Get.toNamed(RoutingApp.exportedInvoices);
//        // showSnakBarSuccess(msg: "Done Export ");
//        // GetSnackMsg(msg: "Done Export ",bgClr:kColorRed ,txClr:kColorsWhite ).showTxt();
//
//         break;
//       case ShareMode.share:
//         String path = await save(bytes, fileName);
//
//         // await Share.shareFiles([path],
//         //     mimeTypes: ['application/pdf'], text: msg ?? '');
//         await Share.shareXFiles(
//           [XFile(path, mimeType: 'application/pdf')],
//           text: msg ?? '',
//         );
//         break;
//       case ShareMode.print:
//         String path = await save(bytes, fileName);
//
//     }
//   }
//
//   static String generateRandomInvoiceId() {
//     Random random = Random();
//     int randomNumber = random.nextInt(999) + 1; // Generates a number between 1 and 999
//     return 'INV-${randomNumber.toString().padLeft(3, '0')}'; // Pads with leading zeros
//   }
//
// }
