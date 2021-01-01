import 'package:flutter/material.dart';

class Transaction {
  String content;
  double amount;

  // contructor
  Transaction({this.content, this.amount});

  @override
  String toString() {
    return 'content: $content, amount: $amount';
  }
}
