import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Food.dart';
import 'package:sultan_delivery/utilties/FoodsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/Screens/FoodsRequest/DetilesFoodsRequest.dart';
import 'package:sultan_delivery/utilties/shoping_basket.dart';
import 'package:sultan_delivery/utilties/util.dart';
import 'data/Food.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  FoodAPI _foodAPI = new FoodAPI();

  Food food;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
            backgroundColor: Colors.amber,
            title: Text(
              'دڵخوازەکان',
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
                child: FutureBuilder(
                    future: _foodAPI.fetchalldataFavs(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
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
                                      color: Colors.grey.shade800,
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        children: <Widget>[
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              _food(food),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          _drawFooter(food.id),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      } else if (snapshot.hasError) {
                        throw snapshot.error;
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
          floatingActionButton: Shopingbasket(),
        ),
      ),
    );
  }

  _food(Food food) {
    return Column(
      children: <Widget>[
        _drawimage(food.image),
        _drawTitle(food.title, food.subtitle, food.detiles),
      ],
    );
  }

  Widget _drawFooter(int position) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                if (favorites.contains(position)) {
                  favorites.remove(position);
                } else {
                  favorites.add(position);
                }
                setState(() {});
                print(favorites);
              },
              color: (favorites.contains(position))
                  ? Colors.red
                  : Colors.grey.shade400,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(right: 50),
          child: RaisedButton(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add_circle,
                  color: Colors.black,
                ),
                Text(' داواکردن', style: testButtonStuleNewFood),
              ],
              //
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetilesFoodsRequest(position)),
              );
            },
          ),
        ),
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

  Widget _drawimage(String img) {
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
        _priceFoods(17000),
      ],
    );
  }

  _priceFoods(int price) {
    return Container(
      padding: EdgeInsets.only(left: 4, right: 6, bottom: 6),
      height: 40,
      child: Text("نرخ: $price دینار", style: priceFoods),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
        ),
        color: Colors.amber,
      ),
    );
  }
}
