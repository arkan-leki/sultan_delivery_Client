import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/FoodsRequest/TaybatmandeChildrenFoods.dart';
import 'package:sultan_delivery/Screens/data/Food.dart';
import 'package:sultan_delivery/utilties/FoodsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/Screens/Courtomer/shoping_basket.dart';
import 'package:sultan_delivery/utilties/util.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  bool valuecheck = false;
  int _counter = 0;

  Food food;

  String a =
      "گۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. لە ساڵی ٢٠٠٢ ستۆدیۆی پیرۆت بە ھەماھەنگی لەگەڵ ئانیپلێکس ھەستان بە بەرھەمھێنانی بەشی یەکەمی ئەنیمێی ناروتۆ کە ساڵی ٢٠٠٧ لە دوای ٢٢٠ ئەڵقە کۆتایی پێھات؛ لەنێوان ساڵانی ٢٠٠٥ بۆ ٢٠٠٩ دۆبلاژی زمانی ئینگلیزی لەلایەن کارتوون نێتۆرکەوە بۆ کراوە. دووەم ئەنیمێ و تەواوکەری بەشی یەکەم بە ناوی 'ناروتۆ: شیپوودین'ەوە لە ٢٠٠٧ پەخشی لە ژاپۆن دەستی پێکرد و دوای ٥٠٠ ئەڵقە لە ساڵی ٢٠١٧ کۆتای ھات. دۆبلاژی ئینگلیزی بۆ شیپوودین لەلایەن 'دیزنی ئێکس دی'یەوە لە ٢٠٠٩ بۆ ٢٠١١ پەخشکرا، بەڵام";
  String b =
      "ۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. ";
  FoodAPI _foodAPI = new FoodAPI();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: BackgroundColor,
          body: FutureBuilder(
              future: _foodAPI.fetchalldataFavs(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Wrap(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4.0),
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: ListView.builder(
                            // scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              Food food = snapshot.data[index];
                              return Container(
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
                                          _drawFooter(food.id, _counter),
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
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
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
        ),
        status ? _PriceDiscountFoods(price, disPrice) : _PriceFoods(price),
      ],
    );
  }

  _PriceDiscountFoods(String price, String disPrice) {
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
                padding: EdgeInsets.only(left: 5, right: 10, top: 5),
                height: 40,
                child: Text("نرخ: $price دینار", style: OldPriceFoods),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.black12,
                ),
              ),
            ),
            SizedBox(
              width: 197,
              height: 40,
              child: Container(
                padding: EdgeInsets.only(left: 5, right: 5, top: 5),
                height: 40,
                child: Text("ئێستا: $price دینار", style: disPriceFoods),
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

  Widget _drawFooter(String id, int count) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  if (favorites.contains(id)) {
                    favorites.remove(id);
                  } else {
                    favorites.add(id);
                  }
                  setState(() {});
                  print(favorites);
                },
                color: (favorites.contains(id))
                    ? Colors.red
                    : Colors.grey.shade400,
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
            onPressed: (){_taybarmandechildrenfoods(id);},
          ),
        ],
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
