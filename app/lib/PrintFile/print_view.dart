import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/setting_controller.dart';
import '../helper/theme/text_theme.dart';

class Print_View extends StatefulWidget {
  const Print_View({Key? key}) : super(key: key);
  @override
  State<Print_View> createState() => _Print_ViewState();
}

class _Print_ViewState extends State<Print_View> {
  final SettingController controller = Get.find();
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  List<BluetoothDevice> _devices = [];
  String _devicesMsg ="";
  late bool _connected;
  final f = NumberFormat("\$###,###.00", "en_US");
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { initPrinter(); });
  }

  Future<void> initPrinter() async{
    bluetoothPrint.startScan(timeout: Duration(seconds: 2));
    if (!mounted) return;
    bluetoothPrint.scanResults.listen((val) {
      if (!mounted) return;
      setState(() {_devices = val; });
      print('_devices');
      print(_devices);
      if(_devices.isEmpty) setState(() {
        _devicesMsg= "No Devices";
      });
    });
  }
  Future<void> _refresh() {
    return  initPrinter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Get.theme.cardColor,
          title: Text("Choose Printer".tr,style:AppTextStyleTheme.appParTxtBld.copyWith(color: context.theme.hoverColor)),

          iconTheme: IconThemeData(color: context.theme.hoverColor),
        ),
        body:RefreshIndicator(
            displacement: 250,

            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await Future.delayed(Duration(milliseconds: 1500));
              setState(() {
              });
            },
            child: _devices.isEmpty ? Center(child: Text(_devicesMsg ?? ''),) :
            ListView.builder(
              itemCount:  _devices.length,
              itemBuilder: (c,i){
                return ListTile(
                  leading: Icon(Icons.print,color: Colors.green,),
                  title: Text(_devices[i].name!,style: TextStyle(color: Colors.green),),
                  subtitle: Text(_devices[i].address!,style: TextStyle(color: Colors.green),),
                  onTap: (){
                    setState(() {
                      Get.back();
                      _startPrint(_devices[i]);
                      SettingController().SET_P('Printer_Name',_devices[i].address.toString());
                      controller.PrintController.text=_devices[i].name.toString();
                      SettingController().SET_P('Printer',_devices[i].name.toString());
                      controller.update();
                      print(SettingController().Printer_Name);
                      print(SettingController().Printer);
                      print('SettingController().Printer_Name');
                      //  Navigator.of(context).pop(false);
                    });
                  },
                );
              },
            ))// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  bool _isLoading = false;

  Future<void> _startPrint(BluetoothDevice device) async{
    bluetoothPrint.state.listen((state) {
      print('cur device status: $state');
      switch (state) {
        case BluetoothPrint.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BluetoothPrint.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          break;
      }
    });
    //final ReceiptSectionText receiptText = ReceiptSectionText();
    if(device.address != null){
      await bluetoothPrint.connect(device);
      print(device);
      print(device.address);
      //  print( await bluetoothPrint.connect(device));
      print("deviceMY");
      Map<String,dynamic> config = Map();
      List<LineText> list = [];
       list.add(LineText(type: LineText.TYPE_TEXT, content: 'ELITE SOFT FOR SYSTEM AND IT',underline: 1, weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
       list.add(LineText(type: LineText.TYPE_TEXT, content: 'ELITE SOFT FOR SYSTEM AND IT', weight: 1, align: LineText.ALIGN_CENTER,linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: 'this is conent left', weight: 0, align: LineText.ALIGN_LEFT,linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_TEXT, content: 'this is conent right', align: LineText.ALIGN_RIGHT,linefeed: 1));
      // list.add(LineText(linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_QRCODE, content: 'qrcode i', size:10, align: LineText.ALIGN_CENTER, linefeed: 1));
      // list.add(LineText(linefeed: 1));
      // list.add(LineText(type: LineText.TYPE_BARCODE, content: 'A12312112', size:10, align: LineText.ALIGN_CENTER, linefeed: 1));
      // for (var i =0;i< controller.Sys_Com_List.length;i++){
      //   list.add(LineText(type: LineText.TYPE_TEXT,
      //       content:  controller.Sys_Com_List[i].SCNE.toString(),
      //       underline: 1,
      //       weight: 1,
      //       align: LineText.ALIGN_CENTER,
      //       linefeed: 1));
      //   list.add(LineText(type: LineText.TYPE_TEXT,
      //       content:  controller.Sys_Com_List[i].SCAD.toString(),
      //       underline: 1,
      //       weight: 1,
      //       align: LineText.ALIGN_CENTER,
      //       linefeed: 1));
      //   list.add(LineText(type: LineText.TYPE_TEXT,
      //       content:  controller.Sys_Com_List[i].SCMO.toString(),
      //       underline: 1,
      //       weight: 1,
      //       align: LineText.ALIGN_CENTER,
      //       linefeed: 1));
      //   list.add(LineText(type: LineText.TYPE_TEXT,
      //       content:  controller.Sys_Com_List[i].SCWE.toString(),
      //       underline: 1,
      //       weight: 1,
      //       align: LineText.ALIGN_CENTER,
      //       linefeed: 1));
      //   list.add(LineText(type: LineText.TYPE_BARCODE,
      //       content:  controller.Sys_Com_List[i].SCQQ.toString(),
      //       size:10,
      //       align: LineText.ALIGN_CENTER,
      //       linefeed: 1));
      // }
      await Future.delayed(Duration(seconds: 3));
      await bluetoothPrint.printReceipt(config, list);
      // bluetoothPrint.disconnect();
      // await bluetoothPrint.printTest();
      //  }
    }
  }

}
