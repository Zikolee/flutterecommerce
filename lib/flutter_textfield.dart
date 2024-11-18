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
  //usernamecontroller
  final TextEditingController _usernameController = TextEditingController();
  //passwordcontroller
  final TextEditingController _passwordController = TextEditingController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zikolee Application"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person, color: Colors.black,),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                labelText: "User Name",
                hintText: "Enter User Name"
              ),
            ),
          ),
          //password
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.black,),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                labelText: "Password",
                hintText: "Enter Password"
              ),
            ),
          ),
          //button
          Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                var username = _usernameController.text;
                var password = _passwordController.text;
                print("username: ${username}password: $password");
              },
              child: Text("Login"),
            ),
          ),
        ],
      )
    );

  }
}