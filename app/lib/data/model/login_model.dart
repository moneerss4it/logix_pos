class LoginModel {
  String? erpUrl;
  bool? showTicket;
  bool? showPreject;
  bool? showSales;
  bool? showRealEstate;
  String? token;

  LoginModel(  this._isSuccess,
      {this.erpUrl,
    required  this.message,

        this.showTicket,
        this.showPreject,
        this.showSales,
        this.showRealEstate,
        this.token});
  bool _isSuccess=false;
  late  final String message;
  bool get isSuccess => _isSuccess;
  LoginModel.fromJson(Map<String, dynamic> json) {
    erpUrl = json['erpUrl'];
    showTicket = json['showTicket'];
    showPreject = json['showPreject'];
    showSales = json['showSales'];
    showRealEstate = json['showRealEstate'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['erpUrl'] = this.erpUrl;
    data['showTicket'] = this.showTicket;
    data['showPreject'] = this.showPreject;
    data['showSales'] = this.showSales;
    data['showRealEstate'] = this.showRealEstate;
    data['token'] = this.token;
    return data;
  }
}

class LoginErrorModel {
  LoginErrorModel({
    required this.message,
  });

  late final String message;

  LoginErrorModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }
}
