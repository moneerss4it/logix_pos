// import 'package:dotted_decoration/dotted_decoration.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:sales/controller/file_piker_controller.dart';
// import 'package:sales/theme/text_theme.dart';
//
// class CustomFileButton extends StatelessWidget {
//   const CustomFileButton({
//     Key? key,
//   }) : super(key: key);
// //final Function() onPree;
//   @override
//   Widget build(BuildContext context) {
//     return  GetBuilder<FilePickerController>(
//         builder: (controller) {
//         return InkWell(
//           onTap:() {
//             controller.getFilePath();
//           },
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   width: .3*Get.width,
//                   decoration:DottedDecoration(
//                     color: context.theme.dividerColor,
//
//                     shape: Shape.box,
//                     borderRadius: BorderRadius.circular(10), //remove this to get plane rectange
//                   ),
//                   child: Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset("icons/upload.png",width: 20.w,height: 20.w,color:context.theme.dividerColor,),
//                         SizedBox(width: 10.w,),
//                         Text( "UpLoad".tr,style: AppTextStyleTheme.appParTxtBld,)
//                       ],),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 10,),
//               CustomTextFile(text:controller.filePath==''? "There is no archive".tr:controller.name)
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
//
// class CustomTextFile extends StatelessWidget {
//   const CustomTextFile({
//     Key? key, required this.text,
//   }) : super(key: key);
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Flexible(child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Text(text,style: AppTextStyleTheme.inputText,textAlign: TextAlign.center,),
//         ),
//        // Divider(color: context.theme.dividerColor,)
//       ],
//     ));
//   }
// }