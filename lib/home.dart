import 'package:flutter/material.dart';

import 'searchBook.dart';
class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Text("Stocks",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    hintText: "Search Stocks",
                    prefix: Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1, style: BorderStyle.none, color: Colors.black
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    )
                  ),
                ),
              ),
            ),
         // BookCard(),
           Card(
             child: InkWell(
               splashColor: Colors.blue.withAlpha(30),
               onTap: (){
                 print("Tapped");
               },
               child: SizedBox(
                    height: MediaQuery.of(context).size.height-250,
                   //child: StockList(stocks: Stock.getAll())
                   ),
             ),
           ), 
            // SizedBox(
            //   height: MediaQuery.of(context).size.height-200,
            //   child: StockList(stocks: Stock.getAll()))
            ]),
          ))
      ]));
  }
}

// class DataSearch extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [IconButton(onPressed: (){
//     print("tapped");
//     }, icon: Icon(Icons.clear))];
    
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//         ),
//         onPressed: (){});
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     throw UnimplementedError();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }

// }