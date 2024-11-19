///Dart import
import 'dart:developer';
import 'dart:io';
import 'package:app/controller/setting_controller.dart';
import 'package:app/data/model/invoice_model.dart';
import 'package:app/data/model/sale_of_points_model.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:bluetooth_thermal_printer_plus/bluetooth_thermal_printer_plus.dart';
import 'dart:math' as math;
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:share/share.dart';
import '../../PrintFile/share_mode.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart' as im;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

///Package imports
import 'package:path_provider/path_provider.dart';
import 'package:pdf_image_renderer/pdf_image_renderer.dart';
import '../../controller/cart_controller.dart';
import '../../controller/item_controller.dart';
import '../pdf_perview.dart';
import 'package:permission_handler/permission_handler.dart';

///To save the pdf file in the device
class FileHelper {
  static Future<String> save(List<int> bytes, String fileName) async {
    Directory? pathSave = await (getApplicationDocumentsDirectory());
    String path = "${pathSave.path}/$fileName";

    File file = File(path);
    await file.writeAsBytes(bytes);

    return file.path;
  }

  static InvoiceModel generateUniqueCodeByLastCodeString({required String lastCode,
    // required int facilityId,
    // required int branchId,
    // required int dataSalesPointsId
  }) {
    print("====>Ashraf new Function ==== === === lastCode  =>> $lastCode");
    final pointController = Get.find<ItemController>().dataSalesPoints;
    int facilityId=pointController.facilityId??0;
    int branchId =pointController.branchId??0;
    int dataSalesPointsId =pointController.id??0;

    InvoiceModel invoiceModel = InvoiceModel(no: 0, code: "");
    // Get the current year as a two-digit string
    String currentYear = DateTime.now().year.toString().substring(2);
    int getlastId = 0;
    List<String> parts = lastCode.split('-');
    int number = int.parse(parts.last);
    getlastId = number;

    getlastId = getlastId + 1;
    invoiceModel.no = getlastId;
    print("====>Ashraf new Function ==== === === finalCode  =>> $getlastId");

    // String uniqueCode = 'INV-$currentYear-3${data.id.toString()+data.facilityId.toString()+data.branchId.toString()}-$getlastId';
    String uniqueCode =
        'INV-$currentYear-3$facilityId$branchId$dataSalesPointsId-11-$getlastId';

    invoiceModel.code = uniqueCode;
    return invoiceModel;
  }
  static Future<void> saveAndLaunchFile(
      List<int> bytes, String fileName) async {
    Directory? pathSave = await (getApplicationDocumentsDirectory());
    String path = "${pathSave.path}/$fileName";
    File file = File(path);
    await file.writeAsBytes(bytes);
    if (path.contains('.pdf')) {
      Get.dialog(
        PdfPerview(
          filePath: path,
        ),
      );
    } else {
      OpenFile.open(path);
    }
  }





  static InvoiceModel generateUniqueCode(DataSalesPoints data) {
    InvoiceModel invoiceModel=InvoiceModel(no: 0, code: "") ;
    final cartController=Get.find<CartController>();
    cartController.loadMaster();
    // Get the current year as a two-digit string
    String currentYear = DateTime.now().year.toString().substring(2);
    int getlastId=0;
    if(cartController.lastCode!=null){
      String input = cartController.lastCode.toString();

      // Split the string by '-' and get the last part
      List<String> parts = input.split('-');
      int number = int.parse(parts.last);

      // Increment the number


      // Combine the incremented number back with the original parts

      getlastId=number;


      // Output: inv-24-3311-11358

    }else{
      getlastId = cartController.getLastInvoiceID();
    }


    getlastId = getlastId+1;
    invoiceModel.no=getlastId;
    // Generate a random number between 0 and 99 for the last part
    // Construct the unique code
    String uniqueCode = 'INV-$currentYear-3${data.id.toString()+data.facilityId.toString()+data.branchId.toString()}-11-$getlastId';
    invoiceModel.code=uniqueCode;
    return invoiceModel;
  }




  static Future<Uint8List> getFileFromAssets(String asstess) async {
    ByteData data = await rootBundle.load(asstess);
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  }

  static share({
    required ShareMode mode,
    required List<int> bytes,
    required String fileName,
    required String qr,
    required int BMMID,
    String? msg,
  }) async {
    print(mode);
    print('ShareMode');
    switch (mode) {
      case ShareMode.view:
        FileHelper.saveAndLaunchFile(bytes, fileName); // P// age
        break;
      case ShareMode.extract:
        String path = await save(bytes, fileName);
        if (Get.isBottomSheetOpen!) Get.back();
        Get.toNamed('"/exportedInvoices');
        //   showSnakBarSuccess(msg: "Done Export ");
        break;
      case ShareMode.share:
        String path = await save(bytes, fileName);
        await Share.shareFiles([path],
            mimeTypes: ['application/pdf'], text: msg ?? '');
        break;

      case ShareMode.print:
        String path = await save(bytes, fileName);
        print("printffff");

        print("fawaz");
        printBluetooth(path, BMMID, qr);
      // printNetwork(path);
    }
  }

  bool connected = false;

  List availableBluetoothDevices = [];

  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  bool _connected = false;

  Future<void> initPlatformState() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {}
    _devices = devices;
    Get_Device();
  }

  List<BluetoothDevice> _devices = [];

  static BluetoothDevice? _device;

  Future<BluetoothDevice?> Get_Device() async {
    try {
      _devices.forEach((device) {
        if (device.address == SettingController().Printer_Name) {
          _device = device;
          print('Get_Device');
          print(device.address);
          print(SettingController().Printer_Name);
        }
      });
      print(_device);
      return _device;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          backgroundColor: Colors.redAccent);
    }
    return null;
  }

  static Future<void> printTicket(String path) async {
    print("isConnected");
    print(SettingController().Printer_Name);

    String? conn =
        await BluetoothThermalPrinter.connect(SettingController().Printer_Name);

    print(conn);
    print("isConnected");
    if (conn == "true") {
      //    final result = await BluetoothThermalPrinter.writeBytes(by.toList());
      // print("Print $result");
    } else {
      //Hadnle Not Connected Senario
    }
  }
  static Future<void> printBluetooth(String path, int GETAMKID, String qr) async {
    try {
      // Request Bluetooth permissions
      await Permission.bluetoothConnect.request();
      await Permission.bluetoothAdvertise.request();
      await Permission.bluetoothScan.request();

      print('Starting Bluetooth Printing');

      // Check if already connected to a Bluetooth printer
      String? connection = await BluetoothThermalPrinter.connectionStatus;
      print('Bluetooth connection status: $connection');
      String? conn;

      if (connection != "true") {
        // Connect to the Bluetooth printer by its name
        conn = await BluetoothThermalPrinter.connect(SettingController().Printer_Name);
        await Future.delayed(Duration(milliseconds: 600));

        if (conn == "false" || conn == null) {
          // Show error if unable to connect to the Bluetooth printer
          Fluttertoast.showToast(
            msg: "${'StrinPrinter_Bluetooth_Error'.tr}",
            toastLength: Toast.LENGTH_LONG,
            textColor: Colors.white,
            backgroundColor: Colors.redAccent,
          );
          return; // Exit if connection fails
        }
      }

      // Load the printing profile (e.g., for ESC/POS)
      CapabilityProfile profile = await CapabilityProfile.load();
      final generator = Generator(PaperSize.mm58, profile);

      // Open the PDF document
      final pdf = PdfImageRendererPdf(path: path);
      await pdf.open();

      log("Start converting PDF to image at ${DateTime.now()}");

      int pageIndex = 0;
      await pdf.openPage(pageIndex: pageIndex); // Open the first page of the PDF
      final size = await pdf.getPageSize(pageIndex: pageIndex); // Get the page size

      // Adjust this factor to control the amount of image sent to the printer in each chunk
      double imageCutFactor = 20;
      double currentCut = 0;

      int countImage = (size.height / imageCutFactor).round(); // Determine the number of chunks

      for (var i = 0; i < countImage; i++) {
        // Ensure you don't go beyond the page height
        if (currentCut > size.height) {
          int remainSpace = (size.height - currentCut).round();
          currentCut += remainSpace;
        }

        // Render the current chunk of the PDF page as an image
        Uint8List? img = await pdf.renderPage(
          pageIndex: pageIndex,
          x: 0,
          y: currentCut.toInt(),
          width: size.width,
          height: imageCutFactor.toInt(),
          scale: 2.7, // Increase the scale for better quality
        );

        if (img != null) {
          // Convert the rendered image bytes into an image object
          im.Image? image = im.decodeImage(img);
          log("Image chunk processed. Size: ${img.lengthInBytes / 1024} KB");

          if (image != null) {
            // Generate image raster data for printing
            List<int> imageRaster = generator.imageRaster(image);
            await BluetoothThermalPrinter.writeBytes(imageRaster); // Send image data to printer
          }
        }

        // Move the cut line down for the next chunk
        currentCut += imageCutFactor;
      }

      if (qr.isNotEmpty) {
        await BluetoothThermalPrinter.writeBytes(generator.feed(1));
        await BluetoothThermalPrinter.writeBytes(generator.qrcode(qr));
      }

      // Add a cut command and beep to the end of the printing
      List<int> finalCommands = [];
      finalCommands += generator.cut();
      finalCommands += generator.beep(n: 3); // Optional beep command
      await BluetoothThermalPrinter.writeBytes(finalCommands);

      log("End converting PDF to image and sending to printer at ${DateTime.now()}");

      // Close the PDF document
      await pdf.close();
    } catch (e) {
      // Handle any errors, especially MissingPluginException
      log('Error during Bluetooth print: $e');
      Fluttertoast.showToast(
        msg: 'Error occurred while printing: $e',
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }
  }

  // static printBluetooth(String path, int GETAMKID, String qr) async {
  //   await Permission.bluetoothConnect.request();
  //   await Permission.bluetoothAdvertise.request();
  //   await Permission.bluetoothConnect.request();
  //   print('printBluetooth');
  //
  //   // Check if already connected to a Bluetooth printer
  //   String? connection = await BluetoothThermalPrinter.connectionStatus;
  //   print(connection);
  //   String? conn;
  //
  //   if (connection != "true") {
  //     // Connect to the Bluetooth printer by its name
  //     conn = await BluetoothThermalPrinter.connect(
  //         SettingController().Printer_Name);
  //     await Future.delayed(Duration(milliseconds: 600));
  //
  //     if (conn == "false") {
  //       // Show error if unable to connect to the Bluetooth printer
  //       Fluttertoast.showToast(
  //           msg: "${'StrinPrinter_Bluetooth_Error'.tr}",
  //           toastLength: Toast.LENGTH_LONG,
  //           textColor: Colors.white,
  //           backgroundColor: Colors.redAccent);
  //       return; // Exit if connection fails
  //     }
  //   }
  //
  //   // Load the printing profile (e.g., for ESC/POS)
  //   CapabilityProfile profile = await CapabilityProfile.load();
  //   final generator = Generator(PaperSize.mm58, profile);
  //
  //   // Open the P+D+F document
  //   final pdf = PdfImageRendererPdf(path: path);
  //   await pdf.open();
  //
  //   log("Start Convert pdf to image ${DateTime.now()} ");
  //
  //   int pageIndex = 0;
  //   await pdf.openPage(pageIndex: pageIndex); // Open the first page of the PDF
  //   final size =
  //       await pdf.getPageSize(pageIndex: pageIndex); // Get the page size
  //
  //   // Adjust this factor to control the amount of image sent to the printer in each chunk
  //   double imageCutFactor = 20;
  //   double currentCut = 0;
  //
  //   int countImage = (size.height / imageCutFactor)
  //       .round(); // Determine the number of chunks
  //
  //   for (var i = 0; i < countImage; i++) {
  //     // Ensure you don't go beyond the page height
  //     if (currentCut > size.height) {
  //       int remainSpace = (size.height - currentCut).round();
  //       currentCut += remainSpace;
  //     }
  //
  //     // Render the current chunk of the PDF page as an image
  //     Uint8List? img = await pdf.renderPage(
  //       pageIndex: pageIndex,
  //       x: 0,
  //       y: currentCut.toInt(),
  //       width: size.width,
  //       height: imageCutFactor.toInt(),
  //       scale: 2.6, // Increase the scale for better quality
  //     );
  //
  //     if (img != null) {
  //       // Convert the rendered image bytes into an image object
  //       im.Image? image = im.decodeImage(img);
  //       log("Image chunk processed. Size: ${img.lengthInBytes / 1024} KB");
  //
  //       if (image != null) {
  //         // Generate image raster data for printing
  //         List<int> imageRaster = generator.imageRaster(image);
  //         await BluetoothThermalPrinter.writeBytes(
  //             imageRaster); // Send image data to printer
  //       }
  //     }
  //
  //     // Move the cut line down for the next chunk
  //     currentCut += imageCutFactor;
  //   }
  //   if(qr.isNotEmpty)
  //  {
  //    await BluetoothThermalPrinter.writeBytes(generator.feed(1));
  //    await BluetoothThermalPrinter.writeBytes(generator.qrcode(qr));
  //
  //  }
  //   // Add a cut command to the end of the printing
  //   List<int> finalCommands = [];
  //   finalCommands += generator.cut();
  //   finalCommands += generator.beep(n: 3); // Optional beep command
  //   await BluetoothThermalPrinter.writeBytes(finalCommands);
  //
  //   log("End Convert pdf to image and send to printer ${DateTime.now()} ");
  //
  //   // Close the PDF document
  //   await pdf.close();
  // }

  static BuleprintBluetoth(String path, int GETBMMID) async {
    try {
      print('BuleprintBluetoth');
      BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
      bool? c;

      if (_device != null) {
        await bluetooth.isConnected.then((isConnected) async {
          print('isConnected');
          print(isConnected);
          if (isConnected == true) {
            c = true;
          } else {
            c = await bluetooth.connect(_device!);
            bluetooth.connect(_device!).catchError((error) {
              c = false;
              print(error.toString());
              Fluttertoast.showToast(
                  msg: error.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  textColor: Colors.white,
                  backgroundColor: Colors.redAccent);
            });
          }
        });
      } else {
        Fluttertoast.showToast(
            msg: "${'StrinPrinter_Bluetooth_Error'.tr}",
            toastLength: Toast.LENGTH_LONG,
            textColor: Colors.white,
            backgroundColor: Colors.redAccent);
        print('No device selected.');
      }
      await Future.delayed(const Duration(milliseconds: 600));
      if (c == false) {
        Fluttertoast.showToast(
            msg: 'StrinPrinter_Bluetooth_Error'.tr,
            toastLength: Toast.LENGTH_LONG,
            textColor: Colors.white,
            backgroundColor: Colors.redAccent);
      } else {
        List<int> b = [];
        CapabilityProfile profile = await CapabilityProfile.load();
        final generator = Generator(PaperSize.mm80, profile);

        final pdf = PdfImageRendererPdf(path: path);
        await pdf.open();

        log("Start Convert pdf to image ${DateTime.now()} ");

        int pageIndex = 0;
        await pdf.openPage(pageIndex: pageIndex);
        final size = await pdf.getPageSize(pageIndex: pageIndex);
        // double imageCutFactor = size.height.toDouble();
        double imageCutFactor = 50;
        double curentCut = 0;

        int countImage = (size.height / imageCutFactor).ceil();

        for (var i = 0; i < countImage; i++) {
          if ((curentCut + imageCutFactor) > size.height) {
            int remainSpace = (size.height - curentCut).round();

            imageCutFactor = remainSpace.toDouble().abs();
          }

          Uint8List? img = await pdf.renderPage(
            pageIndex: pageIndex,
            x: 0,
            y: curentCut.toInt(),
            // width: 300,
            width: size.width,
            // you can pass a custom size here to crop the image
            height: imageCutFactor
                .toInt(), // you can pass a custom size here to crop the image
            scale:
                2.4, // increase the scale for better quality (e.g. for zooming)
          );

          final bytes = img?.buffer.asByteData().lengthInBytes;
          final kb = (bytes ?? 0) / 1024;
          final mb = kb / 1024;

          im.Image? image = im.decodeImage(
            img!,
          );
          log("image Size KB: $kb  Mbp:$mb");
          log("End Convert pdf to image ${DateTime.now()} ");
          log("Start Send pdf to Printer ${DateTime.now()} ");

          b.clear();

          b = generator.imageRaster(image!);
          curentCut = curentCut + imageCutFactor;
          await BluetoothThermalPrinter.writeBytes(b);
        }
        b.clear();
        b += generator.cut();
        // b += generator.feed(5);
        b += generator.beep(n: 3);
        await BluetoothThermalPrinter.writeBytes(b);

        log("End Convert pdf to image ${DateTime.now()} ");
        pdf.close();
        log("Start Send pdf to Printer ${DateTime.now()} ");

        // return;

        log("End Send pdf to Printer ${DateTime.now()} ");
        // String path = await save(bytes, fileName);
        // File file = File(path);
        // await Printing.layoutPdf(
        //     onLayout: (PdfPageFormat format) async => file.readAsBytes());
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_LONG,
          textColor: Colors.white,
          backgroundColor: Colors.redAccent);
      print(e.toString());
    }
  }

// static BuleprintBluetoth_Hprt(String path,int GETBMMID) async {
//   try {
//   print('BuleprintBluetoth');
//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
//   bool? c;
//
//   if (_device != null) {
//     await bluetooth.isConnected.then((isConnected) async {
//         Fluttertoast.showToast(
//             msg: "bluetooth device state: ${isConnected==true?'Connected':'Disconnected'}",
//             toastLength: Toast.LENGTH_LONG,
//             textColor: Colors.white,
//             backgroundColor: Colors.redAccent);
//       print('isConnected');
//       print(isConnected);
//       if (isConnected == true) {
//         c = true;
//       } else{
//         c = await bluetooth.connect(_device!);
//         bluetooth.connect(_device!).catchError((error) {
//           c = false;
//           print(error.toString());
//           Fluttertoast.showToast(
//               msg: error.toString(),
//               toastLength: Toast.LENGTH_LONG,
//               textColor: Colors.white,
//               backgroundColor: Colors.redAccent);
//         });
//         Fluttertoast.showToast(
//             msg: "bluetooth device state: ${c==true?'Connected':'Disconnected'}",
//             toastLength: Toast.LENGTH_LONG,
//             textColor: Colors.white,
//             backgroundColor: Colors.redAccent);
//       }
//     });
//   } else {
//     Fluttertoast.showToast(
//         msg: "${'StrinPrinter_Bluetooth_Error'.tr}",
//         toastLength: Toast.LENGTH_LONG,
//         textColor: Colors.white,
//         backgroundColor: Colors.redAccent);
//     print('No device selected.');
//   }
//   await Future.delayed(const Duration(milliseconds: 600));
//   if (c == false) {
//     Fluttertoast.showToast(
//         msg: 'StrinPrinter_Bluetooth_Error'.tr,
//         toastLength: Toast.LENGTH_LONG,
//         textColor: Colors.white,
//         backgroundColor: Colors.redAccent);
//   }
//   else{
//
//     await Serhprt.PrintFile(path);
//   }
//   } catch (e) {
//     Fluttertoast.showToast(
//         msg:e.toString(),
//         toastLength: Toast.LENGTH_LONG,
//         textColor: Colors.white,
//         backgroundColor: Colors.redAccent);
//     print(e.toString());
//   }
// }

// static printNetwork(String pathFile) async {
//   const PaperSize paper = PaperSize.mm80;
//   final profile = await CapabilityProfile.load();
//   final printer = NetworkPrinter(paper, profile);
//
//   final PosPrintResult connection =
//   await printer.connect('192.168.1.114', port: 9100);
//   final pdf = PdfImageRendererPdf(path: pathFile);
//   await pdf.open();
//   log("Start Convert pdf to image ${DateTime.now()} ");
//   int pageIndex = 0;
//   await pdf.openPage(pageIndex: pageIndex);
//   double imageCutFactor = 50;
//   double curentCut = 0;
//   final size = await pdf.getPageSize(pageIndex: pageIndex);
//   int countImage = (size.height / imageCutFactor).floor();
//   for (var i = 0; i < countImage; i++) {
//     if (curentCut > size.height) {
//       curentCut = curentCut - imageCutFactor.toInt();
//       int remainSpace = (size.height - curentCut).floor();
//       curentCut = curentCut + remainSpace;
//     }
//
//     Uint8List? img = await pdf.renderPage(
//       pageIndex: pageIndex,
//       x: 0,
//       y: curentCut.toInt(),
//
//       width: size.width, // you can pass a custom size here to crop the image
//       height: imageCutFactor
//           .toInt(), // you can pass a custom size here to crop the image
//       scale: 2.5, // increase the scale for better quality (e.g. for zooming)
//     );
//
//     final bytes = img?.buffer.asByteData().lengthInBytes;
//     final kb = (bytes ?? 0) / 1024;
//     final mb = kb / 1024;
//
//     im.Image? image = im.decodeImage(img!);
//     log("image Size KB: $kb  Mbp:$mb");
//     log("End Convert pdf to image ${DateTime.now()} ");
//     log("Start Send pdf to Printer ${DateTime.now()} ");
//     printer.imageRaster(
//       image!,
//     );
//     await Future.delayed(const Duration(milliseconds: 100), () {});
//     curentCut = curentCut + imageCutFactor;
//   }
//
//   // close the page again
//   await pdf.closePage(pageIndex: pageIndex);
//
//   // close the PDF after rendering the page
//
//   printer.feed(1);
//   printer.beep(n: 2);
//   printer.cut(mode: PosCutMode.full);
//   printer.feed(3);
//   printer.disconnect();
//   log("End Send pdf to Printer ${DateTime.now()} ");
// }
}
