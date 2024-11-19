

import 'package:app/data/model/cart_model.dart';

class Master {
  int? no;
  String? code;
  String recipientName;
  String? address;
  String date;
  String dueDate;
  String documentNote;
  String privateNote;
  String inventoryId;
  String? phone;
  String discountRate;
  String discountAmount;
  String vatAmount;
  String vat;
  String subtotal;
  String total;
  String userId;
  bool isPosting;
  String customerId;
  String customerName;
  int sysAppTypeId;
  String posId;
  String transTypeId;
  int refranceId;
  String paymentTermsId;
  String cashAmount;
  String bankAmount;
  String forward;
  bool isRecorded;
  List<CartItem> products;

  Master({
    this.code,
    this.no,
    required this.recipientName,
    this.address,
    required this.date,
    required this.dueDate,
    required this.documentNote,
    required this.privateNote,
    required this.inventoryId,
    this.phone,
    required this.discountRate,
    required this.discountAmount,
    required this.vatAmount,
    required this.vat,
    required this.subtotal,
    required this.total,
    required this.userId,
    required this.customerId,
    required this.customerName,
    required this.sysAppTypeId,
    required this.posId,
    required this.isPosting,
    required this.transTypeId,
    required this.refranceId,
    required this.paymentTermsId,
    required this.cashAmount,
    required this.bankAmount,
    required this.forward,
    required this.isRecorded,
    required this.products,
  });

  // Update specific fields of Master object from a Map
  void updateWith(Map<String, dynamic> updates) {
    if (updates.containsKey('code')) code = updates['code'];
    if (updates.containsKey('no')) code = updates['no'];
    if (updates.containsKey('recipientName')) recipientName = updates['recipientName'];
    if (updates.containsKey('address')) address = updates['address'];
    if (updates.containsKey('date')) date = updates['date'];
    if (updates.containsKey('dueDate')) dueDate = updates['dueDate'];
    if (updates.containsKey('customerName')) dueDate = updates['customerName'];
    if (updates.containsKey('documentNote')) documentNote = updates['documentNote'];
    if (updates.containsKey('privateNote')) privateNote = updates['privateNote'];
    if (updates.containsKey('inventoryId')) inventoryId = updates['inventoryId'];
    if (updates.containsKey('phone')) phone = updates['phone'];
    if (updates.containsKey('discountRate')) discountRate = updates['discountRate'];
    if (updates.containsKey('discountAmount')) discountAmount = updates['discountAmount'];
    if (updates.containsKey('vatAmount')) vatAmount = updates['vatAmount'];
    if (updates.containsKey('vat')) vat = updates['vat'];
    if (updates.containsKey('subtotal')) subtotal = updates['subtotal'];
    if (updates.containsKey('total')) total = updates['total'];
    if (updates.containsKey('userId')) userId = updates['userId'];
    if (updates.containsKey('isPosting')) isPosting = updates['isPosting'];
    if (updates.containsKey('customerId')) customerId = updates['customerId'];
    if (updates.containsKey('sysAppTypeId')) sysAppTypeId = updates['sysAppTypeId'];
    if (updates.containsKey('posId')) posId = updates['posId'];
    if (updates.containsKey('transTypeId')) transTypeId = updates['transTypeId'];
    if (updates.containsKey('refranceId')) refranceId = updates['refranceId'];
    if (updates.containsKey('paymentTermsId')) paymentTermsId = updates['paymentTermsId'];
    if (updates.containsKey('cashAmount')) cashAmount = updates['cashAmount'];
    if (updates.containsKey('bankAmount')) bankAmount = updates['bankAmount'];
    if (updates.containsKey('forward')) forward = updates['forward'];
    if (updates.containsKey('isRecorded')) isRecorded = updates['isRecorded'];
    if (updates.containsKey('products')) {
      products = (updates['products'] as List<dynamic>)
          .map((item) => CartItem.fromJson(item))
          .toList();
    }
  }
  // Convert a Master object to a map
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'no': no,
      'recipientName': recipientName,
      'address': address,
      'date': date,
      'dueDate': dueDate,
      'documentNote': documentNote,
      'privateNote': privateNote,
      'inventoryId': inventoryId,
      'customerName': customerName,
      'phone': phone,
      'discountRate': discountRate,
      'discountAmount': discountAmount,
      'vatAmount': vatAmount,
      'vat': vat,
      'isPosting': isPosting,
      'subtotal': subtotal,
      'total': total,
      'userId': userId,
      'customerId': customerId,
      'sysAppTypeId': sysAppTypeId,
      'posId': posId,
      'transTypeId': transTypeId,
      'refranceId': refranceId,
      'paymentTermsId': paymentTermsId,
      'cashAmount': cashAmount,
      'bankAmount': bankAmount,
      'forward': forward,
      'isRecorded': isRecorded,
      'products': products.map((item) => item.toJson()).toList(),
    };
  }

  // Convert a JSON map to a Master object
  factory Master.fromJson(Map<String, dynamic> json) {
    return Master(
      no: json['no'],
      code: json['code'],
      recipientName: json['recipientName'],
      address: json['address'],
      date: json['date'],
      dueDate: json['dueDate'],
      documentNote: json['documentNote'],
      privateNote: json['privateNote'],
      inventoryId: json['inventoryId'],
      phone: json['phone'],
      discountRate: json['discountRate'],
      discountAmount: json['discountAmount'],
      vatAmount: json['vatAmount'],
      vat: json['vat'],
      subtotal: json['subtotal'],
      customerName: json['customerName'],
      total: json['total'],
      userId: json['userId'],
      isPosting: json['isPosting'],
      customerId: json['customerId'],
      sysAppTypeId: json['sysAppTypeId'],
      posId: json['posId'],
      transTypeId: json['transTypeId'],
      refranceId: json['refranceId'],
      paymentTermsId: json['paymentTermsId'],
      cashAmount: json['cashAmount'],
      bankAmount: json['bankAmount'],
      forward: json['forward'],
      isRecorded: json['isRecorded'],
      products: (json['products'] as List<dynamic>)
          .map((item) => CartItem.fromJson(item))
          .toList(),
    );
  }


}
