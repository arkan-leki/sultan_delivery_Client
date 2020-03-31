import 'package:flutter/material.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';

class MapDelivary extends StatefulWidget {
  @override
  _MapDelivaryState createState() => _MapDelivaryState();
}

class _MapDelivaryState extends State<MapDelivary> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: BackgroundColor,
            appBar: AppBar(
              backgroundColor: AppbarColor,
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text(
                'نەخشە',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              centerTitle: false,
            ),
            drawer: NavegationDrawer(),
            body: Container(
              color: Colors.black12,
            )),
      ),
    );
  }
}
