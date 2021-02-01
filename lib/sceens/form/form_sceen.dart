import 'package:flutter/material.dart';

class FormSceen extends StatelessWidget {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.name,
              decoration: new InputDecoration(
                labelText: 'ชื่อรายการ',
              ),
            ),
            TextFormField(
               keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                labelText: 'จำนวนเงิน',
              ),
            ),
            FlatButton(
              child: Text('เพิ่มข้อมูล'),
              color: Colors.orange,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )),
      ),
    );
  }
}
