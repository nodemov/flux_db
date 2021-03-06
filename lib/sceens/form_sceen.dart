import 'package:flutter/material.dart';
import 'package:flux_db/main.dart';
import 'package:provider/provider.dart';
import '../models/Transactions.dart';
import '../providers/transaction_provider.dart';

class FormSceen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

//controller
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียด"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            scrollDirection: Axis.vertical,
            children: [
              TextFormField(
                controller: titleController,
                autofocus: true,
                validator: (String str) {
                  if (str.isEmpty) {
                    return "กรุณาป้อนชื่อรายการด้วย";
                  }

                  return null;
                },
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(
                  labelText: 'ชื่อรายการ',
                ),
              ),
              TextFormField(
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (String str) {
                  if (str.isEmpty) {
                    return "กรุณาป้อนจำนวนเงิน";
                  }
                  if (double.parse(str) <= 0) {
                    return "กรุณาป้อน ตัวเลขมากกว่า 0";
                  }
                  return null;
                },
                decoration: new InputDecoration(
                  labelText: 'จำนวนเงิน',
                ),
              ),
              SizedBox(height: 12.0),
              FlatButton(
                child: Text('เพิ่มข้อมูล'),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;

                    //init data
                    Transactions statement = Transactions(
                        title: title,
                        amount: double.parse(amount),
                        date: DateTime.now());

                    // call provider
                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);

                    // Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return MyHomePage();
                          }),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
