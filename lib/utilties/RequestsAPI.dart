import 'dart:collection';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sultan_delivery/Screens/data/Request.dart';
import 'util.dart';

class RequestAPI {
  Future<List<RequestDetail>> fetchalldata() async {
    String allCatAPI = apibse + requestdetailapi;
    List<RequestDetail> requests = List<RequestDetail>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        RequestDetail _request = new RequestDetail(
            data['id'].toString(),
            data['food'],
            data['food_title'],
            data['quantity'],
            data['drinks'],
            data['total_price'],
            data['phoneid']);
        requests.add(_request);
      }
    }
    return requests;
  }

  Future insertdata(Map<String, dynamic> map) async {
    List<RequestDetail> requests = List<RequestDetail>();
    print(map);
    var url = apibse + "request_details/";
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(map));
    if (response.statusCode == 201) {
      var data = convert.jsonDecode(utf8.decode(response.bodyBytes));
      RequestDetail _request = new RequestDetail(
          data['id'].toString(),
          data['food'],
          data['food_title'],
          data['quantity'],
          data['drinks'],
          data['total_price'],
          data['phoneid']);
      requests.add(_request);
      phoneid = data['phoneid'];
    } else {
      throw response.statusCode;
    }
  }

  Future<String> fetchalldataByPhone(String phoneid) async {
    String allCatAPI = apibse + requestz + '&phoneid=$phoneid&status=False';
    int number = 0;
    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        if (data['phoneid'] == phoneid) {
          number++;
        }
      }
    }
    return number.toString();
  }

  Future<String> fetchalldataByprice(String phoneid) async {
    String allCatAPI = apibse + requestz + '&phoneid=$phoneid&status=False';
    int number = 0;
    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        if (data['phoneid'] == phoneid) {
          number += int.parse(data['total_price']);
        }
      }
    }
    return number.toString();
  }

  Future fetchalldataById(String phoneid) async {
    String allCatAPI = apibse + requestz + '&phoneid=$phoneid&status=False';
    List<RequestDetail> requests = List<RequestDetail>();

    var response = await http.get(allCatAPI);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in jsonResponse) {
        if (data['phoneid'] == phoneid) {
          RequestDetail _request = new RequestDetail(
              data['id'].toString(),
              data['food'],
              data['food_title'],
              data['quantity'],
              data['drinks'],
              data['total_price'],
              data['phoneid']);
          requests.add(_request);
        }
      }
    }
    return requests;
  }

  Future deleteWithURl(String id) async {
    final baseUrl = apibse;
    final url = Uri.parse(baseUrl + "request_details/$id/");
    var response =
        await http.delete(url);
    if (response.statusCode != 200)
      return Future.error("error: status code ${response.statusCode}");
  }


  Future editeFoodRequest(String id) async {
    final baseUrl = apibse;
    final url = Uri.parse(baseUrl + "request_details/$id/");
    HashMap<String, dynamic> requestsMap = new HashMap();
    requestsMap['status'] = true;
    var response =
    await http.patch(url, body: {'status': 'true'});
    if (response.statusCode != 200)
      return Future.error("error: status code ${response.statusCode}");
  }

  Future insertdataTransForm(HashMap<String, dynamic> requestsMap, List requests) async {
    print(requestsMap);
    var url = apibse + "requests/";
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(requestsMap));
    if (response.statusCode == 201) {
      var data = convert.jsonDecode(utf8.decode(response.bodyBytes));
      for(String ids in requests) {
       editeFoodRequest(ids);
      }
      phoneid = data['phoneid'];
    } else {
      throw response.statusCode;
    }
  }
}
