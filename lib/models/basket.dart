import 'dart:convert';

import 'package:star/models/product.dart';

class BasketModel{
  late String table_id;
  late List<Product> products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['table_id'] = this.table_id;
    map['products'] = json.encode(this.products.map((e) => e.toJson()).toList());
    return map;
  }
}