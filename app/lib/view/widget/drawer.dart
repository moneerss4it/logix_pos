import 'package:app/PrintFile/print_view.dart';
import 'package:app/PrintFile/print_view_bule.dart';
import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/controller/setting_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/auth/login_screen.dart';
import 'package:app/view/screen/auth/member_screen.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/custom_submit_dialog.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:get/get.dart';

import '../screen/pos/pos_screen.dart';


class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  final SettingController controller = Get.find();
  @override
  Widget build(BuildContext context) {


    return  Container(

      width: .8*Get.width,

      child: Drawer(
        child: Container(

          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ Get.theme.primaryColor,LightColor.background]),

        ),
       //   color: context.theme.primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
             const   SizedBox(height: 50,),
                Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset( ImageHelper.splash,height: 100,),
                      ),


                      GetBuilder<ItemController>(
                        builder: (con) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(con.dataSalesPoints.name.toString(),style: AppTextStyleTheme.appParTxtBld.copyWith(color: LightColor.cardColor),textAlign: TextAlign.start, softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,),
                          );
                        }
                      ),


                    ],
                  ),
                ),
                WidgetCustomDrawer(text: "Change Point of Sale".tr,icon:ImageHelper.POS_icon, onTap: () {

                  Navigator.push(context,MaterialPageRoute(builder: (context)=>PosScreen()));
                },),

              //   Row(
              //   //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Switch(
              //
              //         value: SettingController().Type_Print,
              //         activeColor: LightColor.cardColor,
              //
              //         inactiveThumbColor:  LightColor.highlightColor,
              //
              //         onChanged: (value) {
              //           setState(() {
              //             SettingController().SET_B_P('Type_Print',value);
              //             print(SettingController().Type_Print);
              //           });
              //         },
              //       ),
              //       SizedBox(width: 10,),
              //       Text('نوع الطابعه',
              //           style: AppTextStyleTheme.appParTxtBld.copyWith(color: LightColor.cardColor)),
              // Spacer(),
              //       IconButton(
              //           icon: Icon(Icons.error,),
              //           onPressed: () {
              //           //  configloading('StringPrint_Invo_Mess'.tr);
              //           }),
              //     ],
              //   ),
              //   Divider(color: LightColor.cardColor ,thickness: 0.5),
                GetBuilder(
                  init: SettingController(),
                  builder: (con) {
                    return ListTile(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>
                   const Print_View()));
                        },
                        leading:
                        CircleAvatar(
                          //  radius: 20.w,
                            backgroundColor: Get.theme.cardColor.withOpacity(.1),

                            child: Padding(
                                padding: const EdgeInsets.all(2.0),child: Icon(FontAwesome.print,size: 25.r,color: LightColor.cardColor,))),
                        subtitle: Text(con.PrintController.text, style:  AppTextStyleTheme.madelTxtBld.copyWith(color: LightColor.cardColor),),
                        title: Text("Printer".tr, style: AppTextStyleTheme.appParTxtBld.copyWith(color: LightColor.cardColor),)    );
                  }
                ),

                //   WidgetCustomDrawer(text: 'home',icon: 'icons/img.png', onTap: () {  },),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(borderRadius: 4   ,color:LightColor.error.withOpacity(.7),
                   row: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     //  Image.asset( 'icons/img.png',height: 25.w,width: 25.w,color:LightColor.error),
                     const  SizedBox(width: 10,),
                       Text( 'Sign out'.tr,style: AppTextStyleTheme.largeTxtBld.copyWith(color: LightColor.cardColor),textAlign: TextAlign.center, softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,)

                     ],
                   ),
                    onPress: () {
                      Get.dialog(   CustomSubmitDialog(onPress:()async{
                        Get.find<AuthController>().logOut();
                        Get.find<AuthController>().logOutMember();
                        Get.offAll(MemberScreen());
                      },text: 'Do you want to logout'.tr));

                      //  GetStorage().write(token,'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI0IiwianRpIjoiNWJjNTg0YjM1OWEwYjI5MGY2YzMzZTlmMmE5OWM2YTFhMWEzNGVhNGRjOWM3YjI5YWY0YTAwZTgxNTY0OGQyMDk3YzlhZGQxMmNkNjI1ZjIiLCJpYXQiOjE2NDU0NDAwMjQsIm5iZiI6MTY0NTQ0MDAyNCwiZXhwIjoxNjc2OTc2MDI0LCJzdWIiOiIxMCIsInNjb3BlcyI6W119.EnKmQoCN35QgLBp01QMhOGkIjUr9fB73y1H0ysyEjy1xVurV9QNsiynYDjWFgiTcm-QFbG6rEFoDjteiFeukDTmvSP52xxYCpon3Ho6T6ewcPiyTG5ETzZdpDYRQW1JeqfL6WeSjZvfvRDtmzx0nJvcyUCcdhy8yZAUC4u9etjZIQCUBUVKlx59wbCUIgpoUsK8GYzTYPjG7wPts1KuhBFjQngxoBM3DyF6D_Zf__ZkDDWjtM1uQC7Xu8EtVkwTPVqRwekGDeAvlAEd6XDWiEYAVzo6J7SZiZLVcUCObixyPhacsoOO70pByAU1JFpjGyVIqlRHHbdvHBsWwqmPq6F2qm__8n9dLQS3WujVNH8_bh6XlraRCssRKNxVnGTrn2Kip8KH0WSy2EFKcZ3QPoGdE0GKh6xG_P7XKu8qqUvWy4Xwn0Mgsfb6GyC6JINa-bAqpGigtBc9x5k_3djmoJcSHETnVTaZCPnPI3dKkRGNMdQJv5J-8LFC4LIo9_d_Y4zfXEFpk6DDkGbNGCTdPxmJOUOU_zSlWGut0eydv9fa2u1YEdptfD12_D2Fl_vA79k1UMqqxhzy3NL_-D1TShO2izhwBx_NjW8yC2B6ZwE7j-LJv0jFEfGYAaB1kqbBPB4Xd7LNqKjgkbw9hQqhI30tlgiI-uWX5VDfhkc7xOyQ' );
                      //loginController.doLogin();
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class WidgetCustomDrawer extends StatelessWidget
{
  const WidgetCustomDrawer({
     Key? key, required this.text, required this.onTap, required this.icon,
  }) : super(key: key);
  final String text;
  final Function() onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
       // width: .8*Get.width,
            color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(height: 2.w,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:10.w),
              child: Row(children: [

                CircleAvatar(
                  //  radius: 20.w,
                    backgroundColor: Get.theme.cardColor.withOpacity(.1),

                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(icon,height: 25.w,width: 25.w,color:LightColor.cardColor),
                    )),
                SizedBox(width: 10.w,),
                Text(text,style: AppTextStyleTheme.appParTxtBld.copyWith(color: LightColor.cardColor),textAlign: TextAlign.center, softWrap: true,overflow: TextOverflow.ellipsis,maxLines: 2,)
                ,SizedBox(height: 5.w,),
              ],),

            ),
            SizedBox(height: 5.w,),
            //SizedBox(height: 10.r,),
            Divider(color: LightColor.cardColor ,thickness: 0.5),
          ],
        ),
      ),
    );
  }}
