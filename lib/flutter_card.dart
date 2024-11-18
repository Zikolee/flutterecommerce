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
  _scaffoldkey = GlobalKey<ScaffoldState>();
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zikolee Application"),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          padding: EdgeInsets.all(10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.blue,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text("Starboy 50BG", style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  ),),
                  subtitle: Text("Best of Wizkid Music", style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),),
                  leading: Icon(Icons.album, color: Colors.white,
                  size: 40,),
                ),
                //button
                OverflowBar(
                  alignment: MainAxisAlignment.center,
                  children: [ ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.black,
                    ),
                     onPressed: (){
                    print("Play");
                  },
                   child: Text("Play")),
                 //pause
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black,
                  ),
                   onPressed: (){
                    print("pause");
                  },
                  child: Text("pause")),
              ])
              ]),
          ),
        ),
      )
    );

  }
}