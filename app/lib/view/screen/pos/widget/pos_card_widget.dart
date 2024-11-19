import 'package:app/data/model/sale_of_points_model.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class PosCardWidget extends StatelessWidget {
  const PosCardWidget({
    super.key, required this.data, this.onTap,
  });
final DataSalesPoints data;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(child: Text(data.name.toString(),style:AppTextStyleTheme.madelTxtBld.copyWith(color: context.theme.hoverColor
                  ,),),),
                SvgPicture.asset(ImageHelper.arrow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}