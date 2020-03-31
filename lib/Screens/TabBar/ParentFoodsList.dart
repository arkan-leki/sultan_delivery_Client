import 'package:flutter/material.dart';
import 'package:sultan_delivery/Screens/ChildrenFoods.dart';
import 'package:sultan_delivery/Screens/data/Cat.dart';
import 'package:sultan_delivery/utilties/CatsAPI.dart';
import 'package:sultan_delivery/utilties/TextStyles.dart';

class ParentFoodsList extends StatefulWidget {
  @override
  _ParentFoodsListState createState() => _ParentFoodsListState();
}

class _ParentFoodsListState extends State<ParentFoodsList> {
  CatAPI _catAPI = new CatAPI();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: FutureBuilder(
          future: _catAPI.fetchalldata(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Cat cat = snapshot.data[index];
                  return Card(
                    color: Colors.grey.shade900,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChildrenFoods(cat.id)),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(2),
                                decoration: myBoxDecoration(),
                                child: _newsIetmRow(cat)),
                          ],
                        ),
                      ),
                    ),
                    //     margin: EdgeInsets.only(bottom: 4),
                  );
                },
              );
            } else if (snapshot.hasError) {
              throw snapshot.error;
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _newsIetmRow(Cat cat) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(cat.image).image,
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleNameFood(cat.nameEg),
              SizedBox(
                height: 8,
              ),
              titleNameFoodKu(cat.nameKu),
              detilesFood(cat.detiles),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text titleNameFood(String name) {
    return Text(
      name,
      style: titleNameFoodStyle,
    );
  }

  Text titleNameFoodKu(String name) {
    return Text(
      name,
      style: titleParentFoodsKU,
    );
  }

  Text detilesFood(String name) {
    return Text(
      name,
      style: detilesStyleParentFoods,
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.amber,
        width: 0.2,
      ),
    );
  }
}
