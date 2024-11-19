import 'package:app/controller/auth_controller.dart';
import 'package:app/helper/theme/color.dart';
import 'package:app/view/screen/auth/member_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:app/helper/utill/image_helper.dart';

import 'package:app/view/screen/home_screen/home_screen.dart';
import 'package:app/view/screen/introscreen/allinonboardscreen.dart';
import 'package:app/view/screen/introscreen/widegt/pagebuilderwidget.dart';
import 'package:app/view/widget/customButton.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        ImageHelper.intro1,

        "تابع جميع المبيعات التي تقوم بها بشكل دقيق وسريع , وخليك دائما على الاطلاع.",
        "سجل مبيعاتك بكل سهولة"),
    AllinOnboardModel(
        ImageHelper.intro2,
        "سواء كانت شبكة , كاش, او اجل , تابع عملية  الدفع بكل وضوح",
        "تحكم في طرق الدفع المتنوعة"),
    AllinOnboardModel(
        ImageHelper.intro3,
        "اعرف إجمالي مبيعاتك حسب طريقلا الدفع , وراجعها قبل ترحيل المبلغ المستلم بكل امان"
        ,  "راجع مبيعاتك وترحيل المبالغ"),
  ];
  PageController _pageController = PageController();

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      currentIndex = pageIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Get.theme.primaryColorDark,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Expanded(flex: 3,

             // hasScrollBody: false,
              child: Stack(
                children: [
                  PageView.builder(
                  //  physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                      onPageChanged: (value) {
                        _setPage(value);
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      itemCount: allinonboardlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top:30.0),
                          child: Container(

                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: PageBuilderWidget(
                                      title: allinonboardlist[index].titlestr,
                                      description: allinonboardlist[index].description,
                                      imgurl: allinonboardlist[index].imgStr),
                                ),


                                Expanded(
                                  flex: 4,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),
                                    ) ),

                                    child: Column(



                                      children: [
                                                                  Flexible(
                                                                    flex: 2,
                                    child: Column(

                                      children: [
                                      SizedBox(height: 20,),
                                 Text( allinonboardlist[index].titlestr,
                                            style: TextStyle(
                                                color:  Get.theme.dividerColor,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700)),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      //discription
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text( allinonboardlist[index].description,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(

                                              fontSize: 14,
                                            )),
                                      ),

                                    ],),
                                                                  ),

                                        Flexible(


                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: List.generate(
                                              allinonboardlist.length,
                                                  (index) => buildDot(index: index),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(height:20 ,),
                                        Flexible(
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child:    currentIndex < allinonboardlist.length - 1
                                                ? Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CustomButton(sizeWidth: .8.sw,text: "التالي".tr,onPress: () {
                                                  if(currentIndex!=2) {
                                                    currentIndex += 1;
                                                    _setPage(currentIndex);
                                                  }
                                                },),

                                              ],
                                            )
                                                :    CustomButton(sizeWidth: .8.sw,text: "ابدأ الان!".tr,onPress: () {
                                                Get.find<AuthController>().SaveIntroScreen();
                                              Get.to(MemberScreen());
                                            },),
                                          )
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                  Positioned(

                    left: 0,
                    top:60,
                    //     left: MediaQuery.of(context).size.width * 0.33,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.find<AuthController>().SaveIntroScreen();
                         Get.to(MemberScreen()) ;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 4),
                          child: Text(
                            "تخطي",
                            style: TextStyle(fontSize: 16, color:  LightColor.cardColor,),
                          ),
                        ),

                      ),
                    ),
                  ),

                ],
              ),
            ),
           //  Expanded(child: Column(
           //
           //    children: [
           //
           //      Row(
           //        mainAxisAlignment: MainAxisAlignment.center,
           //        children: List.generate(
           //          allinonboardlist.length,
           //              (index) => buildDot(index: index),
           //        ),
           //      ),
           // SizedBox(height:20 ,),
           //      currentIndex < allinonboardlist.length - 1
           //          ? Row(
           //            mainAxisAlignment: MainAxisAlignment.center,
           //            children: [
           //              CustomButton(sizeWidth: .9.sw,text: "التالي".tr,onPress: () {
           //                if(currentIndex!=2) {
           //                  currentIndex += 1;
           //                  _setPage(currentIndex);
           //                }
           //              },),
           //
           //            ],
           //          )
           //          :    CustomButton(sizeWidth: .9.sw,text: "ابدأ الان!".tr,onPress: () {
           //            //  Get.find<AuthController>().SaveIntroScreen();
           //            Get.to(LoginScreen());
           //          },),
           //    ],
           //  ),)


          ],
        ),
      ),
    );
  }

  Duration kAnimationDuration = Duration(milliseconds: 200);

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration:kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(

        color: currentIndex == index ?  LightColor.primary : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}


