import 'package:flutter/cupertino.dart';

import '../models/register_request_model.dart';

class UserProviders extends ChangeNotifier {
  RegisterRequestModel _user = RegisterRequestModel(
      email: '', password: '', firstName: '', lastName: '', phoneNumber: '');
  RegisterRequestModel get user => _user;
  void setUser(String user) {
    _user = RegisterRequestModel.from(user);
    notifyListeners();
  }
}
