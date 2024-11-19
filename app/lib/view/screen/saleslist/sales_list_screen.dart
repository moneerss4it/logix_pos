

import 'package:app/controller/cart_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/helper/theme/text_theme.dart';
import 'package:app/view/screen/saleslist/widget/custom_card_sale_list.dart';
import 'package:app/view/widget/appbar.dart';
import 'package:app/view/widget/button_navigator_bar.dart';
import 'package:app/view/widget/drawer.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SalesListScreen extends StatefulWidget {
  const SalesListScreen({super.key});

  @override
  State<SalesListScreen> createState() => _SalesListScreenState();
}

class _SalesListScreenState extends State<SalesListScreen> with SingleTickerProviderStateMixin {
  late TabController tabController= TabController(length: 2, vsync: this);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CartController>().loadMaster();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MainDrawer(),

      appBar: CusAppBar(context, "Sales Report".tr, ),


      body: GetBuilder<CartController>(
        builder: (con) {
          return Column(
            children: [
              Card(

                margin: const EdgeInsets.all(5.0),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TabBar(

                    controller: tabController,

                    labelColor: LightColor.cardColor,
                    unselectedLabelColor:    Get.theme.hoverColor,
                    // give the indicator a decoration (color and border radius)
                    //   indicatorWeight: 2,
                    labelStyle: AppTextStyleTheme.appParTxtBld,


                    indicator: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [LightColor.cardColor1,LightColor.cardColor1]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //       indicatorPadding: EdgeInsets.all( 10.r),
                    onTap: (value) {

                      if (value == 0) {

                        con.setPosting(false);
                      }
                      if (value == 1)  {
                        con.setPosting(true);

                      }

                      // print(value);
                      // _leaveController.idLeave.value=_dropButtonTypeLeaveController.dropButtonList.value[value].code;
                      // print( _leaveController.idLeave.value);
                    },
                   // isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,

                    tabs: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topLeft,
                        children: [
                          SizedBox(
                              height: 35,
                              width: .4.sw,
                              child: Tab(

                                  icon: Text(
                                    "Unpaid Invoices".tr,
                                    //   style: AppTextStyleTheme.appParTxtBld,

                                  ))),

                          con.master.isEmpty?Container():    Positioned(
                            left: -15,
                            top: -5,

                            child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color:LightColor.error.withOpacity(.7) ,
                                    shape: BoxShape.circle
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Countup(
                                    begin: 0,
                                    end: double.parse(con.master.length.toString()),
                                    duration: const Duration(seconds: 2),
                                    separator: ',',
                                    style: AppTextStyleTheme.superSmallTxtNor.copyWith(fontSize: 13.sp,color:LightColor.cardColor),
                                  ),
                                )

                            ),
                          ),
                        ],
                      ),
                      SizedBox(    height: 35,
                          width: .4.sw,
                          child: Tab(
                              icon: Text(
                                "Paid Invoices".tr,
                                //  style: AppTextStyleTheme.appParTxtBld,

                              ))),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(


                    itemCount: con.masterFilter.length,
                    itemBuilder: (context, index) {
                      return  CustomCardSalesList(master: con.masterFilter[index], index: index,);
                    },),
                ),
              ),
            ],
          );
        }
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.menu),

    );
  }
}




