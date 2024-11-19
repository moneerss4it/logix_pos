


import 'dart:async';

import 'package:app/data/model/cart_model.dart';
import 'package:app/data/model/master_model.dart';
import 'package:app/data/repository/cart_repo.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:get/get.dart';

class CartController extends GetxController  implements GetxService {

  final CartRepo repo;
  CartController({required this.repo});



  int selectedPayment = 2;  // Default value (e.g., 'اجل')

  void selectPayment(int payment) {
    selectedPayment = payment;
    update();  // Notify listeners of the change
  }


  var cartItems = <CartItem>[];

  // Method to add items to the cart
  void addItem(CartItem item) {
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);

    if (index != -1) {
      // If the item exists, return a message
      showCustomSnackBar("الصنف موجود بالفعل في السلة", isError: true);
    } else {
      // If the item does not exist, add it to the cart
      cartItems.add(item);
      update(); // Notify listeners
     // showCustomSnackBar("تمت الاضافة بنجاح", isError: false);
    }// Notify listeners
  }
  int InvId = 0;
  Future<void> getLastInvoice(int id) async {

    Response response = await  repo.getLastInvoice(id);
    print(response.statusCode);
    if(response.statusCode==200){
      print(response.body);
      var jsonResponse =response.body;
      InvId = jsonResponse['data']; // Assuming the response contains an 'invId' key with the value of the last InvId
     repo.saveLastInvoice(InvId);

  }}

  getLastInvoiceID() {
    return repo.getLastInvoiceID();
  }

  void updateItem(CartItem item,double quantity) {
    // Find the index of the item with the same id
    int index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);

           print(item.vatAmount);
           print(item.price);

    CartItem updateItem= CartItem.calculate(
      id: item.id, // Assuming you have an ID from `DataItem`
      price:item.priceIncludeVat?item.priceWithVat: item.price,
      priceIncludeVat: item.priceIncludeVat,
      unitId:item.unitId.toString(), // You can replace this with actual unitId from `DataItem`
      description: "add from logix POS", // Assuming `DataItem` has a name
      quantity: quantity,
      discountRate: 0.0, // Discount per item
      vat: 15.0,

      name:item.name.toString(), // VAT percentage
      name2: item.name2.toString(),
      priceWithVat: item.priceWithVat, // VAT percentage
    );
      // Update the item's quantity and price if it exists
      cartItems[index] = updateItem;

   // CartItem.calculate()

      update(); // Notify listeners

  }


  // Method to remove an item from the cart
  void removeItem(CartItem item) {
    cartItems.remove(item);
    update();
  }

  // Method to clear the cart
  void clearCart() {
    cartItems.clear();
    update();
  }
  updateMaster(Master master) async {
    await repo.updateMaster(master);
    loadMaster();
    update();
  }




  List<Master> _master = [];
  List<Master> get master => _master;
  List<Master> _masterFilter = [];
  List<Master> get masterFilter => _masterFilter;
saveMaster(Master masters) async {
 await repo.addMaster(masters);
  clearCart();
  update();
}

setPosting(bool value) async {
  _masterFilter = await repo.loadMasters();
  _masterFilter=_masterFilter.reversed.where((m) => m.isPosting==value).toList();
  update();
}
  double totalCash=0.0;
  double bankAmount=0.0;
  double totalInvoices=0.0;
  double forward=0.0;
  String? lastCode;
loadMaster() async {
  totalCash = 0.0;
  bankAmount = 0.0;
  totalInvoices = 0.0;
  forward=0.0;
  _master = await repo.loadMasters();
  lastCode=_master.last.code.toString();

  _master=_master.reversed.where((m) => m.isPosting==false).toList();
  _masterFilter=_master;
  for (var master in _master) {
    print(" master ${master.vatAmount}");
    print(master.vatAmount);
    if (master.paymentTermsId == '1') {
      totalCash += (double.tryParse(master.cashAmount) ?? 0.0  );
    }
    if (master.paymentTermsId == '2') {
      bankAmount += (double.tryParse(master.bankAmount) ?? 0.0);
      print(bankAmount);
    }
    if(master.paymentTermsId=='4'){
      forward+=(double.tryParse(master.forward)??0.0) ;
    }
    totalInvoices += (double.tryParse(master.total) ?? 0.0) +( double.tryParse(master.vatAmount) ?? 0.0);
  update();
}}



  // Total calculation
  double get totalAmount => cartItems.fold(0.0, (sum, item) => sum + item.total);
   double get totalAmountWithVat => cartItems.fold(0.0, (sum, item) => sum + item.total+ item.vatAmount);
   double get _totalVatAmount =>cartItems.fold(0.0, (sum, item) => (sum + item.vatAmount));
  double get totalVatAmount =>_totalVatAmount;


  var progress = 0.0;  // No need for .obs since we're using GetBuilder


  void startPosting(int totalItems) {
    progress = 0.0;
    update();  // Notify listeners for rebuild

    // Simulating item posting
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (progress < totalItems) {
        progress++;
        update();  // Notify listeners after updating progress
      } else {
        timer.cancel();
      }
    });
  }

}