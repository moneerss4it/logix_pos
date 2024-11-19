

class CustomerModel {
  bool? success;
  List<DataOfCustomer>? data;
  String? message;

  CustomerModel({this.success, this.data, this.message});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataOfCustomer>[];
      json['data'].forEach((v) {
        data!.add(new DataOfCustomer.fromJson(v));
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

class DataOfCustomer {
  int? id;
  String? code;
  String? name;
  String? name2;
  String? idNo;
  String? email;
  String? address;
  String? mobile;
  String? createdOn;
  String? createdDate;
  int? salesType;
  int? empId;

  DataOfCustomer(
      {this.id,
        this.code,
        this.name,
        this.name2,
        this.idNo,
        this.email,
        this.address,
        this.mobile,
        this.createdOn,
        this.createdDate,
        this.salesType,
        this.empId});

  DataOfCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    name2 = json['name2'];
    idNo = json['idNo'];
    email = json['email'];
    address = json['address'];
    mobile = json['mobile'];
    createdOn = json['createdOn'];
    createdDate = json['createdDate'];
    salesType = json['salesType'];
    empId = json['empId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['name2'] = this.name2;
    data['idNo'] = this.idNo;
    data['email'] = this.email;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    data['createdOn'] = this.createdOn;
    data['createdDate'] = this.createdDate;
    data['salesType'] = this.salesType;
    data['empId'] = this.empId;
    return data;
  }
}
