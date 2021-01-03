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
    _transaction.createDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(labelText: 'Amount(money)'),
                  controller: _amountController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.amount = double.tryParse(text) ?? 0;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                            color: Colors.deepOrangeAccent,
                            child: Text(
                              'Cancel',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                            color: Colors.lightGreen,
                            child: Text(
                              'Save',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                this._insertTransaction();
                              });
                              // dismiss after inserting
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaction manager"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                this._onButtonShowModalSheet();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        tooltip: 'Add transactions',
        child: Icon(Icons.add),
        onPressed: () {
          this._onButtonShowModalSheet();
        },
      ),
      key: _scaffoldKey,
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              ButtonTheme(
                height: 50,
                child: FlatButton(
                  child: Text(
                    'Insert Transaction',
                    style: TextStyle(fontSize: 18, fontFamily: 'Pacifico'),
                  ),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  onPressed: () {
                    this._onButtonShowModalSheet();
                  },
                ),
              ),
              TransactionList(transactions: _transactions)
            ],
          ),
        ),
      ),
    );
  }
}
