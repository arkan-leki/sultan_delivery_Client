import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/Request.dart';
import 'package:sultan_delivery/utilties/RequestsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';

import 'package:sultan_delivery/Screens/FoodsRequest/EditeFoodRequest.dart';
import 'package:sultan_delivery/utilties/util.dart';

import '../TransformFoods.dart';

class FoodRequest extends StatefulWidget {
  @override
  _FoodRequestState createState() => _FoodRequestState();
}

class _FoodRequestState extends State<FoodRequest> {
  RequestAPI _requestAPI = new RequestAPI();

  List<String> requests = List();

  var list;

  @override
  void initState() {
    list = _requestAPI.fetchalldataById(phoneid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: BackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.pink.shade600,
            title: Text(
              'لیستی داواکراوەکان',
              style: titleStyleFoodRequest,
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: IconsColorFoodRequest,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditeFoodRequest()),
                    );
                  }),
            ],
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Wrap(
                // crossAxisAlignment: CrossAxisAlignment.center,
                direction: Axis.horizontal,
                children: <Widget>[
                  RefreshIndicator(
                    child: FutureBuilder(
                        future: list,
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  RequestDetail reuqest = snapshot.data[index];
                                  requests.add(reuqest.id);
                                  return _DetailesOFFoodRequest(
                                      reuqest.foodTitle,
                                      reuqest.quantity,
                                      (int.parse(reuqest.totalPrice) /
                                              int.parse(reuqest.quantity)).round()
                                          .toString());
                                });
                          } else if (snapshot.hasError) {
                            throw snapshot.error;
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                    onRefresh: refreshList,
                  ),
                  _SumallpriceWidget(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _FooterButton(),
        ),
      ),
    );
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      list = _requestAPI.fetchalldataById(phoneid);
    });
    return null;
  }

  Widget _DetailesOFFoodRequest(
      String nameoffood, String countoffoodNum, String priceoffood) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                nameoffood,
                style: NameOFFoodRequest,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'x$countoffoodNum',
                style: StylecountoffoodRequest,
              ),
              Text(
                '$priceoffoodدینار ',
                style: StylepriceoffoodRequest,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _SumallpriceWidget() {
    return Column(
      children: <Widget>[
        _drawDivider(),
        Container(
          padding: EdgeInsets.only(right: 20, top: 10),
          child: Row(
            children: <Widget>[
              Container(
                  child: Text(
                'کۆی گشتی  :',
                style: TextStyle(color: Colors.amber, fontSize: 22),
              )),
              Transform.translate(
                offset: Offset(-150, 0),
                child: Container(child: getData()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getData() {
    if (phoneid != '') {
      return FutureBuilder(
          future: _requestAPI.fetchalldataByprice(phoneid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data,
                style: TextStyle(color: Colors.white, fontSize: 14),
              );
            } else if (snapshot.hasError) {
              return Text(
                "0",
                style: TextStyle(color: Colors.white, fontSize: 14),
              );
            }
            return Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 14),
            );
          });
    } else {
      return Text(
        "0",
        style: TextStyle(color: Colors.white, fontSize: 14),
      );
    }
  }

  Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: Colors.grey.shade500,
    );
  }

  Widget _FooterButton() {
    return BottomAppBar(
      color: Colors.grey.shade900,
      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.only(left: 120, right: 120, bottom: 6),
        child: FlatButton.icon(
          icon: Icon(
            Icons.done_all,
            color: Colors.white,
          ),
          label: Text(' پەسەندکرند', style: testButtonStulefoodRequest),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Colors.pink.shade600),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransformFoods(requests)),
            );
          },
        ),
      ),
    );
  }
}
