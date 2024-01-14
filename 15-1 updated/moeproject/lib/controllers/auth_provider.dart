import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  int? _userId;

  bool get isAuthenticated => _isAuthenticated;
  int? get userId => _userId;

  void authenticateUser(int userId) {
    _isAuthenticated = true;
    _userId = userId;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _userId = null;
    notifyListeners();
  }
}
