


class ChangeLanguageModel {
  String? value;
  String? name;

  ChangeLanguageModel({this.value, this.name});

  ChangeLanguageModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];

   }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['name'] = name;
    return data;
  }
}