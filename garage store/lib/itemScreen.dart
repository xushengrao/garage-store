import 'package:flutter/material.dart';
import 'heroAnimation.dart';
import 'record.dart';


class ItemScreen extends StatelessWidget{
  Record record;
  ItemScreen(Record record){
    this.record = record;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Let us bargin'),
          actions: <Widget>[

          ]
      ),
      body: ListView(
        children: <Widget>[
          imageSection(context),
          informationSection(context),
        ],
      ),
    );
  }
  // Construct item image section
  Widget imageSection(BuildContext context){
    int count = 0;
    count += (record.imagePath1 == null ? 0 : 1);
    count += (record.imagePath2 == null ? 0 : 1);
    count += (record.imagePath3 == null ? 0 : 1);
    count += (record.imagePath4 == null ? 0 : 1);
    return Container(

      padding: const EdgeInsets.only(top:20, left: 10),
      child: Column(
        children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            children: <Widget>[
              if(record.imagePath1 != null)HeroAnimation(record.imagePath1),
              if(record.imagePath2 != null)HeroAnimation(record.imagePath2),
              if(record.imagePath3 != null)HeroAnimation(record.imagePath3),
              if(record.imagePath4 != null)HeroAnimation(record.imagePath4),
            ],
          ),
        ],
      ),
    );
  }

  Widget informationSection(BuildContext context){
    return Container(
      padding: const EdgeInsets.only(top:10, left: 20,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(

              'Item Name: ' + record.item,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Price: \$ ' + record.price,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                //fontSize: 18
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Introduction of this product ',
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    fontSize: 20
                    //fontSize: 18
                  ),
                ),
                Divider(
                  color: Colors.green,
                  thickness: 4,
                ),
                Text(
                  record.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}