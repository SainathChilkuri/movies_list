import 'package:flutter/material.dart';

import 'Screens/home_screen.dart';
import 'Utils/custom_drawer.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      drawer: CustomDrawer(),
      body:HomeScreen(),
    );
  }
}
