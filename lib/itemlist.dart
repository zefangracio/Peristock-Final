import 'package:flutter/material.dart';
import 'services/services.dart';
import 'models/bookDetail.dart';

class ItemList extends StatefulWidget {
  final String isbn;
  ItemList({@required this.isbn}) : super();

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  // List<Stock> stock = List<Stock>.empty(growable: true);
  BookDetail book = BookDetail();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    const judul = 'Web Images';
    return MaterialApp(
      title: judul,
      home: Scaffold(
          body: Container(
              child: FutureBuilder(
        future: Services.getProduct(widget.isbn),
        builder: (context, snapshot) {
          print("snapshot " + snapshot.data.toString());
          if (snapshot.hasData) {
            return Align(
                alignment: Alignment.topCenter,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(40),
                      child: Image.network(
                          'https://st.xsm.us/c/b/${snapshot.data.product.isbn}'),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: Offset(1, 2))
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all()),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    snapshot.data.product.judul,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  )
                                ]),
                                Table(
                                  //border: TableBorder(horizontalInside: BorderSide()),
                                  
                                  columnWidths: {
                                    0: FlexColumnWidth(1),
                                    1: FlexColumnWidth(2.25)
                                  },
                                  children: [
                                    TableRow(
                                    
                                      children: <Widget>[
                                      Container(child: Text("  ISBN")),
                                      Container(
                                        child: Text(
                                            ": " + snapshot.data.product.isbn),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Author")),
                                      Container(
                                        child: Text(": " +
                                            snapshot.data.product.author),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Kode Barang")),
                                      Container(
                                        child: Text(
                                            ": " + snapshot.data.product.kdbrg),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Publisher")),
                                      Container(
                                        child: Text(": " +
                                            snapshot.data.product.publisher),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Harga")),
                                      Container(
                                        child: Text(
                                            ": " + snapshot.data.product.harga),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Sgroup")),
                                      Container(
                                        child: Text(": " +
                                            snapshot.data.product.sgroup),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Kelas")),
                                      Container(
                                        child: Text(
                                            ": " + snapshot.data.product.kelas),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      Container(child: Text("  Umur")),
                                      Container(
                                        child: Text(": " +
                                            snapshot.data.product.umur
                                                .toString()),
                                      )
                                    ]),
                                    TableRow(children: <Widget>[
                                      TableCell(
                                        child: Text("  Location")),
                                     // Container(child: Text("  Location")),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          for(var i in snapshot.data.product.item)
                                          Text(" " +
                                              i.location.toString() +
                                              " : " +
                                              i.stock.toString()),
                                        ],
                                      )
                                    ]),
                                  ],
                                ),
                              ]),
                        ))
                  ],
                ));
          } else {
            return Container(
              child: Text("Loading"),
            );
          }
        },
      ))),
    );
  }
}
