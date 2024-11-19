
import 'package:app/controller/cart_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PaymentTypeSelection extends StatefulWidget {
  @override
  _PaymentTypeSelectionState createState() => _PaymentTypeSelectionState();
}

class _PaymentTypeSelectionState extends State<PaymentTypeSelection> {

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<CartController>(
        builder: (con) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentOption(
                img: ImageHelper.network,
                label: 'Network'.tr,
                color: LightColor.primary,
                value: 2,
                groupValue: con.selectedPayment,
                onChanged: (value) {

                  con.selectPayment(value!) ;

                },
              ),
              PaymentOption(
                label: 'Cash'.tr,
                img: ImageHelper.cash,
                color:Colors.green,
                value: 1,
                groupValue: con.selectedPayment,
                onChanged: (value) {

                  con.selectPayment(value!) ;

                },
              ),
              PaymentOption(
                img: ImageHelper.forward,
                label: 'Forward'.tr,
                color: Colors.orange,
                value: 4,
                groupValue: con.selectedPayment,
                onChanged: (value) {
                  con.selectPayment(value!) ;
                },
              ),


            ],
          );
        }
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String label;
  final Color color;
  final int value;
  final int? groupValue;
  final String img;
  final ValueChanged<int?> onChanged;

  PaymentOption({
    required this.label,
    required this.color,
    required this.value,
    required this.groupValue,
    required this.onChanged,required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          margin: EdgeInsets.all(4),
          height: 90,
          decoration: BoxDecoration(
            color: color.withOpacity(.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Radio<int>(


                hoverColor: context.theme.hoverColor,
                focusColor: context.theme.focusColor,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                value: value,
                groupValue: groupValue,
                onChanged: onChanged,

                activeColor: color,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(img),
                    ),

                    Text(
                      label,
                      style: AppTextStyleTheme.appParTxtBld.copyWith(color:context.theme.hoverColor),

                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

