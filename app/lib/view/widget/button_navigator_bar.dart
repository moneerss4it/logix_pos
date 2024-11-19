


import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/cartscreen/cart_screen.dart';

import 'package:app/view/screen/home_screen/home_screen.dart';
import 'package:app/view/screen/Posting_invoices/Posting_invoices_screen.dart';
import 'package:app/view/screen/saleslist/sales_list_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../helper/theme/color.dart';
import '../../helper/theme/text_theme.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);

    return ClipRRect(

      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10)),
      child: Container(margin: EdgeInsets.zero,


        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color:context.theme.cardColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
          borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(40),
            // topRight: Radius.circular(40),
          ),
        ),

        child: BottomAppBar(
          padding: const EdgeInsets.only(top: 0),
          color: context.theme.cardColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Home Button
                IconButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  icon: Column(

                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      MenuState.home == selectedMenu?   SizedBox(
                          width: 40,
                          child: Divider(height: 5, color:  MenuState.home == selectedMenu
                              ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary   : inActiveIconColor,thickness: 2,)):SizedBox(height: 5,),
                      const SizedBox(height: 5,),
                      SvgPicture.asset(ImageHelper.home,width: 20,height: 20,
                        color: MenuState.home == selectedMenu
                            ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary
                            : inActiveIconColor,

                      ),

                        const SizedBox(height: 5,),
                      Text("Home".tr,style: MenuState.home == selectedMenu?AppTextStyleTheme.madelTxtBld.copyWith(color: LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary):AppTextStyleTheme.madelTxtBld.copyWith(color: inActiveIconColor),)
                    ],
                  ),
                  color: MenuState.home == selectedMenu
                      ? LightColor.background == Get.theme.colorScheme.background
                      ? Get.theme.dividerColor
                      : LightColor.primary
                      : inActiveIconColor,
                  onPressed: () {
                    Get.offAll(const HomeScreen(), transition: Transition.noTransition);
                  },
                ),



                // Spacer to leave space for the FAB


                // Logix Community Button

                IconButton(

                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  icon: Column(

                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      MenuState.menu == selectedMenu?   SizedBox(
                          width: 40,
                          child: Divider(height: 5, color:  MenuState.menu == selectedMenu
                              ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary   : inActiveIconColor,thickness: 2,)):SizedBox(height: 5,),
                      const SizedBox(height: 5,),
                      SvgPicture.asset(ImageHelper.shoppingCartSimple,width: 20,height: 20,
                        color: MenuState.menu == selectedMenu
                            ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary
                            : inActiveIconColor,

                      ),

                      const SizedBox(height: 8,),

                      Text("Sales Report".tr,style: MenuState.menu == selectedMenu?AppTextStyleTheme.madelTxtBld.copyWith(color: LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary):AppTextStyleTheme.madelTxtBld.copyWith(color: inActiveIconColor),)
                    ],
                  ),
                  color: MenuState.menu == selectedMenu
                      ? LightColor.background == Get.theme.colorScheme.background
                      ? Get.theme.dividerColor
                      : LightColor.primary
                      : inActiveIconColor,
                  onPressed: () {
                   Get.offAll(const SalesListScreen(), transition: Transition.noTransition);
                  },
                ),             IconButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  icon: Column(

                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      MenuState.cart == selectedMenu?   SizedBox(
                          width: 40,
                          child: Divider(height: 5, color:  MenuState.cart == selectedMenu
                              ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary   : inActiveIconColor,thickness: 2,)):SizedBox(height: 5,),
                      const SizedBox(height: 5,),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(ImageHelper.cart,width: 20,height: 20,
                            color: MenuState.cart == selectedMenu
                                ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary
                                : inActiveIconColor,

                          ),


                          GetBuilder<CartController>(
                            builder: (con) {
                              return con.cartItems.isNotEmpty
                                  ? Positioned(
                                right: 0,
                                top: -5,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: LightColor.error,
                                  child: Center(
                                    child: Text(
                                      con.cartItems.length.toString(),
                                      style: AppTextStyleTheme
                                          .madelTxtBld
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                            )):const SizedBox();})
                        ],
                      ),


                      const SizedBox(height: 5,),

                      Text("Cart".tr,style: MenuState.cart == selectedMenu?AppTextStyleTheme.madelTxtBld.copyWith(color: LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary):AppTextStyleTheme.madelTxtBld.copyWith(color: inActiveIconColor),)
                    ],
                  ),
                  color: MenuState.cart == selectedMenu
                      ? LightColor.background == Get.theme.colorScheme.background
                      ? Get.theme.dividerColor
                      : LightColor.primary
                      : inActiveIconColor,
                  onPressed: () {
                    Get.offAll(const CartScreen(), transition: Transition.noTransition);
                  },
                ),

                IconButton(
                  style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.zero)),
                  icon: Column(

                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      MenuState.sale == selectedMenu?   SizedBox(
                          width: 40,
                          child: Divider(height: 5, color:  MenuState.sale == selectedMenu
                              ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary   : inActiveIconColor,thickness: 2,)):SizedBox(height: 5,),
                      const SizedBox(height: 5,),
                      SvgPicture.asset(ImageHelper.chart2,width: 20,height: 20,
                        color: MenuState.sale == selectedMenu
                            ? LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary
                            : inActiveIconColor,

                      ),

                      const SizedBox(height: 5,),

                      Text("Total Sales".tr,style: MenuState.sale == selectedMenu?AppTextStyleTheme.madelTxtBld.copyWith(color: LightColor.background==Get.theme.colorScheme.background? Get.theme.dividerColor:LightColor.primary):AppTextStyleTheme.madelTxtBld.copyWith(color: inActiveIconColor),)
                    ],
                  ),
                  color: MenuState.sale == selectedMenu
                      ? LightColor.background == Get.theme.colorScheme.background
                      ? Get.theme.dividerColor
                      : LightColor.primary
                      : inActiveIconColor,
                  onPressed: () {
                  Get.offAll(const SaleScreen(), transition: Transition.noTransition);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
enum MenuState {
  home,
  menu,
  //announcement,
  // favourite,
  // message,
  cart,
  sale,
}
