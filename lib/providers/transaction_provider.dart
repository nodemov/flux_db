import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_db/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  //example data
  List<Transaction> transactions = [];
  // Transaction(title: "เสื้อ", amount: 500, date: DateTime.now()),

  //fetch data
  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    //add last items
    // transactions.add(statement);

    //add first items
    transactions.insert(0, statement);

    // notify consumer
    notifyListeners();
  }
}
