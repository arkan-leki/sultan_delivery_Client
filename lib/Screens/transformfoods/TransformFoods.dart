import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/MainScreen.dart';
import 'package:sultan_delivery/services/location_service.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/utilties/RequestsAPI.dart';
import 'package:sultan_delivery/utilties/util.dart';

class TransformFoods extends StatefulWidget {
  final List requests;

  TransformFoods(this.requests);

  @override
  _TransformFoodsState createState() => _TransformFoodsState(requests);
}

class _TransformFoodsState extends State<TransformFoods> {
  HashMap<String, dynamic> requestsMap = new HashMap();
  RequestAPI _requestAPI = new RequestAPI();

  bool checkboxvalue = false;
  String checkboxText = "دیاری کردنی ناونیشانی ئێستا";

  final List requests;

  final customerName = TextEditingController();
  final customerPhone = TextEditingController();
  final customerAddress = TextEditingController();

  String price;

  _TransformFoodsState(this.requests);

  Widget build(BuildContext context) {
    getTotalPrice();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.amber, //change your color here
            ),
            title: Text(
              'گەیاندن',
              style: titleStyle,
            ),
            centerTitle: false,
          ),
          body: detailesTrasnformFoodsa(),
          bottomNavigationBar: _footerButton(),
        ),
      ),
    );
  }

  Widget _footerButton() {
    return BottomAppBar(
      color: Colors.grey.shade900,
      child: Container(
        color: Colors.black12,
        padding: EdgeInsets.only(left: 120, right: 120, bottom: 6),
        child: RaisedButton(
          color: Colors.green.shade900,
          child: Wrap(
            direction: Axis.horizontal,
            children: <Widget>[
              Text(' داواکردن', style: testButtonStulefoodRequest),
              Icon(
                Icons.send,
                color: Colors.white,
              ),
            ],
            //
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          onPressed: () {
            requestsMap['name'] = customerName.text;
            requestsMap['phone'] = customerPhone.text;
            requestsMap['address'] = customerAddress.text;
            requestsMap['total_price'] = price;
            requestsMap['request_detail'] = requests;
            requestsMap['phoneid'] = phoneid;
            _requestAPI.insertdataTransForm(requestsMap, requests).whenComplete(push);

          },
        ),
      ),
    );
  }

  detailesTrasnformFoodsa() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Wrap(
          // crossAxisAlignment: CrossAxisAlignment.center,
          direction: Axis.vertical,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/logodiv.jpg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
              width: 150,
              height: 150,
              margin: EdgeInsets.only(right: 125, bottom: 25),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _detailesLabelPersonRequest(),
                _detailesTextFeildPersonRequest(),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 100,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    onChanged: (bool e) => something(),
                    value: checkboxvalue,
                  ),
                  Container(
                    child: Text(
                      checkboxText,
                      style: TextStyle(color: Colors.amber, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailesLabelPersonRequest() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 50,
            child: Text("ناو : ", style: detailesPersonRequest),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: 70,
            child: Text("ژ.مۆبایل : ", style: detailesPersonRequest),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            child: Text("ناونیشان : ", style: detailesPersonRequest),
          ),
        ],
      ),
    );
  }

  Widget _detailesTextFeildPersonRequest() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 250,
            height: 40,
            child: TextFormField(
              controller: customerName,
              style: new TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: _underlineInputBorder(),
                focusedBorder: _focusedBorderUnderlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'ناوی داواکار',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            height: 40,
            child: TextFormField(
              controller: customerPhone,
              style: new TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                enabledBorder: _underlineInputBorder(),
                focusedBorder: _focusedBorderUnderlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: '*********07',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            height: 40,
            child: TextFormField(
              controller: customerAddress,
              style: new TextStyle(
                color: Colors.amber,
                fontSize: 16,
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: _underlineInputBorder(),
                focusedBorder: _focusedBorderUnderlineInputBorder(),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'ناونیشانی داواکار',
              ),
            ),
          ),
        ],
      ),
    );
  }

  UnderlineInputBorder _underlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.amber),
    );
  }

  UnderlineInputBorder _focusedBorderUnderlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
    );
  }

  LocationService userLocation = LocationService();

  void something() {
    userLocation.getLocation().then((location) {
      print('Location: Lat${location.latitude}, Long: ${location?.longitude}');
      setState(() {
        if (!checkboxvalue) {
          // ignore: unnecessary_statements
          checkboxText = "ناونیشانەکەت بەسەرکەوتویی دیاری کرا !";
          //  alarmLocation(checkboxText );
          checkboxvalue = !checkboxvalue;
        } else {
          checkboxText = "دیاری کردنی ناونیشانی ئێستا";
          //  alarmLocation(checkboxText );
          checkboxvalue = !checkboxvalue;
        }
      });
    });
  }

  alarmLocation(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.amber,
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  void getTotalPrice() {
    _requestAPI.fetchalldataByprice(phoneid).then((o) {
      price = o;
    });
  }

  FutureOr push() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScrreen()),
    );
  }
}
