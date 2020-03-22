import 'package:flutter/material.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';

class AboutSultan extends StatefulWidget {
  @override
  _AboutSultanState createState() => _AboutSultanState();
}

class _AboutSultanState extends State<AboutSultan> {
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
              'دەربارەی ئێمە',
              style: titleStyle,
            ),
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.home,
                    color: iconsColor,
                  ),
                  onPressed: () {}),
            ],
          ),
          drawer: NavegationDrawer(),
          body: Container(
            padding: EdgeInsets.only(
              top: 25,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text('Sultan Restaurant',
                              style: titleStyleAboutSultna),
                          SizedBox(
                            height: 8,
                          ),
                          Text('ڕێستۆرانتی سوڵطان',
                              style: titleStyleAboutSultna),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/sultan.jpg'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                      width: 110,
                      height: 110,
                      margin: EdgeInsets.only(
                        right: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text("ناو نیشان : کەلار _ تەنیشت کتێبخانەی گشتی  ",
                      style: detilesAboutSultna),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
