class SalesPointsModel {
  bool? success;
  List<DataSalesPoints>? data;
  String? message;


  SalesPointsModel({this.success, this.data, this.message,});

  SalesPointsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataSalesPoints>[];
      json['data'].forEach((v) {
        data!.add(new DataSalesPoints.fromJson(v));
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

class DataSalesPoints {
  int? id;
  String? name;
  int? customerId;
  int? branchId;
  String? customerName;
  int? inventoryId;
  int? facilityId;
  String? facilityName;
  String? facilityName2;
  String? vatNumber;
  String? facilityMobile;
  String? address;
  int? cashAccountId;
  int? lnkAccounting;
  bool? lnkInventory;
  int? bankAccountId;
  int? bankId;

  DataSalesPoints(
      {this.id,
        this.name,
        this.customerId,
        this.branchId,
        this.customerName,
        this.inventoryId,
        this.facilityId,
        this.facilityName,
        this.facilityName2,
        this.vatNumber,
        this.facilityMobile,
        this.address,
        this.cashAccountId,
        this.lnkAccounting,
        this.lnkInventory,
        this.bankAccountId,
        this.bankId});

  DataSalesPoints.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    customerId = json['customerId'];
    branchId = json['branchId'];
    customerName = json['customerName'];
    inventoryId = json['inventoryId'];
    facilityId = json['facilityId'];
    facilityName = json['facilityName'];
    facilityName2 = json['facilityName2'];
    vatNumber = json['vatNumber'];
    facilityMobile = json['facilityMobile'];
    address = json['address'];
    cashAccountId = json['cashAccountId'];
    lnkAccounting = json['lnkAccounting'];
    lnkInventory = json['lnkInventory'];
    bankAccountId = json['bankAccountId'];
    bankId = json['bankId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['customerId'] = this.customerId;
    data['branchId'] = this.branchId;
    data['customerName'] = this.customerName;
    data['inventoryId'] = this.inventoryId;
    data['facilityId'] = this.facilityId;
    data['facilityName'] = this.facilityName;
    data['facilityName2'] = this.facilityName2;
    data['vatNumber'] = this.vatNumber;
    data['facilityMobile'] = this.facilityMobile;
    data['address'] = this.address;
    data['cashAccountId'] = this.cashAccountId;
    data['lnkAccounting'] = this.lnkAccounting;
    data['lnkInventory'] = this.lnkInventory;
    data['bankAccountId'] = this.bankAccountId;
    data['bankId'] = this.bankId;
    return data;
  }
}
