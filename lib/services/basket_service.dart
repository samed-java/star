import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:star/helper/Helper.dart';
import 'dart:convert';

import 'package:star/models/basket.dart';


class BasketService{
  static postData( Map<String , dynamic> data)
  async{
    var request = await http.post(Uri.parse(Helper.base_url+Helper.basket),headers:<String,String>{
      HttpHeaders.contentTypeHeader: '/app/basket'
    }, body: data);
    print(request.statusCode);
  }
}