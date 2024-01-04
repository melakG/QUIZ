import 'dart:convert';

ForgetPasswordResponseModel registerResponseModel(String str)=>
ForgetPasswordResponseModel.fromJson(json.decode(str));
class ForgetPasswordResponseModel {
  ForgetPasswordResponseModel(String body, {
     this.message,
  });
  late final String ? message;
  
  ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    return _data;
  }
}