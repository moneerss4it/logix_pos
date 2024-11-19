import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SimplePdf {
  static pw.Text text(String data, pw.Font ttf,
      {double fontSize = 5,
      PdfColor color = PdfColors.black,
      pw.TextAlign? align}) {
    return
      pw.Text(
      data,
      textAlign: align ?? pw.TextAlign.center,
      style: pw.TextStyle(
        font: ttf,
        fontSize: fontSize,
        fontWeight: pw.FontWeight.bold,
        height: 0,
        color: color,
      ),
      textDirection: pw.TextDirection.rtl,
      maxLines: 2
    );
  }

  static pw.SizedBox spaceH({double height = 2}) => pw.SizedBox(height: height);
  static pw.SizedBox spaceW({double width = 2}) => pw.SizedBox(width: width);
}
