
import '../../helper/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
CustomButtonSheetWidget(BuildContext context, {required List<Widget> list}) {

print("object");
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
          color: Get.theme.cardColor,

          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20,),
                    Text(
                        'اختر'.tr,
                        style: AppTextStyleTheme.appParTxtBld  ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(backgroundColor: Get.theme.highlightColor,radius: 12,child: Icon(Icons.clear,size: 20,color:Get.theme.cardColor))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(

                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  primary: true,
                  shrinkWrap: true,
                  separatorBuilder: (x, i) => Divider(
                    height: 0,
                  ),
                  itemBuilder: (x, i) {

                    return list[i];
                  },
                  itemCount: list.length,
                ),
              )
            ],
          ),
        ),
      ),
    ),
    elevation: 2,
    // isScrollControlled: true,
  );
}