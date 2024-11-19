import 'package:app/controller/customer_controller.dart';
import 'package:app/data/model/customer_model.dart';
import 'package:app/helper/theme/text_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void LookUpCustomWidget(
    BuildContext context,

    TextEditingController controller,
    CustomerController customerController,
    Function(DataOfCustomer) getId,
    {bool show = false}
    ) {
  //Get.dialog(Center(child:CircularProgressIndicator()), barrierDismissible: false);
  bool languageCode = Localizations.localeOf(context).languageCode == "ar";
  List<DataOfCustomer> dataLookup=customerController.customerModel.data!;
  customerController.filteredList.value=dataLookup;

  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 20),
                Text('Choose'.tr, style: AppTextStyleTheme.appParTxtBld),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: Get.theme.highlightColor,
                      radius: 12,
                      child: Icon(Icons.clear, size: 20, color: Get.theme.cardColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(

              onChanged: (value) {
                // Filter the list based on search query
                List<DataOfCustomer> filteredList = dataLookup.where((lookup) =>
                languageCode
                    ? lookup.name!.contains(value)
                    : show
                    ? lookup.name!.contains(value)
                    : lookup.name2!.contains(value)
                ).toList();
                customerController.updateFilteredList(filteredList);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Obx(() {
                      final filteredList = customerController.filteredList;
                      if (filteredList.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'No results found',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                      return Container(
                        child: ListView.separated(
                          physics: ClampingScrollPhysics(),
                          primary: true,
                          shrinkWrap: true,
                          separatorBuilder: (x, i) => Divider(height: 0, color: context.theme.dividerColor,thickness: .1,),
                          itemBuilder: (x, i) {
                            return ListTile(
                              onTap: () {
                                controller.text = languageCode
                                    ? filteredList[i].name.toString()
                                    : show
                                    ? filteredList[i].name.toString()
                                    : filteredList[i].name2.toString();
                                getId(filteredList[i]);
                                Get.back();
                              },
                              title: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  languageCode
                                      ? filteredList[i].name.toString()
                                      : show
                                      ? filteredList[i].name.toString()
                                      : filteredList[i].name2.toString(),
                                  style: AppTextStyleTheme.madelTextView.copyWith(color: context.theme.hoverColor),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            );
                          },
                          itemCount: filteredList.length,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    elevation: 2,
  );
}
