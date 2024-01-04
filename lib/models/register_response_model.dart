import 'dart:convert';

RegisterResponseModel registerResponseModel(String str)=>
  RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  RegisterResponseModel(String body, {
     this.message,
  });
  late final String ? message;
  
  RegisterResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}