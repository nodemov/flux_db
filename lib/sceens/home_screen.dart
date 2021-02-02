import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flux_db/models/Transactions.dart';
import 'package:flux_db/providers/transaction_provider.dart';
// import 'package:flux_db/sceens/form_sceen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final String title = 'แอพบัญชี';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app_outlined),
              onPressed: () {
                SystemNavigator.pop();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return FormSceen();
                //   }),
                // );
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
