// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:grow_pet/model/user_model.dart';
import 'package:grow_pet/resource/auth_method.dart';

class UserProvider extends ChangeNotifier {
  final AuthMethods _authMethods = AuthMethods();

  UserModel? _user;
  UserModel get getUser => _user!;
  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getDetails();
    _user = user;
    notifyListeners();
  }
}
