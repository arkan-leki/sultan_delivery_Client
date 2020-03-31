import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/HomeScreen.dart';
import 'utilties/appbar_theme.dart';
import 'package:sultan_delivery/utilties/util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String _deviceid = 'Unknown';

  Future<void> initDeviceId() async {
    _deviceid = await DeviceId.getID;
    phoneid = _deviceid;
    print(phoneid);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initDeviceId();
    return MaterialApp(
      title: 'Sultan Delivary',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.apptheme,
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: HomeScreen(),
      ),
    );
  }
}
