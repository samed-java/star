import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:star/helper/Helper.dart';
import 'dart:convert';

import 'package:star/models/basket.dart';


class BasketService{
  static postData(String url , Map<String , dynamic> data)
  async{
    var request = await http.post(Uri.parse(url),headers:<String,String>{
      HttpHeaders.contentTypeHeader: '/app/basket'
    }, body: data);
    print(request.statusCode);
  }
}