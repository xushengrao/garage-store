/// @author Yao Miao
/// crete data: April 01 2020
/// version 3.0
/// the entrance of the app

import 'package:flutter/material.dart';
import 'signin_page.dart';



void main() async{

  runApp(MyApp());
}
class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flea market',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage()

    );
  }

}


















