import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sultan_delivery/Screens/data/Drink.dart';
import 'util.dart';

class DrinkAPI {
  Future fetchalldata() async {
    String allCatAPI = apibse + drinkapi;
    List<Drink> drinks = List<Drink>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        Drink drink = new Drink(data['id'].toString(), data['title'].toString(),
            data['price'].toString());
        drinks.add(drink);
      }
    }
    return drinks;
  }
}
