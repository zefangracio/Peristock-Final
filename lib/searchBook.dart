import 'package:flutter/material.dart';
import 'package:peristock/models/bookDetail.dart';
import 'package:peristock/itemlist.dart';
import 'services/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart' as scanner;
import 'package:peristock/constants.dart';

import 'models/master.dart';

class SearchBook extends StatefulWidget {
  @override
  _SearchBookState createState() => new _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  Widget appBarTitle = new Text(
    "Search Book",
    style: new TextStyle(color: Colors.white),
  );
  Icon scan = new Icon(
    Icons.qr_code_scanner,
    color: Colors.white,
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  Master searchresult = new Master();
  

  _SearchListExampleState() {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        appBar: buildAppBar(context),
        body: new Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Flexible(
                  child: searchresult != null && searchresult.products != null
                      ? new ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchresult.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ItemList(
                                          isbn: searchresult
                                              .products[index].isbn)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8
                                      ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.4),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 2))
                                      ],
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all()
                                      ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              searchresult
                                                  .products[index].judul,
                                              style: TextStyle(
                                                //fontFamily: 'RobotoMono',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "ISBN : " +
                                                  searchresult
                                                      .products[index].isbn,
                                              style: TextStyle(
                                                  //fontFamily: 'RobotoMono',
                                                  fontSize: 16),
                                            )
                                          ]),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Author : " +
                                                  searchresult
                                                      .products[index].author,
                                              style: TextStyle(
                                                  fontSize: 16),
                                            )
                                          ])
                                    ],
                                  ),
                                ));
                          },
                        )
                      : new Container()),
            ],
          ),
        ));
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: kPrimaryColor,
        actions: <Widget>[
          new IconButton(
            icon: scan,
            onPressed: () async {
              String barcode = await _scan();
              searchOperation(barcode);
              setState(() {
                if (this.icon.icon == Icons.qr_code_scanner) {}
              });
            },
          ),
          new IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (this.icon.icon == Icons.search) {
                  this.icon = new Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = new TextField(
                    controller: _controller,
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.white),
                        hintText: "Search Title, ISBN or Author...",
                        hintStyle: new TextStyle(
                            color: Colors.white.withOpacity(0.5))),
                    onSubmitted: searchOperation,
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "Search Book",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    print(searchText);
    if (searchresult != null && searchresult.products != null) {
      setState(() {
        searchresult.products.clear();
      });
    }
    if (_isSearching != null) {
      Services.searchProducts(searchText).then((value) {
        print("Hasil Search : " + value.toString());
        setState(() {
          this.searchresult = value;
        });
      }).catchError((error) {
        print("print error : " + error.toString());
      });
    }
  }

  Future<String>_scan() async{
    return await scanner.FlutterBarcodeScanner.scanBarcode('#000000', 'Cancel', true, scanner.ScanMode.BARCODE);
  }
}
