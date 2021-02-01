import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_db/models/Transaction.dart';


class TransactionProvider with ChangeNotifier {
  //example data
  List<Transaction> transactions = [
    Transaction(title: "เสื้อ", amount: 500, date: DateTime.now()),
    Transaction(title: "กางเกง", amount: 300, date: DateTime.now()),
    Transaction(title: "รองเท้า", amount: 900, date: DateTime.now()),

  ];

//fetch data
  List<Transaction> getTransaction(){
    return transactions;
  }

  void addTransaction( Transaction statement){
    return transactions.add(statement);
  }
}
