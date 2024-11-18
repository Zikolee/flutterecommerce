// ignore_for_file: prefer_const_constructors, unused_import, implementation_imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'home.dart';
void main() {
  //runapp
  runApp(const Eagleawakewidget());
}

//Entry widget
//class Eagleawakewidget extends StatelessWidget {
 // const Eagleawakewidget({super.key});

 //@override
  //Widget build(BuildContext context) {
    //return materialApp
    //return MaterialApp(
     //title: "Eagleawake RealEstate",
     //debugShowCheckedModeBanner: false,
    // theme: ThemeData(
      // primarySwatch:Colors.green,
      // ),  
     //  home: Eagleawakehome(),
   // ); 
 // }
//}

//Eagleawakehome
//class Eagleawakehome extends StatefulWidget {
  //const Eagleawakehome({Key? key}) : super
  //(key: key);

  //@override
  //State<Eagleawakehome> createState() =>
   //EagleawakehomeState();
//}

//class EagleawakehomeState extends
//State<Eagleawakehome> {
  //declare property indexcount
  //int indexcount =0;
  //scaffoldkey
  //final GlobalKey<ScaffoldState>
  //_scaffoldkey =
  //GlobalKey<ScaffoldState>();
 //@override
  //Widget build(BuildContext context) {
    //return Scaffold(
      //backgroundColor: Colors.white,
      //key: _scaffoldkey,
      //appBar: AppBar(
        //title: const Text("Eagleawake application"),
        //backgroundColor: Colors.black,
        //elevation: 10,
        //systemOverlayStyle: SystemUiOverlayStyle.light,
      //),
      //drawer: Drawer(
        //child: ListView(
          //padding: EdgeInsets.zero,
          //children: const [
            //UserAccountsDrawerHeader(
              //currentAccountPicture: CircleAvatar( 
                //radius: 50,
                //backgroundImage: NetworkImage("https://tribuneonlineng.com/wp-content/uploads/2022/02/Real-estate-pic-1.jpg",
                //),
              //),
              //accountName: Text("Zikolee"),
               //accountEmail: Text("Akandeisaac63@gmail.com")
               //),
              //ListTile(
                //title: Text("Home"),
                //leading: Icon(Icons.home),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("About"),
                  //leading: Icon(Icons.info),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Contact"),
                  //leading: Icon(Icons.contact_phone),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Settings"),
                  //leading: Icon(Icons.settings),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Logout"),
                  //leading: Icon(Icons.exit_to_app),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("App version 1.0.0"),
                //)
          //],
        //),
      //),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      //floatingActionButton: FloatingActionButton(
        //elevation: 10,
        //onPressed: (){
          //print("Am Working");
        //},
        //child: Icon(Icons.share),
        //),
    //body: SingleChildScrollView(
      //child: Padding(
        //  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
          //child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            //children: [
              //Text("EagleAwake Real Estate", 
              //style: TextStyle(
                //fontSize: 30.0,
                //fontWeight: FontWeight.bold,  
              //),),
              //image from network
              //Image.network(
                //"https://tribuneonlineng.com/wp-content/uploads/2022/02/Real-estate-pic-1.jpg",
                //width: 500.0,
                //height: 400.0,
              //),
              //input
              //TextField(
                //decoration: InputDecoration(
                  //labelText: "Enter your name",
                  //hintText: "Enter your name",
                //),
              //),
              //Padding(
                //padding: const EdgeInsets.all(8.0),
                //child: Text("This is a Sample Text for eagleawake real estate platform fueled by pi currency build by tech zikolee agba programmer",
                //textAlign: TextAlign.center,
              //),
            //),
            //add elevatedbutton
            //ElevatedButton(
              //onPressed: () {
                //print
                //print("Button pressed");
    
                //show SnackBar
                //ScaffoldMessenger.of(context).
                //showSnackBar(
                  //SnackBar(
                    //content: Text("Button pressed"),
                    //backgroundColor:
                    //Colors.green ,
                  //),
                //);
              //},
               //child: Text("Click me"))
           //],
          //),
        //),
    //),
    //resizeToAvoidBottomInset: true,
      //persistentFooterButtons: [
        //Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //children: [
            //IconButton(
          //icon: Icon(Icons.home),
          //onPressed: (){
            //print("Home Button Pressed");
          //},
        //),
          //IconButton(
          //icon: Icon(Icons.settings),
          //onPressed: (){
            //print("Settings Button Pressed");
          //},
        //),
        //IconButton(
          //icon: Icon(Icons.contact_phone),
          //onPressed: (){
            //print("Contact Button Pressed");
          //},
        //),
          //],
        //)

      //],
      //bottomNavigationBar: BottomNavigationBar(
     //   currentIndex: indexcount,
        //fixedColor: Colors.green,
        //items: const [
          //BottomNavigationBarItem(
            //icon: Icon(Icons.home),
            //label: "Home",
          //),
          //BottomNavigationBarItem(
            //icon: Icon(Icons.settings),
            //label: "Settings",
          //),
          //BottomNavigationBarItem(
            //icon: Icon(Icons.contact_phone),
            //label: "Contact",
          //),
        //],
        //onTap: (int index) {
          //print("Index: $index");
          //update indexCount state
          //setState(() {
            //indexcount = index;
          //});
        //}
      //),
      //endDrawer: Drawer(
        //child: ListView(
          //padding: EdgeInsets.zero,
          //children: const [
            //DrawerHeader(
              //decoration: BoxDecoration(
                //color: Colors.black
              //),
              //child: Text("Welcome to EagleAwake", 
              //style: TextStyle(
                //color: Colors.white,
                //fontSize: 30,
              //),)
              //),
              //ListTile(
                //title: Text("Home"),
                //leading: Icon(Icons.home),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("About"),
                  //leading: Icon(Icons.info),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Contact"),
                  //leading: Icon(Icons.contact_phone),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Settings"),
                  //leading: Icon(Icons.settings),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("Logout"),
                  //leading: Icon(Icons.exit_to_app),
                //),
                //Divider(
                  //color: Colors.black,
                  //height: 0,
                //),
                //ListTile(
                  //title: Text("App version 1.0.0"),
                //)
          //],
        //),
      //)
    //);
  //}
//}
 