/// id : "1"
/// name : "Doner"
/// price : "2.00"
/// image : "https://i.pinimg.com/originals/6c/1d/24/6c1d2406fc79de29d32e39c311b5f8bb.jpg"

class Product {


  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image
  });


 factory Product.fromJson(dynamic json) {
    return Product(
        id : json['product_id'],
        name : json['product_name'],
        price : json['product_cost'],
        image : json['product_image'],
        );
  }
  late String id;
  late String name;
  late String price;
  late String image;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = id;
    map['product_name'] = name;
    map['product_cost'] = price;
    map['product_image'] = image;
    return map;
  }

}