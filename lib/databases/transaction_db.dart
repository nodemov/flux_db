import 'dart:io';

import 'package:flux_db/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TranscationDB {
  //services database
  String dbName;

  //if exist? open : create
  TranscationDB({this.dbName});

//dbLocation = /home/laravel/transaction.db  example
//   /data/user/0/com.example.flux_db/app_flutter/transaction.db
  Future<Database> openDatabase() async {
    //find location keep data
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    //create dabase
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

//instert to database
  Future<int> insertData(Transactions statement) async {
    var db = await this.openDatabase();

    //create stores
    var store = intMapStoreFactory.store("expense");

//json
    var keyID = store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date.toIso8601String()
    });

    db.close();
    return keyID;
  }

  //fetch data
  // SortOrder(Field.key,false)  :: desc  = > false //asc = true
  Future<List<Transactions>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));

    //
    List transactionList = List<Transactions>();
    for (var record in snapshot) {
      transactionList.add(Transactions(
          title: record['title'],
          amount: record['amount'],
          date: DateTime.parse(record['date'])));
    }
    print(snapshot); //Future<bool>
    // return true;

    return transactionList;
  }
}
