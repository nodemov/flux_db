import 'package:flutter/material.dart';
import 'package:flux_db/models/Transactions.dart';
import 'package:flux_db/sceens/form/form_sceen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'providers/transaction_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'แอพบัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

@override
void initState(){
  super.initState();
  Provider.of<TransactionProvider>(context,listen: false).initData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormSceen();
                }));
              }),
        ],
      ),
      body: Consumer(
          builder: (context, TransactionProvider provider, Widget child) {
        var count = provider.transactions.length;
        if (count <= 0) {
          return Center(
            child: Text(
              'ไม่พบข้อมูล',
              style: TextStyle(fontSize: 32, color: Colors.red),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: count,
              itemBuilder: (context, int index) {
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: FittedBox(
                        child: Text(
                          data.amount.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      radius: 30,
                    ),
                    title: Text(data.title.toString()),
                    subtitle: Text(
                        DateFormat("dd/MM/yyyy 'created at' HH:mm:ss ")
                            .format(data.date)),
                  ),
                  // elevation: ,
                );
              });
        }
      }),
    );
  }
}
