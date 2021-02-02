import 'package:flutter/material.dart';
import 'package:flux_db/sceens/form_sceen.dart';
import 'package:flux_db/sceens/home_screen.dart';
import 'package:provider/provider.dart';
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
          home: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.blue[400],
          body: TabBarView(
            children: [
              HomeScreen(),
              FormSceen(),
            ],
          ),
          bottomNavigationBar: TabBar(
            labelColor: Colors.blue,
            tabs: [
              Tab(
                child: Text('รายการธุรกรรม'),
              ),
              Tab(
                child: Text('เพิ่มข้อมูล'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
