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
  CoustDetiles coustdetiles;
  final TransformFood transform;

  _ListOfCoustomerRequestState(this.transform);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Card(
              color: backgroundColor,
              child: _coustRequest(new CoustDetiles(
                  transform.requestName,
                  transform.requestPhone,
                  transform.request,
                  DateTime.parse(transform.startDate),
                  DateTime.parse(transform.endDate),
                  transform.dliverName))),
        ],
      ),
    );
  }

  _coustRequest(CoustDetiles coustDetiles) {
    return _listofRequest(
        coustDetiles.nameOfCoutomer,
        coustDetiles.numberCoutomer,
        coustDetiles.idRequest,
        coustDetiles.startDateTime,
        coustDetiles.endDateTime,
        coustDetiles.nameOfDriver);
  }

  Widget _listofRequest(
      String nameOfCoustomer,
      numberOfCoutomer,
      String idOfRequest,
      DateTime dateTimestart,
      DateTime dateTimeend,
      String nameOfdrivar) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
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
                    numberOfCoutomer,
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
                    idOfRequest,
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
                    '$dateTimestart',
                    style: TextStyle(color: Colors.green, fontSize: 14),
                  ),
                ],
              ), //start time
              Row(
                children: <Widget>[
                  Text("کاتی گەشتن    : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    " بەنزیکی پاش $dateTimeend",
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ],
              ), // end time
              Row(
                children: <Widget>[
                  Text("ناوی شۆفێر     : ", style: lableOfRequestCoustomor),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    nameOfdrivar,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              _cardFooter(),
              //name of drivar
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 300,
            height: 0.2,
            color: Colors.grey.shade500,
          ),
          Transform.translate(
            offset: Offset(45, 0),
            child: Row(
              children: <Widget>[
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'کاتی دەرچوون',
                      style:
                          TextStyle(color: Colors.green.shade600, fontSize: 16),
                    )),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      'کاتی گەشتن',
                      style:
                          TextStyle(color: Colors.red.shade600, fontSize: 16),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*Widget _drawDivider() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: Colors.grey.shade500,
    );
  }*/
}
