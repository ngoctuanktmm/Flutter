import 'package:LoginForm/src/blocs/login_blocs.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc = new LoginBloc();

  bool _isShowPassword = false;

  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passWordController = new TextEditingController();

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
                child: StreamBuilder(
                  stream: loginBloc.usernameStream,
                  builder: (context, snapshot) => TextField(
                    controller: _userNameController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        labelText: "USERNAME",
                        errorText: snapshot.hasError ? snapshot.error : null,
                        labelStyle:
                            TextStyle(color: Color(0xff888888), fontSize: 15)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: <Widget>[
                  StreamBuilder(
                    stream: loginBloc.passwordStream,
                    builder: (context, snapshot) => TextField(
                      controller: _passWordController,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_isShowPassword,
                      decoration: InputDecoration(
                          labelText: "PASSWORD",
                          errorText: snapshot.hasError ? snapshot.error : null,
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                    ),
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

      if (loginBloc.isValidInfo(userName, passWord)) {
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
}
