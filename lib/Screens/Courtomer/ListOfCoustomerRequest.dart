import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/CoustDetiles.dart';
import 'package:sultan_delivery/Screens/data/TransformFood.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';

class ListOfCoustomerRequest extends StatefulWidget {
  final TransformFood transform;
  ListOfCoustomerRequest(TransformFood transform) : this.transform = transform;

  @override
  _ListOfCoustomerRequestState createState() =>
      _ListOfCoustomerRequestState(transform);
}

class _ListOfCoustomerRequestState extends State<ListOfCoustomerRequest> {
  final TransformFood transform;

  _ListOfCoustomerRequestState(this.transform);

  CoustDetiles coustdetiles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Card(
            color: BackgroundColor,
            child: _CoustRequest(
              new CoustDetiles(
                transform.requestName,
                transform.requestPhone,
                transform.request,
                DateTime.parse(transform.startDate),
                DateTime.now(),
                DateTime.parse(transform.endDate),
                transform.requestAddress,
                transform.requestPrice,
                '2000',
                (int.parse(transform.requestPrice)+2000).toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _CoustRequest(CoustDetiles coustDetiles) {
    return _listofRequest(
        coustDetiles.NameOfCoutomer,
        coustDetiles.NumberCoutomer,
        coustDetiles.IdRequest,
        coustDetiles.StartDateTime,
        coustDetiles.EndDateTime,
        coustDetiles.PefectTime,
        coustDetiles.Address,
        coustDetiles.PriceList,
        coustDetiles.PriceOfDelivary,
        coustDetiles.SumOfRequestList);
  }

  Widget _listofRequest(
    String nameOfCoustomer,
    NumberOfCoutomer,
    String IdOfRequest,
    DateTime StartDatetime,
    DateTime EndDatetime,
    DateTime Pefecttime,
    String Address,
    String PriceList,
    String PriceOfDelivary,
    String SumOfRequestList,
  ) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "ناوی داواکار     : ",
                    style: lableOfRequestCoustomor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    nameOfCoustomer,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ), //name of coutomer
              Row(
                children: <Widget>[
                  Text("ژ.مۆبایل          : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    NumberOfCoutomer,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ), // code of coutomer
              Row(
                children: <Widget>[
                  Text("کۆدی داواکاری : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    IdOfRequest,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ), // code of numbercoutomer
              Row(
                children: <Widget>[
                  Text(
                    "کاتی دەرچوون : ",
                    style: lableOfRequestCoustomor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$StartDatetime',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ), //start time
              Row(
                children: <Widget>[
                  Text("کاتی خەڵمێنراو : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "بەنزیکی پاش $EndDatetime خولەک ",
                    style: TextStyle(color: Colors.red.shade600, fontSize: 12),
                  ),
                ],
              ), // end time
              Row(
                children: <Widget>[
                  Text(
                    "کاتی پێچوو     : ",
                    style: lableOfRequestCoustomor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$Pefecttime خولەک ',
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("ناونیشان         : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    Address,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("کۆی لیست      : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$PriceList دینار ",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("تێچووی گواستنەوە  : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "$PriceOfDelivary دینار ",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),

              _cardFooter(SumOfRequestList),
              //name of drivar
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardFooter(String SumOfRequestList) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 0.2,
            color: Colors.grey.shade500,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Text(
                "پوختەی لیست  : ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$SumOfRequestList دینار  ",
                style: TextStyle(color: Colors.yellowAccent, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
