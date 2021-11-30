import 'package:flutter/material.dart';
import 'package:peristock/models/master.dart';
import 'services/services.dart';

class DataTableDemo extends StatefulWidget {
  DataTableDemo() : super();
  final String title = 'Peristock';
  @override
  DataTableDemoState createState() => DataTableDemoState();
}

class DataTableDemoState extends State<DataTableDemo> {
  // Stock stock = new Stock;
  // Master master = new Master;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
  TextEditingController isbnController = new TextEditingController();
  //Stock selectedStock = Stock(isbn: '', bookStock: 1, location: '', binloc: '');
  String titleProgress = 'GET Stock';
  @override
  void initState() {
    super.initState();
    titleProgress = widget.title;
    scaffoldKey = GlobalKey();
    isbnController = TextEditingController();
  }

  //UI
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(titleProgress),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              //Services.getMaster();
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                controller: isbnController,
                decoration: InputDecoration.collapsed(hintText: 'ISBN'),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
