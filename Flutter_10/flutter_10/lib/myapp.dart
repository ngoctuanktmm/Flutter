import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount(money'),
              ),
              FlatButton(
                child: Text('Insert Transaction'),
                textColor: Colors.blue,
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }

}