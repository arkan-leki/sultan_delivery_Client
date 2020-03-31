import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Request.dart';
import 'package:sultan_delivery/utilties/RequestsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/util.dart';

class EditeFoodRequest extends StatefulWidget {
  @override
  _EditeFoodRequestState createState() => _EditeFoodRequestState();
}

class _EditeFoodRequestState extends State<EditeFoodRequest> {
  RequestAPI _requestAPI = new RequestAPI();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink.shade600,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.close,
                    color: IconsColorFoodRequest,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            title: Text(
              'گۆڕانکاری لیستی داواکراوەکان',
              style: titleStyleFoodRequest,
            ),
            centerTitle: false,
            automaticallyImplyLeading: false,
          ),
          body: Container(
              color: BackgroundColor,
              child: FutureBuilder(
                  future: _requestAPI.fetchalldataById(phoneid),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          RequestDetail request = snapshot.data[index];
                          return Wrap(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: _detailesOFFoodRequest(
                                    request.foodTitle,
                                    request.quantity,
                                    request.totalPrice,
                                    request.food,
                                    request.id),
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
                  })),
        ),
      ),
    );
  }

  Widget _detailesOFFoodRequest(String nameoffood, String countoffoodNum,
      String priceoffood, String foodId, String id) {
    int _priceoffood ;
    if(countoffoodNum != "0"){
       _priceoffood = (int.parse(priceoffood)/int.parse(countoffoodNum)).round();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          nameoffood,
          style: NameOFFoodRequest,
        ),
        Text(
          ' $priceoffood دینار',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
              ),
              color: Colors.red.shade600,
              onPressed: (){_decrementCounter(id,int.parse(countoffoodNum),_priceoffood);},
            ),
            Container(
                child: Text(
              ' $countoffoodNum ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            IconButton(
              icon: Icon(
                Icons.add_circle_outline,
              ),
              color: Colors.green.shade600,
              onPressed: () {
                _incrementCounter(id,int.parse(countoffoodNum),_priceoffood);
              },
            ),
          ],
        ),
      ],
    );
  }

  _incrementCounter(String id, int _counter, int price) {
    setState(() {
      _counter++;
      _requestAPI.addFoodRequest(id, _counter.toString(),(price*_counter).toString());
    });
  }

  _decrementCounter(String id, int _counter, int price) {
    setState(() {
      _counter--;
      if (_counter != 0) {
        _requestAPI.addFoodRequest(id, _counter.toString(),(price*_counter).toString());
      }else{
        _requestAPI.deleteWithURl(id);
      }
    });

  }

}
