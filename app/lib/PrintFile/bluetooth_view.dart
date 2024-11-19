import 'package:app/PrintFile/print_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothSerial_permission  extends StatefulWidget {
  const BluetoothSerial_permission({Key? key}) : super(key: key);
  @override
  State<BluetoothSerial_permission> createState() => _BluetoothSerial_permissionState();
}

class _BluetoothSerial_permissionState  extends State<BluetoothSerial_permission > {
  @override
  // Future<FlutterBluetoothSerial.instance.requestEnable>(
  //
  //     );

  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: FlutterBluetoothSerial.instance.requestEnable(),
      builder: (context, future) {
        if (future.connectionState == ConnectionState.waiting) {
          return Print_View();
        } else if (future.connectionState == ConnectionState.done) {
          // return MyHomePage(title: 'Flutter Demo Home Page');
          return Print_View();
        } else {
          return Print_View();
        }
      }, // child: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
