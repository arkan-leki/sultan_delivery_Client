import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Drink.dart';
import 'package:sultan_delivery/utilties/DrinksAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/global_var.dart';

class TaybatmandeChildrenFoods extends StatefulWidget {
  @override
  _TaybatmandeChildrenFoodsState createState() =>
      _TaybatmandeChildrenFoodsState();
}

class _TaybatmandeChildrenFoodsState extends State<TaybatmandeChildrenFoods> {
  DrinkAPI _drinkAPI = new DrinkAPI();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink.shade600,
            title: Text(
              'تایبەتمەندی خواردن',
              style: titleStyleFoodRequest,
            ),
            centerTitle: false,
          ),
          body: Container(
            color: BackgroundColor,
            child: FutureBuilder(
                future: _drinkAPI.fetchalldata(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Drink drink = snapshot.data[index];
                        return Wrap(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child:
                                  _DetailesOFFoodRequest(drink.id, drink.title),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    throw snapshot.error;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }

  Widget _DetailesOFFoodRequest(String id, String textcheck) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        direction: Axis.horizontal,
        runAlignment: WrapAlignment.spaceBetween,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              checkColor: Colors.red,
              activeColor: Colors.grey.shade900,
              onChanged: (bool selected) {
                _onDrinkSelected(selected, id);
              },
              value: selectedDrinks.contains(id),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 5),
            child: Text(
              textcheck,
              style: TextStyle(color: Colors.amber, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void _onDrinkSelected(bool selected, drinkId) {
    if (selected == true) {
      setState(() {
        selectedDrinks.add(drinkId);
      });
    } else {
      setState(() {
        selectedDrinks.remove(drinkId);
      });
    }
  }
}
