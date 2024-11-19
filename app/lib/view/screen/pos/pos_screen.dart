




import 'package:app/controller/cart_controller.dart';
import 'package:app/controller/item_controller.dart';
import 'package:app/data/model/sale_of_points_model.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/helper/utill/image_helper.dart';
import 'package:app/view/screen/home_screen/home_screen.dart';
import 'package:app/view/screen/pos/widget/pos_card_widget.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.find<ItemController>().getSalesPoint(true, );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CusAppBar(context, "نقاط البيع".tr,show: true ),

      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1500));
          Get.find<ItemController>().getSalesPoint(true, );
        },
        child: GetBuilder<ItemController>(
          builder: (con) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Skeletonizer(
                enabled: con.running,
                child: ListView.builder(
                    itemCount: con.running ? 20 : con.salesPointsModel.data!.length,
                    itemBuilder: (context, index) {

                  return   PosCardWidget(data:con.running ?  DataSalesPoints() : con.salesPointsModel.data![index] , onTap: () {

                  con.saveDataSalesPoints(con.salesPointsModel.data![index]);
                    con.getItems(true, con.salesPointsModel.data![index].inventoryId!);

                  Get.find<CartController>().getLastInvoice(con.salesPointsModel.data![index].id!);
                    Get.to(const HomeScreen());
                  });
                }),
              )
            );
          }
        ),
      ),
    );
  }
}


