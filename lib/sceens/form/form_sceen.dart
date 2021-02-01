import 'package:flutter/material.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
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
                FlatButton(
                  child: Text('เพิ่มข้อมูล'),
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
