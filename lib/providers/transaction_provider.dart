import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_db/databases/transaction_db.dart';
import 'package:flux_db/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  //example data
  List<Transactions> transactions = [];
  // Transaction(title: "เสื้อ", amount: 500, date: DateTime.now()),

  //fetch data
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = await TranscationDB(dbName: 'transaction.db').openDatabase();
    print(db);

    //add last items
    // transactions.add(statement);

    //add first items
    transactions.insert(0, statement);

    // notify consumer
    notifyListeners();
  }
}
