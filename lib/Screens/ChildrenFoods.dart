import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:sultan_delivery/Screens/data/Food.dart';
import 'package:sultan_delivery/utilties/FoodsAPI.dart';
import 'package:sultan_delivery/utilties/RequestsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/global_var.dart';
import 'package:sultan_delivery/Screens/Courtomer/shoping_basket.dart';
import 'package:sultan_delivery/utilties/util.dart';


import 'FoodsRequest/TaybatmandeChildrenFoods.dart';

class ChildrenFoods extends StatefulWidget {
  final String
      catId; // <--- generates the error, "Field doesn't override an inherited getter or setter"
  ChildrenFoods(String catId) : this.catId = catId;

  @override
  _ChildrenFoodsState createState() => _ChildrenFoodsState(catId);
}

class _ChildrenFoodsState extends State<ChildrenFoods> {
  HashMap<String, dynamic> requestsMap = new HashMap();
  RequestAPI _requestAPI = new RequestAPI();
  FoodAPI _foodAPI = new FoodAPI();

  Food food;
  final int value = 0;
  bool valuecheck = false;
  int _counter = 0;

  final String catId;

  var rating = 2.5;

  _ChildrenFoodsState(this.catId);

  String a =
      "گۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. لە ساڵی ٢٠٠٢ ستۆدیۆی پیرۆت بە ھەماھەنگی لەگەڵ ئانیپلێکس ھەستان بە بەرھەمھێنانی بەشی یەکەمی ئەنیمێی ناروتۆ کە ساڵی ٢٠٠٧ لە دوای ٢٢٠ ئەڵقە کۆتایی پێھات؛ لەنێوان ساڵانی ٢٠٠٥ بۆ ٢٠٠٩ د"
      "ۆبلاژی زمانی ئینگلیزی لەلایەن کارتوون نێتۆرکەوە بۆ کراوە. دووەم ئەنیمێ و تەواوکەری بەشی یەکەم بە ناوی 'ناروتۆ: شیپوودین'ەوە لە ٢٠٠٧ پەخشی لە ژاپۆن دەستی پێکرد و دوای ٥٠٠ ئەڵقە لە ساڵی ٢٠١٧ کۆتای ھات. دۆبلاژی ئینگلیزی بۆ ش"
      "یپوودین لەلایەن 'دیزنی ئێکس دی'یەوە لە ٢٠٠٩ بۆ ٢٠١١ پەخشکرا، بەڵام";
  String b =
      "ۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. ";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: BackgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.amber,
            title: Text(
              " خواردنەکان",
              style: titleStyleOtherWidegt,
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {}),
            ],
          ),
          body: FutureBuilder(
            future: _foodAPI.fetchalldataById(catId),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Wrap(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Food food = snapshot.data[index];
                            return Container(
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade800,
                                    blurRadius: 20.0, // has the effect of softening the shadow
                                    spreadRadius: 5.0, // has the effect of extending the shadow
                                    offset: Offset(
                                      10.0, // horizontal, move right 10
                                      10.0, // vertical, move down 10
                                    ),
                                  )
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    color: Colors.grey.shade900,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      children: <Widget>[
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            _Food(food),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        _drawFooter(food.id, _counter,
                                            int.parse(food.price)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                throw snapshot.error;
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
          floatingActionButton: Shopingbasket(),
        ),
      ),
    );
  }

  _Food(Food food) {
    return Column(
      children: <Widget>[
        _drawimage(food.image, food.price, food.disprice, food.status),
        _drawTitle(food.title, food.subtitle, food.detiles),
      ],
    );
  }

  Widget _drawFooter(String foodId, int count, int price) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  if (favorites.contains(foodId)) {
                    favorites.remove(foodId);
                  } else {
                    favorites.add(foodId);
                  }
                  setState(() {});
                  print(favorites);
                },
                color: (favorites.contains(foodId))
                    ? Colors.red
                    : Colors.grey.shade400,
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                color: Colors.green,
                onPressed: () {
                  requestsMap['food'] = foodId;
                  requestsMap['quantity'] = _counter.toString();
                  requestsMap['specify'] = selectedDrinks;
                  requestsMap['total_price'] = (_counter * price).toString();
                  requestsMap['phoneid'] = phoneid;
                  _requestAPI.insertdata(requestsMap).whenComplete(refresh);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                ),
                color: Colors.red.shade600,
                onPressed: _decrementCounter,
              ),
              Container(
                  child: Text(
                'دانە : ',
                style: TextStyle(color: Colors.amber, fontSize: 22),
              )),
              Container(
                  child: Text(
                ' $count ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              IconButton(
                icon: Icon(
                  Icons.add_circle_outline,
                ),
                color: Colors.green.shade600,
                onPressed: _incrementCounter,
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
            ),
            color: Colors.white,
            onPressed: (){_taybarmandechildrenfoods(foodId);},
          ),
        ],
      ),
    );
  }


  FutureOr refresh() {
    setState(() {
      selectedDrinks = [];
    });
  }

  Widget _drawTitle(String title, String subtitle, String detiles) {
    return Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: titleStyleNewFood,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              subtitle,
              style: subtitleStyleNewFood,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              detiles,
              style: detilesStyleNewFood,
            ),
          ],
        ));
  }

  Widget _drawimage(String img, String price, String disPrice, bool status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(img).image,
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 24, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: SmoothStarRating(
                      allowHalfRating: false,
                      onRatingChanged: (v) {
                        rating = v;
                        setState(() {});
                      },
                      starCount: 5,
                      rating: rating,
                      size: 30.0,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      color: Colors.yellow,
                      borderColor: Colors.amber,
                      spacing:0.0
                  ),
                ),
              ),
            ],
          ),
        ),
        status ? _PriceDiscountFoods(price, disPrice) : _PriceFoods(price),
      ],
    );
  }

  _PriceDiscountFoods(String oldprice, String disprice) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 10, top: 5),
                height: 40,
                child: Text("نرخ: $oldprice دینار", style: OldPriceFoods),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.black12,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                height: 40,
                child: Text("ئێستا: $disprice دینار", style: disPriceFoods),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ));
  }

  _PriceFoods(String price) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 197,
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                height: 40,
                child: Text("نرخ: $price دینار", style: PriceFoods),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                  color: Colors.amber,
                ),
              ),
            ),
          ],
        ));
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.amber,
        width: 0.2,
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) _counter--;
    });
  }

  void _taybarmandechildrenfoods(String id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaybatmandeChildrenFoods(id)),
    );
  }
}
