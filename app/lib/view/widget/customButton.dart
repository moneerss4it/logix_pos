import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../helper/theme/color.dart';
import '../../helper/theme/text_theme.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key ?key, this.onPress, this.text, this.sizeHeight, this.sizeWidth, this.row, this.sizedBoxHeight, this.style, this.disabledColor, this.color, this.fontColor, this.borderColor, this.borderRadius,
  }) : super(key: key);
  final Function()? onPress;
  final String? text;
  final double ?sizeHeight;
  final double ?sizeWidth;
  final double ?borderRadius;
  final Widget ?row;
  final TextStyle? style;
  final Color ?disabledColor;
  final Color ?color;
  final Color ?fontColor;
  final Color ?borderColor;
  final sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:sizeWidth?? double.infinity,
      height: sizeHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( borderRadius??10),side:borderColor==null?BorderSide.none: BorderSide(color: borderColor!)),

          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular( borderRadius??10),side:borderColor==null?BorderSide.none: BorderSide(color: borderColor!)),

            color: color??LightColor.primary,
            child: MaterialButton(


              padding: EdgeInsets.zero,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(
                  borderRadius??  10), ),
              disabledColor: disabledColor,
              onPressed: onPress,

              child:row==null ?Padding(
                padding:  EdgeInsets.only(bottom:3.w),
                child: Text( text!,
                  style:style!=null?
                  style :AppTextStyleTheme.textButton.copyWith(color: fontColor??Colors.white,),
                  textAlign: TextAlign.center,maxLines: 1,),
              ):row,
            ),
          ),
        ),
      ),
    );
  }
}