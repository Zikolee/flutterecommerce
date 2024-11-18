// ignore_for_file: prefer_const_constructors, unused_field, avoid_print

import 'package:flutter/material.dart' show AppBar, BottomNavigationBar, BottomNavigationBarItem, BuildContext, CircleAvatar, ColorScheme, Colors, Divider, Drawer, FontWeight, GlobalKey, Icon, IconButton, Icons, IndexedStack, InkWell, Key, ListTile, ListView, MaterialApp, MaterialPageRoute, Navigator, NetworkImage, Scaffold, ScaffoldState, SizedBox, State, StatefulWidget, StatelessWidget, Text, TextStyle, ThemeData, UserAccountsDrawerHeader, Widget;
import 'package:flutter/widgets.dart';
import 'package:realestate/pages/cart.dart';
import 'package:realestate/pages/home-data/news-card.dart';
import 'package:realestate/pages/shop.dart';

//Entry widget
class Eagleawakewidget extends StatelessWidget {
  const Eagleawakewidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    //return materialApp
    return MaterialApp(
     title: "EagleAwake",
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       colorScheme: ColorScheme.light(
        primary: Color.fromARGB(255, 5, 124, 9),
        onPrimary: Colors.white,
       )
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
  //add pageIndex
  int pageIndex = 0;
   String apptitle = "EagleAwake";

 @override
  Widget build(BuildContext context) {
    var scaffold2 = Scaffold(
      appBar: AppBar(
        title: Text(
          apptitle, style: TextStyle(fontWeight:
        FontWeight.bold,),),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print("Share");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("search");
            },),
            SizedBox(
              width: 10,
            )
        ],
        backgroundColor: pageIndex == 0 ? const Color.fromARGB(255, 5, 124, 9) : Color.fromARGB(255, 5, 124, 9),
        foregroundColor: pageIndex ==0 ?  Colors.white: Colors.white,
      ),
      //drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:  [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar( 
                radius: 50,
              backgroundImage: NetworkImage("http://10.0.2.2/master/assets/uploads/logo.jpg",
                ),
              ),
              accountName: Text("Zikolee"),
               accountEmail: Text("Akandeisaac63@gmail.com")
               ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {
                  print("Home");
                },
                ),
                Divider(
                  color: Colors.black,
                  height: 0,
                ),
                ListTile(
                title: Text("About"),
                  leading: Icon(Icons.info),
                  onTap: () {
                    print("about");
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 0,
                ),
                ListTile(
                  title: Text("Contact"),
                  leading: Icon(Icons.contact_phone),
                  onTap: () {
                    print("Contact");
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 0,
                ),
                ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    print("settings");
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 0,
                ),
              ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {
                    print("logout");
                  },
                ),
                Divider(
                  color: Colors.black,
                  height: 0,
                ),
                ListTile(
                  title: Text("App version 1.0.0"),
                )
          ],
        ),
        ),
      backgroundColor: Colors.green,
      body: IndexedStack(
        index: pageIndex,
        children: const [
          IsaacBlogpage(),
          Isaacecommerce(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          //if index is 2 goto page
          if (index == 2) {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => IsaacCartpage()));
          } else {
           // rebuild ui
            setState(() {
              pageIndex = index;
             // update title
              if (index == 0) {
                apptitle = "EagleAwake";
              } else {
                apptitle = "Ecommerce";
              }
            });
          }
        },
        selectedItemColor: Color.fromARGB(255, 5, 124, 9),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: "E-commerce",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_outlined),
          label: "Cart",
        ),
      ]),
    );
    var scaffold = scaffold2;
    return scaffold;

  }
}