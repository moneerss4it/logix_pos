import 'package:app/controller/customer_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/data/model/customer_model.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/view/screen/home_screen/widget/card_item_home.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/button_navigator_bar.dart';
import 'package:app/view/widget/customButton.dart';
import 'package:app/view/widget/drawer.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/model/item_by_inventory_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState()  {
    super.initState();
     Get.find<ItemController>().loadDataSalesPoints();
    Get.find<ItemController>().getItems(true,  0);
    Get.find<CustomerController>().getCustomers(true, );

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int crossAxisCount = screenWidth > 600 ? 4 : 3;  // 4 columns for larger screens, 3 for phones

    return Scaffold(
      drawer: MainDrawer(),
      appBar: CusAppBar(context, "Home".tr, ),

      body: RefreshIndicator(
        onRefresh:  () async {
          await Future.delayed(const Duration(milliseconds: 1500));
          Get.find<ItemController>().getItems(true,  0);
        },
        child: GetBuilder<ItemController>(
          builder: (con) {
            return Skeletonizer(
              enabled: con.running,
              child: GridView.builder(
                padding:const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,  // Dynamically set columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 1.2,

                  // Adjust as needed
                ),
                itemCount:con.running ? 20 : con.itemByInventoryModel.data!.length,
                itemBuilder: (context, index) =>  CardAddItemWidgetHome(dataItem:con.running ?  DataItem() : con.itemByInventoryModel.data![index]),
              ),
            );
          }
        ),
      ),

      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}


