class ForgetPasswordRequestModel {
  ForgetPasswordRequestModel({
    required this.email,
    required this.password,
  });
  late final String email;
  late final String password;
  
  ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json){
    email = json['email'];
    password = json['newPassword'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['newPassword'] = password;
    return _data;
  }
}