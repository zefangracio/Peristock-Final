class BookDetail {
  bool status;
  Product product;

  BookDetail({this.status, this.product});

  BookDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}

class Product {
  String isbn;
  String kdbrg;
  String judul;
  String author;
  String publisher;
  String harga;
  String sgroup;
  String kelas;
  String umur;
  List<Item> item;

  Product(
      {this.isbn,
      this.kdbrg,
      this.judul,
      this.author,
      this.publisher,
      this.harga,
      this.sgroup,
      this.kelas,
      this.umur,
      this.item});

  Product.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    kdbrg = json['kdbrg'];
    judul = json['judul'];
    author = json['author'];
    publisher = json['publisher'];
    harga = json['harga'];
    sgroup = json['sgroup'];
    kelas = json['kelas'];
    umur = json['umur'];
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['kdbrg'] = this.kdbrg;
    data['judul'] = this.judul;
    data['author'] = this.author;
    data['publisher'] = this.publisher;
    data['harga'] = this.harga;
    data['sgroup'] = this.sgroup;
    data['kelas'] = this.kelas;
    data['umur'] = this.umur;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String isbn;
  String stock;
  String location;
  String binloc;

  Item({this.isbn, this.stock, this.location, this.binloc});

  Item.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    stock = json['stock'];
    location = json['location'];
    binloc = json['binloc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['stock'] = this.stock;
    data['location'] = this.location;
    data['binloc'] = this.binloc;
    return data;
  }
}
