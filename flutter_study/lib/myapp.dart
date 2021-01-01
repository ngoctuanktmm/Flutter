import 'package:flutter/material.dart';
import 'package:flutter_study/transaction.dart';
import 'package:flutter_study/transaction_list.dart';

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

  void _insertTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Transaction manager"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    this._insertTransaction();
                  });
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transactions',
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              this._insertTransaction();
            });
          },
        ),
        key: _scaffoldKey,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
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
                      color: Colors.brown,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          this._insertTransaction();
                        });

                        print('transaction list: ' + _transactions.toString());
                        // Display to UI
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              'transaction list: ' + _transactions.toString()),
                          duration: Duration(seconds: 3),
                        ));
                      },
                    ),
                  ),
                  TransactionList(transactions: _transactions)
                ],
              ),
            )),
      ),
    );
  }
}
