import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/MainScreen.dart';
import 'utilties/appbar_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sultan Delivary',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.apptheme,
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: MainScrreen(),
      ),
    );
  }
}
