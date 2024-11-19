

class GenerateTokenModel

{
  String? userId;
  String? token;

  GenerateTokenModel({this.userId, this.token});


  GenerateTokenModel.fromJson(Map<String, dynamic> json) {
    userId = json['useR_ID'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['useR_ID'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}