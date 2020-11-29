import 'package:LoginForm/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isShowPassword = false;

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();

  bool _isUserNameInvalid = false;
  bool _isPassWordInvalid = false;

  var _userNameError = "Username không hợp lệ";
  var _passWordError = "Password phải lớn hơn 6 ký tự!";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                "Hello\nWelcome Back",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                controller: _userNameController,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: "USERNAME",
                    errorText: _isUserNameInvalid ? _userNameError : null,
                    labelStyle:
                        TextStyle(color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  TextField(
                    controller: _passWordController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: !_isShowPassword,
                    decoration: InputDecoration(
                        labelText: "PASSWORD",
                        errorText: _isPassWordInvalid ? _passWordError : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                  GestureDetector(
                    onTap: onToggleShowHidePassword,
                    child: Text(
                      _isShowPassword ? "HIDE" : "SHOW",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.blue,
                  onPressed: onSignInClicked,
                  child: Text("SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
            Container(
              height: 130,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "NEW USER? SIGN UP",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                  Text(
                    "FORGOT PASSWORD?",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onSignInClicked() {
    setState(() {
      var userName = _userNameController.text;
      var passWord = _passWordController.text;

      if (_isEmail(userName)) {
        _isUserNameInvalid = false;
      } else {
        _isUserNameInvalid = true;
      }

      if (passWord.length >= 6) {
        _isPassWordInvalid = false;
      } else {
        _isPassWordInvalid = true;
      }

      if (!_isUserNameInvalid && !_isPassWordInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }

  void onToggleShowHidePassword() {
    setState(() {
      _isShowPassword = !_isShowPassword;
    });
  }

  bool _isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
}
