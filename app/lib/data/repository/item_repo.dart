


import 'dart:convert';

import 'package:app/data/api/api_client.dart';
import 'package:app/data/model/item_by_inventory_model.dart';
import 'package:app/data/model/sale_of_points_model.dart';
import 'package:app/helper/utill/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  ItemRepo({required this.apiClient, required this.sharedPreferences});


  Future<Response> getItems(int inverntory) async {
    return apiClient.getData("${AppConstants.GET_ITEM_URL}?inverntory=$inverntory");
  }
  Future<Response> getSalesPoint() async {
    return apiClient.getData(AppConstants.GET_SALES_POINT_URL);
  }

  Future<Response> isGetSalesPoint() async {
    return apiClient.getData(AppConstants.GET_SALES_POINT_URL);
  }


  Future<void> saveDataSalesPoints(DataSalesPoints data) async {
    String jsonString = jsonEncode(data.toJson()); //--------------------- // Convert object to JSON string
    await sharedPreferences.setString(AppConstants.DATA_SALES_POINTS, jsonString);  // Save the string in shared preferences
  }
  bool isGetDataSalesPoints() {
    return sharedPreferences.containsKey(AppConstants.DATA_SALES_POINTS);
  }

  Future<DataSalesPoints> loadDataSalesPoints() async {
    String? jsonString = await sharedPreferences.getString(AppConstants.DATA_SALES_POINTS);  // Retrieve the string from shared preferences
       if(jsonString==null) return DataSalesPoints();
      Map<String, dynamic> jsonMap = json.decode(jsonString);  // Convert string back to map
      DataSalesPoints data = DataSalesPoints.fromJson(jsonMap);  // Convert map to object
      return data;
  }


  // Save ItemByInventoryModel object to SharedPreferences
  Future<void> saveItemByInventory(ItemByInventoryModel itemByInventory) async {
    String jsonString = jsonEncode(itemByInventory.toJson()); // Convert ItemByInventoryModel object to JSON string
    await sharedPreferences.setString(AppConstants.ITEM_BY_INVENTORY, jsonString); // Save JSON string in SharedPreferences
  }

  // Load ItemByInventoryModel object from SharedPreferences
  Future<ItemByInventoryModel?> loadItemByInventory() async {
    String? jsonString = sharedPreferences.getString(AppConstants.ITEM_BY_INVENTORY); // Retrieve JSON string from SharedPreferences
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString); // Convert JSON string back to map
      return ItemByInventoryModel.fromJson(jsonMap); // Convert map to ItemByInventoryModel object
    }
    return null; // Return null if no data found
  }
 bool isGetItemByInventory() {
    return sharedPreferences.containsKey(AppConstants.ITEM_BY_INVENTORY);
  }



  // Remove ItemByInventoryModel from SharedPreferences
  Future<void> removeItemByInventory() async {
    await sharedPreferences.remove(AppConstants.ITEM_BY_INVENTORY); // Remove data from SharedPreferences
  }


}
