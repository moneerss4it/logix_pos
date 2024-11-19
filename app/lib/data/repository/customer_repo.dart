


import 'dart:convert';

import 'package:app/data/api/api_client.dart';
import 'package:app/data/model/customer_model.dart';
import 'package:app/data/model/item_by_inventory_model.dart';
import 'package:app/data/model/sale_of_points_model.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  CustomerRepo({required this.apiClient, required this.sharedPreferences});


  Future<Response> getCustomers() async {
    return apiClient.getData(AppConstants.GET_CUSTOMER_URL);
  }





  // Save ItemByInventoryModel object to SharedPreferences
  Future<void> saveItemByInventory(CustomerModel customer) async {
    String jsonString = jsonEncode(customer.toJson()); // Convert ItemByInventoryModel object to JSON string
    await sharedPreferences.setString(AppConstants.DATA_CUSTOMER, jsonString); // Save JSON string in SharedPreferences
  }

  // Load ItemByInventoryModel object from SharedPreferences
  Future<CustomerModel?> loadCustomers() async {
    String? jsonString = sharedPreferences.getString(AppConstants.DATA_CUSTOMER); // Retrieve JSON string from SharedPreferences
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString); // Convert JSON string back to map
      return CustomerModel.fromJson(jsonMap); // Convert map to ItemByInventoryModel object
    }
    return null; // Return null if no data found
  }
  bool isGetCustomers() {
    return sharedPreferences.containsKey(AppConstants.DATA_CUSTOMER);
  }



  // Remove ItemByInventoryModel from SharedPreferences
  Future<void> removeCustomers() async {
    await sharedPreferences.remove(AppConstants.DATA_CUSTOMER); // Remove data from SharedPreferences
  }


}
