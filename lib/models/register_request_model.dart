import 'dart:convert';

class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phoneNumber;
  late final String password;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['phoneNumber'] = phoneNumber;
    _data['password'] = password;
    return _data;
  }

  factory RegisterRequestModel.fromMap(Map<String, dynamic> map) {
    return RegisterRequestModel(
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  factory RegisterRequestModel.from(String source) =>
      RegisterRequestModel.fromMap(json.decode(source));
}
