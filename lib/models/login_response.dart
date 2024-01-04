import 'dart:convert';

LoginResponseModel loginResponseJson(String str)=>
  LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.message,
  });
  late final String message;
  
  LoginResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}