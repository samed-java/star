import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star/helper/Helper.dart';
import 'package:star/models/product.dart';
import 'package:star/models/table.dart';

class TableService {
  static Future<TableModel> getData() async {
    try {
      var request = await http.get(Uri.parse(Helper.base_url + Helper.table));
      print(request.statusCode);
      if (request.statusCode == 200) {
        if (request.body.isNotEmpty) {
          var data = json.decode(request.body);
          print(request.body);
          print(TableModel.fromJson(data).name);
          return TableModel.fromJson(data);
        }
        else{
          throw Error();
        }
      }
      else {
        throw Error();
      }
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }
}
