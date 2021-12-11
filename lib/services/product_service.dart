import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star/models/product.dart';
class ProductService{
  static getData(String url) async{
    try{
      var request = await http.get(Uri.parse(url));
      if(request.statusCode == 200){
        if(request.body != null){
          var data = json.decode(request.body);
          return (data as List).map((e) => Product.fromJson(e)).toList();
        }
      }
    }on Exception catch(_){
      print(_);
    }
  }

}