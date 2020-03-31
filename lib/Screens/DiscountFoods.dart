import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Food.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/Screens/Courtomer/shoping_basket.dart';

import 'FoodsRequest/TaybatmandeChildrenFoods.dart';

class DiscountFoods extends StatefulWidget {
  @override
  _DiscountFoodsState createState() => _DiscountFoodsState();
}

class _DiscountFoodsState extends State<DiscountFoods> {
  @override
  String a =
      "گۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. لە ساڵی ٢٠٠٢ ستۆدیۆی پیرۆت بە ھەماھەنگی لەگەڵ ئانیپلێکس ھەستان بە بەرھەمھێنانی بەشی یەکەمی ئەنیمێی ناروتۆ کە ساڵی ٢٠٠٧ لە دوای ٢٢٠ ئەڵقە کۆتایی پێھات؛ لەنێوان ساڵانی ٢٠٠٥ بۆ ٢٠٠٩ دۆبلاژی زمانی ئینگلیزی لەلایەن کارتوون نێتۆرکەوە بۆ کراوە. دووەم ئەنیمێ و تەواوکەری بەشی یەکەم بە ناوی 'ناروتۆ: شیپوودین'ەوە لە ٢٠٠٧ پەخشی لە ژاپۆن دەستی پێکرد و دوای ٥٠٠ ئەڵقە لە ساڵی ٢٠١٧ کۆتای ھات. دۆبلاژی ئینگلیزی بۆ شیپوودین لەلایەن 'دیزنی ئێکس دی'یەوە لە ٢٠٠٩ بۆ ٢٠١١ پەخشکرا، بەڵام";
  String b =
      "ۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. ";
  bool valuecheck = false;
  int _counter = 0;

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
              'داشکاندنەکان',
              style: titleStyleOtherWidegt,
            ),
            centerTitle: false,
          ),
          drawer: NavegationDrawer(),
          body: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.grey.shade900,
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      _Food(new Food(
                                          '1',
                                          'assets/images/burgger.jpg',
                                          '10000',
                                          '5000',
                                          'pizza',
                                          b,
                                          a,
                                          true)),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  _drawFooter(position, _counter),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
          floatingActionButton: Shopingbasket(),
        ),
      ),
    );
  }

  _Food(Food food) {
    return Column(
      children: <Widget>[
        _drawimage(food.image, food.price, food.disprice),
        _drawTitle(food.title, food.subtitle, food.detiles),
      ],
    );
  }

  Widget _drawTitle(String title, String subtitle, String detiles) {
    return Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 10),
        child: Wrap(
          children: <Widget>[
            Column(
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
            ),
          ],
        ));
  }

  Widget _drawimage(String image, String price, String disprice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        _PriceDiscountFoods(int.parse(price), int.parse(disprice)),
      ],
    );
  }

  _PriceDiscountFoods(int price, int disPrice) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 40,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: <Widget>[
            SizedBox(
              width: 195,
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
              width: 200,
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

  Widget _drawFooter(int position, int count) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Colors.blue,
              ),
              Text("15 min",
                  style: TextStyle(fontSize: 14, color: Colors.white)),
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
            onPressed: _taybarmandechildrenfoods,
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

  void _taybarmandechildrenfoods() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaybatmandeChildrenFoods()),
    );
  }
}
