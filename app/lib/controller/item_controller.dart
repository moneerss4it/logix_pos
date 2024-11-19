


import 'dart:convert';
import 'package:app/data/api/api_checker.dart';
import 'package:app/data/model/item_by_inventory_model.dart';
import 'package:app/data/repository/item_repo.dart';
import 'package:app/view/widget/custom_snackbar.dart';
import 'package:get/get.dart';

import '../data/model/sale_of_points_model.dart';



class ItemController extends GetxController implements GetxService {
  final ItemRepo repo;
  ItemController({required this.repo}) {

  }

  ItemByInventoryModel _itemByInventoryModel=ItemByInventoryModel();
  SalesPointsModel  _salesPointsModel=SalesPointsModel();
  DataSalesPoints _dataSalesPoints=DataSalesPoints();
  bool get running => _running;
  ItemByInventoryModel get itemByInventoryModel  => _itemByInventoryModel;
  SalesPointsModel get salesPointsModel => _salesPointsModel;
  DataSalesPoints get dataSalesPoints =>  _dataSalesPoints;

  bool _running = false;



    onPrint() {
    _running = _running ? false : true;
    update();
  }

    Future<void> getItems(bool isRunning,int inverntory) async {

    _running=isRunning;



     if (repo.isGetItemByInventory()) {
       _itemByInventoryModel=(await repo.loadItemByInventory())!;
       _running = false;
       update();


   }
     Response response =  await repo.getItems(inverntory==0?_dataSalesPoints.inventoryId!:inverntory);
     if(response.statusCode == 200) {
       var jsonResponse =response.body;

       ItemByInventoryModel itemByInventoryModel =ItemByInventoryModel.fromJson(jsonResponse);
       if(itemByInventoryModel.success==true){
         _itemByInventoryModel=itemByInventoryModel;
         repo.saveItemByInventory(itemByInventoryModel);
       }
       else{
         showCustomSnackBar(itemByInventoryModel.message.toString());
       }
       _running = false;
     }else {
       if(_itemByInventoryModel.data==null){
       ApiChecker.checkApi(response);
     }}

    update();
  }

       saveDataSalesPoints(DataSalesPoints data) async {
        repo.saveDataSalesPoints(data);
        update();
      }

  bool isGetDataSalesPoints() {
    return repo.isGetDataSalesPoints();
  }

  loadDataSalesPoints() async {
        _dataSalesPoints=await repo.loadDataSalesPoints();
        update();
      }
  Future<void> getSalesPoint(bool isRunning) async {

    _running=isRunning;
    Response response =  await repo.getSalesPoint();
    if(response.statusCode == 200) {
      var jsonResponse =response.body;

      SalesPointsModel salesPointsModel =SalesPointsModel.fromJson(jsonResponse);
      if(salesPointsModel.success==true){
        _salesPointsModel=salesPointsModel;

      }
      else{
        showCustomSnackBar(salesPointsModel.message.toString());
      }
      _running = false;
    }else {
      ApiChecker.checkApi(response);
    }
    update();
  }




}