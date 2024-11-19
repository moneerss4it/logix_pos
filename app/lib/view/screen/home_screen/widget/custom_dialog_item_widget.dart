import 'dart:io';

import 'package:app/controller/cart_controller.dart';
import 'package:app/data/model/cart_model.dart';
import 'package:app/data/model/item_by_inventory_model.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:app/view/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../funaction.dart';
import '../../../widget/customButton.dart';

class CustomDialogItem extends StatefulWidget {
  const CustomDialogItem({
    super.key,
    required this.dataItem,
  });

  final DataItem dataItem;

  @override
  _CustomDialogItemState createState() => _CustomDialogItemState();
}

class _CustomDialogItemState extends State<CustomDialogItem> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final double defaultPrice = 0.0;
  final double defaultQuantity = 1;

  @override
  void initState() {
    super.initState();
 //   _priceController.text = 0.toString();
    _quantityController.text = defaultQuantity.toString();

    _priceController.addListener(_onPriceChanged);
    _quantityController.addListener(_onQuantityChanged);
  }

  @override
  void dispose() {
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  // When the price changes, update the quantity if necessary
  void _onPriceChanged() {
    // Optional logic for price changes
  }

  // When the quantity changes, ensure it is at least 1
  void _onQuantityChanged() {
    double quantity = double.tryParse(_quantityController.text) ?? defaultQuantity;

    if (quantity <= 0) {
      // Enforce a minimum quantity of 1
      _quantityController.text = '1';
    }
  }
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: .7.sw,
          height: .7.sw,
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: CustomTextInput(
                    focusNode: _focusNode,
                    keyboardType: Platform.isIOS? TextInputType.numberWithOptions(decimal: true,signed: true):TextInputType.number,
                    textInputAction: TextInputAction.done,
                    inputFormatters: allowSingleDecimalInput(),
                    text: "Price".tr,
                    exText: "0.00",
                    showBorder: true,
                    textEditingController: _priceController,
                    onChangeText:  (value) {


                      if (value.isEmpty) {

                        _priceController.text = '0'; // Automatically set to '0' when empty
                      }


                      _quantityController.text = ((double.tryParse(_priceController.text) ?? defaultQuantity)/(widget.dataItem.priceSale!)).toStringAsFixed(2);
                    },
                    // Attach price controller
                  ),
                ),
                Expanded(
                  child: CustomTextInput(
                    keyboardType: Platform.isIOS? TextInputType.numberWithOptions(decimal: true,signed: true):TextInputType.number,
                    inputFormatters: allowSingleDecimalInput(),
                    isEnabled: false,


                    text: "Quantity".tr,
                    exText: "0.00",
                    showBorder: true,
                    textEditingController: _quantityController,
                    onChangeText:   (value) {

                      if (value.isEmpty) {
                        _quantityController.text = '1'; // Automatically set to '0' when empty
                      }
                    },
                    // Attach quantity controller
                  ),
                ),
                GetBuilder<CartController>(
                  builder: (cartController) => CustomButton(
                    text:"Add to cart".tr,
                    onPress: () {
                      final double price = double.tryParse(_priceController.text) ?? defaultPrice;
                      final double quantity = double.tryParse(_quantityController.text) ?? defaultQuantity;
  if(_priceController.text!="0" && _quantityController.text.isNotEmpty ) {
    CartItem item = CartItem.calculate(
      id: widget.dataItem.itemId!,
      // Assuming you have an ID from `DataItem`
      price: double.parse(widget.dataItem.priceSale!.toStringAsFixed(2)),
      priceWithVat: double.parse(widget.dataItem.priceSale!.toStringAsFixed(2)),
      priceIncludeVat: widget.dataItem.priceIncludeVat!,
      unitId: widget.dataItem.unitItemId.toString(),
      // You can replace this with actual unitId from `DataItem`
      description: "add from logix POS",
      // Assuming `DataItem` has a name
      quantity: quantity,

      discountRate: 0.0,
      // Discount per item
      vat: 15.0,
      name: widget.dataItem.itemName.toString(),
      // VAT percentage
      name2: widget.dataItem.itemName2.toString(), // VAT percentage
    );

    cartController.addItem(item);
    Get.back();
  }else{
    showCustomSnackBar("الرجاء إدخال قيمة أكبر من 0");


  }

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
