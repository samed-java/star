import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star/models/product.dart';

class TableService{
  static getData(String url) async{
    try{
      var request = await http.get(Uri.parse(url));
      if(request.statusCode == 200){
        if(request.body.isNotEmpty){
          var data = json.decode(request.body);
          return Product.fromJson(data);
        }
      }
    }on Exception catch(_){
      print("error on getting table");
    }
  }
}