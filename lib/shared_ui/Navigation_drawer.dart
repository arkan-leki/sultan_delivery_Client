import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/HomeScreen.dart';
import 'package:sultan_delivery/Screens/DiscountFoods.dart';
import 'package:sultan_delivery/Screens/MapDelivary.dart';
import 'package:sultan_delivery/model/nav_menu.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';
import 'package:sultan_delivery/Screens/FoodsRequest/FoodRequest.dart';
import 'package:sultan_delivery/Screens/Courtomer/WidgetCoustomer.dart';
import 'package:sultan_delivery/Screens/AboutSultan.dart';

class NavegationDrawer extends StatefulWidget {
  @override
  _NavegationDrawerState createState() => _NavegationDrawerState();
}

class _NavegationDrawerState extends State<NavegationDrawer> {
  List<IconButton> iconButton = [];

  List<NavMenuItem> navigationMenu = [
    NavMenuItem(() => HomeScreen()),
    NavMenuItem(() => DiscountFoods()),
    NavMenuItem(() => FoodRequest()),
    NavMenuItem(() => WidgetCoustomer()),
    NavMenuItem(() => MapDelivary()),
    NavMenuItem(() => AboutSultan()),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: BackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.line_weight, text: 'فۆرمی سه‌ره‌كی', position: 0),
            _createDrawerItem(
                icon: Icons.card_giftcard, text: 'داشکاندنەکان', position: 1),
            _createDrawerItem(
                icon: Icons.shopping_cart, text: 'داواکراوەکان', position: 2),
            _createDrawerItem(
                icon: Icons.format_list_bulleted,
                text: 'لیستی گواستنەوە',
                position: 3),
            _createDrawerItem(
                icon: Icons.location_on, text: 'نەخشە', position: 4),
            _createDrawerItem(
                icon: Icons.info, text: 'دەربارەی ئێمە', position: 5),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return Container(
      color: Colors.amberAccent,
      padding: EdgeInsets.only(bottom: 1),
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sultanBl.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: Text(" Sultan Restaurant ", style: titleStyleDrawer),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap, int position}) {
    return Container(
      color: BackgroundColor,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: IconsColor,
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Transform.translate(
                  offset: Offset(-12, 0),
                  child: Text(
                    text,
                    style: titleStyle,
                  )),
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return navigationMenu[position].destrination();
            }),
          );
        },
      ),
    );
  }
}
