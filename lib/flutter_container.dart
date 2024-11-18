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
      body: Container(
        height: 100,
        alignment: Alignment.center,
        width: 350,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(-5.0, 6.0)
              )
            ]
          ),
        child: Text("Am working on a project dgfhfhkfljfj fhfgfhshghfhfh", style: TextStyle(
          fontSize: 20, color: Colors.blue),),
      ),
    );

  }
}