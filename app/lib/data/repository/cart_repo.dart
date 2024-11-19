import 'dart:convert'; // For jsonEncode and jsonDecode
import 'package:app/data/api/api_client.dart';
import 'package:app/data/model/master_model.dart'; // Import your Master model
import 'package:app/helper/utill/app_constants.dart'; // Import app constants
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart'; // For Get.find
import 'package:app/controller/auth_controller.dart';

import '../../PrintFile/Invoice/file_helper.dart'; // AuthController to get userId

class CartRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  late final int userId; // Store the userId here

  CartRepo({
    required this.apiClient,
    required this.sharedPreferences,
  }) {
    userId = Get.find<AuthController>().getUserId(); // Initialize userId using GetX
    print("fawazaaaaa");
    print(userId);
  }
  Future<Response>  getLastInvoice(int pos) async {
    return apiClient.getData("${AppConstants.GET_LAST_INVENTORY}?pos=$pos"

    );
  }
  Future<bool>  saveLastInvoice(int pos) async {
    return await sharedPreferences.setInt(AppConstants.INV_ID, pos);
  }
  int getLastInvoiceID() {
    return sharedPreferences.getInt(AppConstants.INV_ID)??0;
  }



  // Save a list of Master objects to SharedPreferences
  Future<void> saveMasters(List<Master> masters) async {
    List<Map<String, dynamic>> jsonList = masters.map((master) => master.toJson()).toList(); // Convert list of Master to list of maps
    String jsonString = jsonEncode(jsonList); // Convert list of maps to JSON string
    await sharedPreferences.setString('${AppConstants.MASTER}_$userId', jsonString); // Save JSON string with user-specific key
  }

  // Load a list of Master objects from SharedPreferences
  Future<List<Master>> loadMasters() async {
    String? jsonString = sharedPreferences.getString('${AppConstants.MASTER}_$userId'); // Retrieve JSON string with user-specific key
    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString); // Convert JSON string back to list of dynamic objects
      return jsonList.map((item) => Master.fromJson(item)).toList(); // Convert list of maps to list of Master objects
    }
    return []; // Return empty list if no data found
  }

  // Add a new Master object to the existing list and save
  // Future<void> addMaster(Master newMaster) async {
  //   List<Master> currentMasters = await loadMasters(); // Load current list of Masters
  //   currentMasters.add(newMaster); // Add the new Master to the list
  //   await saveMasters(currentMasters); // Save the updated list back to SharedPreferences
  // }
  Future<void> addMaster(Master newMaster) async {
    List<Master> currentMasters =
    await loadMasters(); // Load current list of Masters

    if (currentMasters.isNotEmpty) {
      var tempCodeNo = FileHelper.generateUniqueCodeByLastCodeString(
          lastCode: currentMasters.last.code.toString() ?? "");
      newMaster.code = tempCodeNo.code;
      newMaster.no = tempCodeNo.no;
    }

    currentMasters.add(newMaster); // Add the new Master to the list
    await saveMasters(
        currentMasters); // Save the updated list back to SharedPreferences
  }


  // Remove list of Master objects from SharedPreferences
  Future<void> removeMasters() async {
    await sharedPreferences.remove('${AppConstants.MASTER}_$userId'); // Remove data with user-specific key from SharedPreferences
  }

  // Update a specific Master object and save


  Future<void> updateMaster(Master updatedMaster) async {
    List<Master> currentMasters = await loadMasters(); // Load current list of Masters

    // Find the master to be updated by its refranceId and replace it
    for (int i = 0; i < currentMasters.length; i++) {
      if (currentMasters[i].code == updatedMaster.code) {
        currentMasters[i] = updatedMaster; // Replace the existing Master with the updated one
        break; // Exit the loop once the Master is updated
      }
    }

    await saveMasters(currentMasters); // Save the updated list back to SharedPreferences
  }

}

