import 'dart:io';
import 'package:share/share.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PdfPerview extends GetWidget {
  String filePath;

  PdfPerview({
    required this.filePath,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text(" ",
          //  style: subtitle1,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await Share.shareFiles([filePath],
                      mimeTypes: ['application/pdf'], text: '');
                },
                icon: Icon(Icons.share)),
          ],
        ),
        body: Container(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SfPdfViewer.file(


                        File(filePath),
                       // pageLayoutMode: PdfPageLayoutMode.single,
                      ),
            )));
  }
}
