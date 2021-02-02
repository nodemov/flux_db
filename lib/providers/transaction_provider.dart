import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_db/database/transaction_db.dart';
import 'package:flux_db/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  //example data
  List<Transactions> transactions = [];
  // Transaction(title: "เสื้อ", amount: 500, date: DateTime.now()),

  //fetch data
  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData() async {
    var db = TranscationDB(dbName: 'transaction.db');
    transactions = await db.loadAllData();
    notifyListeners();

  }

  void addTransaction(Transactions statement) async {
    // var db = await TranscationDB(dbName: 'transaction.db').openDatabase();
    // print(db);

    //add last items
    // transactions.add(statement);
    var db = TranscationDB(dbName: 'transaction.db');
    await db.insertData(statement);

    //add first items

//fetch data
    transactions = await db.loadAllData();
    // transactions.insert(0, statement);

    // notify consumer
    notifyListeners();
  }
}
