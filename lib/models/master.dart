class Master {
  bool status;
  List<Products> products = [];

  Master({this.status, this.products});

  Master.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String isbn;
  String kdbrg;
  String judul;
  String author;

  Products({this.isbn, this.kdbrg, this.judul, this.author});

  Products.fromJson(Map<String, dynamic> json) {
    isbn = json['isbn'];
    kdbrg = json['kdbrg'];
    judul = json['judul'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isbn'] = this.isbn;
    data['kdbrg'] = this.kdbrg;
    data['judul'] = this.judul;
    data['author'] = this.author;
    return data;
  }
}
