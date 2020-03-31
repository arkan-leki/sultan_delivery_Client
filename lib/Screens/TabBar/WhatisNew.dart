import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WhatisNew extends StatefulWidget {
  @override
  _WhatisNewState createState() => _WhatisNewState();
}

class _WhatisNewState extends State<WhatisNew> {
  String b =
      "ۆڤاری شۆنێن جەمپ لە ساڵی ١٩٩٩دا دەستی بە بڵاوکردنەوەی ناروتۆ کرد و ھەفتانە بەردەوام بوو تا ساڵی ٢٠١٤. سەرتاپای چیرۆکەکە دابەش دەبێت بەسەر ٧٢ پەرتووکی جۆری تانکۆبۆن. ";

  final int value = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // padding: EdgeInsets.only(top: 10),
        color: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _drawHeader(),
            _topStories(),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawHeader() {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 4, bottom: 4),
        child: _Reklam('assets/images/burgger.jpg'),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.35,
        child: CarouselSlider.builder(
          itemCount: 15,
          aspectRatio: 3 / 2,
          viewportFraction: 0.99,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 3),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: Duration(seconds: 3),
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int itemIndex) =>
              _viewAllFoods('assets/images/burgger.jpg', 'NameOfFood'),
        ),
      ),
    ]);
  }

  Widget _topStories() {
    return Container(
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawSectionTitle('خۆشترینەکان'),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey.shade900,
              child: Column(
                children: <Widget>[
                  Card(color: Colors.grey.shade900, child: _drawSingleRow()),
                  Card(color: Colors.grey.shade900, child: _drawSingleRow()),
                  Card(color: Colors.grey.shade900, child: _drawSingleRow()),
                  Card(color: Colors.grey.shade900, child: _drawSingleRow()),
                  Card(color: Colors.grey.shade900, child: _drawSingleRow()),
                ],
              ),
            ),
          ),
          _drawDivider(),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _drawSectionTitle('نوێترینەکان'),
                _drawRecentUppdateCard(
                    'NameOfFoods', 'SubtitleOfFoods', Colors.deepOrange),
                _drawRecentUppdateCard(
                    'NameOfFoods', 'SubtitleOfFoods', Colors.teal),
                _drawRecentUppdateCard(
                    'NameOfFoods', 'SubtitleOfFoods', Colors.lightBlue),
                _drawRecentUppdateCard(
                    'NameOfFoods', 'SubtitleOfFoods', Colors.orange),
                _drawRecentUppdateCard(
                    'NameOfFoods', 'SubtitleOfFoods', Colors.purple),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/pizza.png'),
              fit: BoxFit.cover,
            ),
            width: 124,
            height: 124,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'name food',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      color: Colors.green,
                      onPressed: () {},
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < value ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.red,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, right: 8, top: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, color: Colors.amber),
      ),
    );
  }

  Widget _drawRecentUppdateCard(
      String nameoffoods, String sutitlefoods, Color color) {
    return Card(
      color: Colors.grey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/pizza.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.35,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                nameoffoods,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Text(
              sutitlefoods,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  color: Colors.green,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _Reklam(String PehImgeReklam) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.08,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/pizza.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
            child: Text(
          'reklam',
          style: TextStyle(color: Colors.white, fontSize: 26),
        )),
      ),
    );
  }

  _viewAllFoods(String pathImges, String namefoods) {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 4),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/images/pizza.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                namefoods,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
