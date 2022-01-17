import 'package:flutter/material.dart';
import 'package:instagramclone/utils/allexports.dart';

class UserProvider extends ChangeNotifier {
  Users? _user;

  AuthMethods _authMethods = AuthMethods();

  Users get getUser => _user!;

  Future<void> refreshUser() async {
    Users user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
