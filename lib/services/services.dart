import 'dart:convert';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:peristock/models/master.dart';
import '../models/bookDetail.dart';

class Services {
  static final String apiUrl = '10.0.2.2';

  static Future searchProducts(String keyword) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(
        Uri.parse('http://192.168.1.3/peristock/SearchProducts.php?keyword=' +
            keyword),
      );
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      print("respon : " + response.statusCode.toString());
      //print(reply);
      httpClient.close();
      Map<String, dynamic> map2 = json.decode(reply);
      //print(map2);
      if (200 == response.statusCode) {
        List<Products> produk = List<Products>.empty(growable: true);
        Master master = Master(products: produk);
        print("respon body" + reply);
        map2.forEach((key, value) => {
              if (key == 'status')
                {master.status = value}
              else if (key == 'products')
                {
                  value.forEach((v) => {
                        produk.add(new Products(
                          isbn: v['isbn'],
                          kdbrg: v['kdbrg'],
                          judul: v['judul'],
                          author: v['author'],
                        ))
                      }),
                  master.products = produk
                }
            });
        return master;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future getProduct(String isbn) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(
        Uri.parse('http://192.168.1.3/peristock/getProduct.php?isbn=' + isbn),
      );

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      //print(reply);
      httpClient.close();
      Map<String, dynamic> map2 = json.decode(reply);
      //print(map2);
      if (200 == response.statusCode) {
        Product produk = Product();
        List<Item> items = List<Item>.empty(growable: true);
        BookDetail bookDetail = BookDetail(product: produk);

        map2.forEach((key, value) => {
              if (key == 'status')
                {bookDetail.status = value}
              else if (key == 'product')
                {
                  produk.isbn = value['isbn'],
                  produk.kdbrg = value['kdbrg'],
                  produk.judul = value['judul'],
                  produk.author = value['author'],
                  produk.publisher = value['publisher'],
                  produk.harga = value['harga'],
                  produk.sgroup = value['sgroup'],
                  produk.kelas = value['kelas'],
                  produk.umur = value['umur'],
                  value['item'].forEach((v) => {
                        items.add(new Item(
                            isbn: v['isbn'],
                            stock: v['stock'],
                            location: v['location'],
                            binloc: v['binloc']))
                      }),
                  produk.item = items,
                }
            });
        print(bookDetail.status);
        print(bookDetail.product.judul);
        //print(list.toString());
        //var stock = new Stock.fromJson(map2);
        //print(stock);
        return bookDetail;
      } else {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
