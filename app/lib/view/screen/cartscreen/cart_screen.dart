

import 'package:app/controller/auth_controller.dart';
import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/cartscreen/type_pay_screen.dart';
import 'package:app/view/screen/cartscreen/widget/custom_cart_widget.dart';
import 'package:app/view/screen/cartscreen/widget/total_cart_wid.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/button_navigator_bar.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/drawer.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../helper/theme/color.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.find<ItemController>().loadDataSalesPoints();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MainDrawer(),
      appBar: CusAppBar(context, "Cart".tr, ),

      body: GetBuilder<CartController>(
        builder: (con) {
          return Column(
            children: [
          TotalCartWidget(total:con.totalAmountWithVat,),

             Expanded(child: ListView.builder(
               itemCount: con.cartItems.length,
               itemBuilder: (context, index) {
           return  CustomCartWidget(item: con.cartItems[index], index: index,);
               }, ),),
              SizedBox(height: 20,),

              GetBuilder<ItemController>(
                builder: (pointController) {
                  return CustomButton(sizeWidth: .9.sw,text: "Checkout".tr,color:con.cartItems.isEmpty?Colors.grey:LightColor.primary ,onPress: con.cartItems.isEmpty?null: (){

                    Get.to(const TypePayScreen());
                  });
                }
              ),
              SizedBox(height: 20,),


            ], );
        }
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.cart),

    );
  }
}




