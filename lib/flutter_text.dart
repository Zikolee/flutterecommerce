// ignore_for_file: prefer_const_constructors, unused_field
import 'package:flutter/gestures.dart';
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            height: 100,
            child: Text(
              "Welcome to Eagleawake dhdgfhhkfjg hgffgg gddffggg gtedffggfg ghhjjjh gtrfddfg hiookjnn hgffcbuiu",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold,
                letterSpacing: 2,
                wordSpacing: 3
              ),),
          ),
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.black,
              fontSize: 16),
              children: [
                WidgetSpan(
                  child: Icon(Icons.unsubscribe_rounded)
                ),
                TextSpan(
                  text: "  Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                    ..onTap =() {
                      print("Sign Up");
                    }
                )
              ]
            ))
        ],
      )
    );

  }
}