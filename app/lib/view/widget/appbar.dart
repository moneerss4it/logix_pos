import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/languagescreen/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';


import '../../helper/theme/color.dart';
import '../../helper/theme/helper_change_app_theme.dart';
import '../../helper/theme/text_theme.dart';

CusAppBar(BuildContext context,text,{bool show=false,bool showMenu=false,bool showLogo=false,bool ? centerTitle,List<Widget> ?action,Color ?color})    => AppBar(

  title:showLogo?   Image.asset(
    'assets/logo.png',
    width: 90,
    height: 60,
  ): Text(text,style: AppTextStyleTheme.appParTxtBld.copyWith(color: context.theme.hoverColor
    ,),),centerTitle: centerTitle??true,
elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
 shadowColor: LightColor.cardColor1,
 leading:  !show?Builder(
   builder: (context) => GestureDetector(
     onTap: () {
       Scaffold.of(context).openDrawer();
       // ScaffoldState.currentState?.openDrawer();
       // zoomDrawerController.toggle!();
     },
     child: Padding(
       padding:
       EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
       child: Container(
         height: 33,
         width: 33,
         // margin: EdgeInsets.all(2),
         decoration: BoxDecoration(
           gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [LightColor.primary,LightColor.cardColor1 ]),
           borderRadius: BorderRadius.circular(8.r),
         ),
         child: Padding(
           padding: EdgeInsets.symmetric(
               vertical: 5.0, horizontal: 5.0),
           child: Image.asset(
             'assets/image/menu.png',
             width: 30.w,
             height: 30.h,
           ),
         ),
       ),
     ),
   ),
 ): IconButton(icon: Icon( Icons.arrow_back
   ,  color:Get.theme.hoverColor,),onPressed: (){

   Get.back();
 },),
  flexibleSpace:Container(
decoration: BoxDecoration(

gradient:  LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
colors:  context.theme.cardColor!=LightColor.cardColor?[

  color??DarkColor.appBarBackground,color??DarkColor.appBarBackground,
]:[

  color??context.theme.cardColor,  color??context.theme.cardColor,






]),)
  ),

  actions:[

    show?const SizedBox():   InkWell(

      onTap: (){
        Get.to(const LanguageScreen());

      },
      child: Card(
        color: context.theme.primaryColor.withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(

            children: [
            //  Text("العربية",style: AppTextStyleTheme.madelTxtBld.copyWith(color:context.theme.dividerColor),),
        const  SizedBox(width: 5,),

              SvgPicture.asset(ImageHelper.iconsGlobeSimple),


            ],
          ),
        ),
      ),
    ),
    IconButton(
      icon: Icon(

        MaterialCommunityIcons.theme_light_dark,color: Get.theme.dividerColor,
      ),
      onPressed: ThemeService.switchTheme,
    ),

  ],

);



