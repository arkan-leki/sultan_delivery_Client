import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/Courtomer/shoping_basket.dart';
import 'package:sultan_delivery/shared_ui/Navigation_drawer.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';

import 'TabBar/Favourites.dart';
import 'TabBar/ParentFoodsList.dart';
import 'TabBar/WhatisNew.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { HELP, ABOUT, CONTACT, SETTINGS }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppbarColor,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'فۆرمی سەرەکی',
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          centerTitle: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {}),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.new_releases,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.fastfood,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
              ),
            ],
            controller: _tabController,
          ),
        ),
        drawer: NavegationDrawer(),
        body: TabBarView(
          children: <Widget>[
            WhatisNew(),
            ParentFoodsList(),
            Favourites(),
          ],
          controller: _tabController,
        ),
        floatingActionButton: Shopingbasket(),
      ),
    );
  }
}
