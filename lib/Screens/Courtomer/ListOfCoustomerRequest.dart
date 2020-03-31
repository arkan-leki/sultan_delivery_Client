import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/data/CoustDetiles.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';

class ListOfCoustomerRequest extends StatefulWidget {
  @override
  _ListOfCoustomerRequestState createState() => _ListOfCoustomerRequestState();
}

class _ListOfCoustomerRequestState extends State<ListOfCoustomerRequest> {
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
                'omar',
                '07725338425',
                '1',
                DateTime.now(),
                DateTime.now(),
                DateTime.now(),
                'kalar-shhedan',
                '20000',
                '2000',
                '22000',
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
