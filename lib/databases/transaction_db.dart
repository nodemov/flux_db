import 'dart:io';

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
}
