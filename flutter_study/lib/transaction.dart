import 'package:flutter/material.dart';

class Transaction {
  String content;
  double amount;
  DateTime createDate;

  // contructor
  Transaction({this.content, this.amount, this.createDate});

  @override
  String toString() {
    return 'content: $content, amount: $amount';
  }
}
