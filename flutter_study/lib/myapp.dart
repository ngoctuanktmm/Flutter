import 'package:flutter/material.dart';
import 'package:flutter_study/transaction.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  // define states
  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildWidgetList() {
      int index = 0;
      return _transactions.map((eachTransaction) {
        index++;
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: (index % 2) == 0 ? Colors.blue : Colors.lightGreen,
          elevation: 10,
          child: ListTile(
            leading: const Icon(Icons.access_alarm),
            title: Text(eachTransaction.content,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white)),
            subtitle: Text(
              'Price: ${eachTransaction.amount}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onTap: () {
              print('Your clicked: ${eachTransaction.content}');
            },
          ),
        );
      }).toList();
    }

    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: _contentController,
                onChanged: (text) {
                  setState(() {
                    _transaction.content = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount(money)'),
                controller: _amountController,
                onChanged: (text) {
                  setState(() {
                    _transaction.amount = double.tryParse(text) ?? 0;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              ButtonTheme(
                height: 50,
                child: FlatButton(
                  child: Text(
                    'Insert Transaction',
                    style: TextStyle(fontSize: 18),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _transactions.add(_transaction);
                      _transaction = Transaction(content: '', amount: 0.0);
                      _contentController.text = '';
                      _amountController.text = '';
                    });

                    print('transaction list: ' + _transactions.toString());
                    // Display to UI
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content:
                          Text('transaction list: ' + _transactions.toString()),
                      duration: Duration(seconds: 3),
                    ));
                  },
                ),
              ),
              Column(
                children: _buildWidgetList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
