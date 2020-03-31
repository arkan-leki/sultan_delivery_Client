import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Specify.dart';
import 'package:sultan_delivery/utilties/SpecifyAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/global_var.dart';

class TaybatmandeChildrenFoods extends StatefulWidget {
  final String
  foodId; // <--- generates the error, "Field doesn't override an inherited getter or setter"
  TaybatmandeChildrenFoods(String foodId) : this.foodId = foodId;
  @override
  _TaybatmandeChildrenFoodsState createState() =>
      _TaybatmandeChildrenFoodsState(foodId);
}

class _TaybatmandeChildrenFoodsState extends State<TaybatmandeChildrenFoods> {
  SpecifyAPI _drinkAPI = new SpecifyAPI();

  String foodId;
  _TaybatmandeChildrenFoodsState(this.foodId);


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
                future: _drinkAPI.fetchalldata(foodId),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        Specify specify = snapshot.data[index];
                        return Wrap(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                              ),
                              child:
                                  _DetailesOFFoodRequest(specify.id, specify.title),
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
