import 'package:flutter/material.dart';
import 'dart:async';

import 'package:device_id/device_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/Screens/ListViewProduce.dart';
import 'package:sultan_delivery/utilties/shoping_basket.dart';
import 'package:sultan_delivery/utilties/util.dart';

class MainScrreen extends StatefulWidget {
  @override
  _MainScrreenState createState() => _MainScrreenState();
}

class _MainScrreenState extends State<MainScrreen> {
  String _deviceid = 'Unknown';

  @override
  void initState() {
    super.initState();
    initDeviceId();
  }

  Future<void> initDeviceId() async {
    _deviceid = await DeviceId.getID;
    phoneid = _deviceid;
    print(phoneid);
  }

  @override
  Widget build(BuildContext context) {
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
              'فۆرمی سەرەکی',
              style: titleStyle,
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: iconsColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScrreen()),
                    );
                  }),
            ],
          ),
          drawer: NavegationDrawer(),
          body: Container(
            padding: EdgeInsets.all(8),
            child: ListViewPrudoce(),
          ),
          floatingActionButton: Shopingbasket(),
        ),
      ),
    );
  }
}
