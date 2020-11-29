import 'dart:async';

import 'package:LoginForm/src/validators/validations.dart';

class LoginBloc {
  var _userNameError = "Username không hợp lệ";
  var _passWordError = "Password phải lớn hơn 6 ký tự!";

  StreamController _usernameController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get usernameStream => _usernameController.stream;

  Stream get passwordStream => _passwordController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidUsername(username)) {
      _usernameController.sink.addError(_userNameError);
      return false;
    }

    _usernameController.sink.add("username OK");

    if (!Validations.isValidPassword(password)) {
      _passwordController.sink.addError(_passWordError);
      return false;
    }

    _passwordController.sink.add("password OK");

    return true;
  }

  void dispose() {
    _usernameController.close();
    _passwordController.close();
  }
}
