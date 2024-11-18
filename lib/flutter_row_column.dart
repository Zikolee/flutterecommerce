// ignore_for_file: prefer_const_constructors, unused_field
import 'package:flutter/material.dart';
void main() {
  //runapp
  runApp(const Eagleawakewidget());
}

//Entry widget
class Eagleawakewidget extends StatelessWidget {
  const Eagleawakewidget({super.key});

  @override
  Widget build(BuildContext context) {
    //return materialApp
    return MaterialApp(
     title: "Eagleawake RealEstate",
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       primarySwatch:Colors.blue,
       ),  
       home: Eagleawakehome(),
    ); //
  }
}

//Eagleawakehome
class Eagleawakehome extends StatefulWidget {
  const Eagleawakehome({Key? key}) : super
  (key: key);

  @override
  State<Eagleawakehome> createState() =>
   EagleawakehomeState();
}

class EagleawakehomeState extends
State<Eagleawakehome> {
  //scaffoldkey
  final GlobalKey<ScaffoldState>
  _scaffoldkey =
  GlobalKey<ScaffoldState>();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zikolee Application"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("How are you"),
              Text("How are you"),
              Text("How are you"),
            ],),
            Text("This is another column")
          ],
        ),
      )
    );

  }
}