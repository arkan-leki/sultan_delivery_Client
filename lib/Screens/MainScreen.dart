import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/TabBar/ParentFoodsList.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/Screens/Courtomer/shoping_basket.dart';

class MainScrreen extends StatefulWidget {
  @override
  _MainScrreenState createState() => _MainScrreenState();
}

class _MainScrreenState extends State<MainScrreen> {
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
          ),
          drawer: NavegationDrawer(),
          body: Container(
            padding: EdgeInsets.all(8),
            child: ParentFoodsList(),
          ),
          floatingActionButton: Shopingbasket(),
        ),
      ),
    );
  }
}
