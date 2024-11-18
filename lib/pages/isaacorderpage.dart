import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:realestate/flutter_card.dart';

class isaacorderpage extends StatefulWidget {
  const isaacorderpage({super.key});

  @override
  State<isaacorderpage> createState() => _isaacorderpageState();
}

class _isaacorderpageState extends State<isaacorderpage> {
  
  //get order
  getOrder() async {
     var dio = Dio();
  //send data to server
  var response = await dio.post(
    "http://10.0.2.2/piagric/api/get_order",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Order page"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:
            (context) {
              return Eagleawakehome();
            }));
          },
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              getOrder();
            },
            child: Padding(
             padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(3.0, 5, 3, 5),
              child: ListTile(
                title: Text("#324689", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Text("order date: 12/12/2021",
                    style: TextStyle(fontSize: 15),),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Completed", style: TextStyle(fontSize:15)
                    ),
                  ],
                ),
                trailing: Text("#1,000", style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold, color: Colors.red)),
              ),
              ),
            ),
            ),
          ), 
        ],
      ),
    );
  }
}