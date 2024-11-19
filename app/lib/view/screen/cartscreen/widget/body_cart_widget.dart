
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/button_navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BodyCartWidget extends StatelessWidget {
  const BodyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: CusAppBar(context, "السلة".tr, ),

body: Column( children: [



],),

      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.cart),

    );
  }
}
