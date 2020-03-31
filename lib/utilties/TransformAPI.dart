import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sultan_delivery/Screens/data/TransformFood.dart';
import 'util.dart';

class TransformAPI {
  Future fetchalldata(String phoneid) async {
    String allCatAPI = apibse + transformapi + "&request_phoneid=$phoneid";
    List<TransformFood> transforms = List<TransformFood>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        TransformFood transform = new TransformFood(
          data['id'].toString(),
          data['dliver_id'].toString(),
          data['request_id'].toString(),
          data['dliver_name'],
          data['request_name'],
          data['start_date'],
          data['end_date'],
          data['status'],
          data['request_phoneid'],
          data['request_phone'],
          data['request_total_price'],
          data['request_address'],
        );
        transforms.add(transform);
      }
    }
    return transforms;
  }
}
