
import 'package:app/helper/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
        required this.title,
        required this.description,
        required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180.w,
        height: 180.w,
        child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: FittedBox(child: SvgPicture.asset(imgurl,  )),),
      ),
    );
  }
}