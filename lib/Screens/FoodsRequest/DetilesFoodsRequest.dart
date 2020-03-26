import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sultan_delivery/Screens/FoodsRequest/FoodRequest.dart';
import 'package:sultan_delivery/Screens/data/Drink.dart';
import 'package:sultan_delivery/utilties/DrinksAPI.dart';
import 'package:sultan_delivery/utilties/FoodsAPI.dart';
import 'package:sultan_delivery/utilties/RequestsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/util.dart';

class DetilesFoodsRequest extends StatefulWidget {
  final int
      foodId; // <--- generates the error, "Field doesn't override an inherited getter or setter"
  DetilesFoodsRequest(int position) : this.foodId = position;

  @override
  _DetilesFoodsRequestState createState() => _DetilesFoodsRequestState(foodId);
}

class _DetilesFoodsRequestState extends State<DetilesFoodsRequest> {
  HashMap<String, dynamic> requestsMap = new HashMap();
  RequestAPI _requestAPI = new RequestAPI();

  List _selecteDrinks = List();

  String _price = "0";

  int drinksPrice = 0;

//  List _selecteDrinks = List();

  void _onDrinkSelected(bool selected, drinkId, price) {
    if (selected == true) {
      setState(() {
        _selecteDrinks.add(drinkId);
        drinksPrice += int.parse(price);
      });
    } else {
      setState(() {
        _selecteDrinks.remove(drinkId);
        drinksPrice -= int.parse(price);
      });
    }
  }

  FoodAPI _foodAPI = new FoodAPI();
  DrinkAPI _drinkAPI = new DrinkAPI();

  final int foodId;

  bool valuecheck = false;
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 1) _counter--;
    });
  }

  _DetilesFoodsRequestState(this.foodId);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appbarColor,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            title: Text(
              'هەڵبژاردنی داواکاری',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
          body: FutureBuilder(
            future: _foodAPI.fetchimageById(foodId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      _drawHeader(snapshot.data[0].image),
                      _dorwList(valuecheck, _counter, snapshot.data[0].price)
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
          bottomNavigationBar: _footerButton(),
        ),
      ),
    );
  }

  Widget _drawHeader(String img) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(img).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _dorwList(bool _sel, int countprince, String price) {
    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Text(
                'دانە : ',
                style: TextStyle(color: Colors.amber, fontSize: 22),
              )),
              Transform.translate(
                offset: Offset(-25, 0),
                child: Container(
                    child: Text(
                  ' $countprince ',
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                )),
              ),
              _buttonsCounter(),
            ],
          ),
          FutureBuilder(
              future: _drinkAPI.fetchalldata(foodId),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Drink drink = snapshot.data[index];
                        return _listOfchoose(
                            drink.id, drink.title, drink.price);
                      });
                } else if (snapshot.hasError) {
                  throw snapshot.error;
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          _sumallpriceWidget(price),
        ],
      ),
    );

    // By default, show a loading spinner.
  }

  Widget _buttonsCounter() {
    return Container(
      child: Row(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-20, 0),
            child: IconButton(
              icon: Icon(
                Icons.indeterminate_check_box,
              ),
              color: Colors.red.shade600,
              onPressed: _decrementCounter,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
            ),
            color: Colors.green.shade600,
            onPressed: _incrementCounter,
          ),
        ],
      ),
    );
  }

  Widget _listOfchoose(int value, String textcheck, String priceofcheck) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: _selecteDrinks.contains(value),
              onChanged: (bool selected) {
                _onDrinkSelected(selected, value, priceofcheck);
              },
            ),
            Text(
              textcheck,
              style: TextStyle(color: Colors.amber, fontSize: 14),
            ),
          ]),
          Container(
            child: Text(
              ' + $priceofcheck دینار',
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sumallpriceWidget(String price) {
    return Column(
      children: <Widget>[
        _drawDivider(),
        Container(
          padding: EdgeInsets.only(right: 20),
          child: Row(
            children: <Widget>[
              Container(
                  child: Text(
                'کۆی گشتی  :',
                style: TextStyle(color: Colors.amber, fontSize: 22),
              )),
              Transform.translate(
                offset: Offset(-150, 0),
                child: Container(
                    child: Text(
                  _price =
                      ((int.parse(price) + drinksPrice) * _counter).toString(),
                  style: TextStyle(color: Colors.amber, fontSize: 14),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: Colors.grey.shade500,
    );
  }

  Widget _footerButton() {
    return BottomAppBar(
      color: Colors.grey.shade900,
      child: Wrap(
        children: <Widget>[
          Container(
            color: Colors.black12,
            padding: EdgeInsets.only(left: 125, right: 125, bottom: 6),
            child: Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                RaisedButton(
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add_circle,
                        color: Colors.black,
                      ),
                      Text(' زیادکردن', style: testButtonStuleNewFood),
                    ],
                    //
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  onPressed: () {
                    requestsMap['food'] = foodId;
                    requestsMap['quantity'] = _counter.toString();
                    requestsMap['drinks'] = _selecteDrinks;
                    requestsMap['total_price'] = _price.toString();
                    requestsMap['phoneid'] = phoneid;
                    _requestAPI.insertdata(requestsMap).whenComplete(push);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  FutureOr Function() push() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => new FoodRequest()),
    );
  }
}
