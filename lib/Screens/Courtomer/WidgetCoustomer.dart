import 'package:flutter/material.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/Screens/Courtomer/ListOfCoustomerRequest.dart';
import 'package:sultan_delivery/Screens/MapDelivary.dart';

class WidgetCoustomer extends StatefulWidget {
  @override
  _WidgetCoustomerState createState() => _WidgetCoustomerState();
}

class _WidgetCoustomerState extends State<WidgetCoustomer> {
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
                  'لیستی گواستنەوە',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                centerTitle: false,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.location_on,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapDelivary()),
                        );
                      }),
                ]),
            drawer: NavegationDrawer(),
            body: ListView.builder(
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListOfCoustomerRequest(),
                );
              },
              itemCount: 1,
            )),
      ),
    );
  }
}
