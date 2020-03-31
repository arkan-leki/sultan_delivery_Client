import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Screens/data/Cat.dart';
import 'util.dart';

class CatAPI {
  Future fetchalldata() async {
    String allCatAPI = apibse + catapi;
    List<Cat> cats = List<Cat>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Cat cat = Cat(
            data['id'].toString(),
            data['image'].toString(),
            data['nameEg'].toString(),
            data['nameKu'].toString(),
            data['detiles'].toString());
        cats.add(cat);
      }
    }
    return cats;
  }
}
