import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:star/helper/Helper.dart';
import 'package:star/models/product.dart';
class ProductService{
  static Future<List<Product>> getData() async{

      var request = await http.get(Uri.parse(Helper.base_url+Helper.product));
      if(request.statusCode == 200){
        if(request.body != null){
          var data = json.decode(request.body);
          print(data);
          var d = (data as List).map((e) => Product.fromJson(e)).toList();
          print(d);
          return (data as List).map((e) => Product.fromJson(e)).toList();
        }
        else{
          throw Error();
        }
      }
      else{
        print(request.statusCode);
        throw Error();
      }

  }

}