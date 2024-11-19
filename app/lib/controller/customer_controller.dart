


import 'dart:convert';
import 'package:app/data/api/api_checker.dart';
import 'package:app/data/model/customer_model.dart';
import 'package:app/data/model/item_by_inventory_model.dart';
import 'package:app/data/repository/customer_repo.dart';
import 'package:app/data/repository/item_repo.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:get/get.dart';

import '../data/model/sale_of_points_model.dart';



class CustomerController extends GetxController implements GetxService {
  final CustomerRepo repo;
  CustomerController({required this.repo});

  CustomerModel _customerModel=CustomerModel();

  bool get running => _running;
  CustomerModel get customerModel  => _customerModel;

  bool _running = false;

  RxList<DataOfCustomer> filteredList = RxList<DataOfCustomer>();

  void updateFilteredList(List<DataOfCustomer> newList) {
    filteredList.value = newList;
  }


  Future<void> getCustomers(bool isRunning) async {
    _running = isRunning;


    if (repo.isGetCustomers()) {
      _customerModel = (await repo.loadCustomers())!;

      _running = false;
      update();
    }
    Response response = await repo.getCustomers();
    if (response.statusCode == 200) {
      var jsonResponse = response.body;

      CustomerModel customerModel = CustomerModel.fromJson(jsonResponse);
      if (customerModel.success == true) {
        _customerModel = customerModel;
        repo.saveItemByInventory(_customerModel);
      }
      else {
        showCustomSnackBar(customerModel.message.toString());
      }
      _running = false;
    } else {
      if (_customerModel.data == null) {
        ApiChecker.checkApi(response);
      }

      update();
    }
  }}