class ItemByInventoryModel {
  bool? success;
  List<DataItem>? data;
  String? message;

  ItemByInventoryModel({this.success, this.data, this.message});

  ItemByInventoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data!.add(new DataItem.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class DataItem {
  String? inventoryName;
  int? id;
  int? itemId;
  int? inventoryId;
  double? reOrderLevel;
  double? reOrderQty;
  int? requestType;
  int? createdBy;
  String? createdOn;

  bool? isDeleted;
  int? branchId;
  String? branchsId;
  int? catId;
  String? itemCode;
  String? itemName;
  String? itemName2;
  bool? priceIncludeVat;
  String? sku;
  double? priceSale;
  double? purchasePrice;
  int? valuationCosting;
  int? unitItemId;

  DataItem(
      {this.inventoryName,
        this.id,
        this.itemId,
        this.inventoryId,
        this.reOrderLevel,
        this.reOrderQty,
        this.requestType,
        this.createdBy,
        this.createdOn,

        this.isDeleted,
        this.branchId,
        this.branchsId,
        this.catId,
        this.itemCode,
        this.itemName,
        this.itemName2,
        this.priceIncludeVat,
        this.sku,
        this.priceSale,
        this.purchasePrice,
        this.unitItemId,
        this.valuationCosting});

  DataItem.fromJson(Map<String, dynamic> json) {
    inventoryName = json['inventoryName'];
    id = json['id'];
    itemId = json['itemId'];
    inventoryId = json['inventoryId'];
    reOrderLevel = json['reOrderLevel'];
    reOrderQty = json['reOrderQty'];
    requestType = json['requestType'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];

    isDeleted = json['isDeleted'];
    branchId = json['branchId'];
    branchsId = json['branchsId'];
    catId = json['catId'];
    itemCode = json['itemCode'];
    unitItemId = json['unitItemId'];
    itemName = json['itemName'];
    itemName2 = json['itemName2'];
    priceIncludeVat = json['priceIncludeVat'];
    sku = json['sku'];
    priceSale = json['priceSale'];
    purchasePrice = json['purchasePrice'];
    valuationCosting = json['valuationCosting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inventoryName'] = this.inventoryName;
    data['id'] = this.id;
    data['itemId'] = this.itemId;
    data['inventoryId'] = this.inventoryId;
    data['reOrderLevel'] = this.reOrderLevel;
    data['reOrderQty'] = this.reOrderQty;
    data['requestType'] = this.requestType;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;

    data['isDeleted'] = this.isDeleted;
    data['branchId'] = this.branchId;
    data['branchsId'] = this.branchsId;
    data['catId'] = this.catId;
    data['itemCode'] = this.itemCode;
    data['unitItemId'] = this.unitItemId;
    data['itemName'] = this.itemName;
    data['itemName2'] = this.itemName2;
    data['priceIncludeVat'] = this.priceIncludeVat;
    data['sku'] = this.sku;
    data['priceSale'] = this.priceSale;
    data['purchasePrice'] = this.purchasePrice;
    data['valuationCosting'] = this.valuationCosting;
    return data;
  }
}
