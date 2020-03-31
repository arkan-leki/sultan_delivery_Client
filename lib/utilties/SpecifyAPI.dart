import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sultan_delivery/Screens/data/Specify.dart';
import 'util.dart';

class SpecifyAPI {
  Future fetchalldata(String foodId) async {
    String allCatAPI = apibse + specifyapi + "&food_id=" + foodId.toString();
    List<Specify> drinks = List<Specify>();
    print(allCatAPI);

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Specify specify = new Specify(data['id'].toString(), data['title'].toString(),
            data['food_id'].toString());
        drinks.add(specify);
      }
    }
    return drinks;
  }
}
