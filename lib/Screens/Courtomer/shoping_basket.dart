import 'package:flutter/material.dart';
import 'package:sultan_delivery/utilties/util.dart';
import '../FoodsRequest/FoodRequest.dart';
import '../../utilties/RequestsAPI.dart';

class Shopingbasket extends StatefulWidget {
  @override
  _ShopingbasketState createState() => _ShopingbasketState();
}

class _ShopingbasketState extends State<Shopingbasket> {
  RequestAPI _requestAPI = new RequestAPI();

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(56, 56), // button width and height
      child: ClipOval(
        child: Material(
          color: Colors.orange, // button color
          child: InkWell(
            splashColor: Colors.green, // splash color
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FoodRequest()),
              );
            }, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_basket), // icon
                getData(), // text
              ],
            ),
          ),
        ),
      ),
    );
  }

  getData() {
    if (phoneid != '') {
      return FutureBuilder(
          future: _requestAPI.fetchalldataByPhone(phoneid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("0");
            }
            return Text('');
          });
    } else {
      return Text('0');
    }
  }
}
