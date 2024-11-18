//create ecommerce page

// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/home-data/product-data.dart';

import 'home-data/slider.dart';

class Isaacecommerce extends StatefulWidget {
  const Isaacecommerce({super.key});

  @override
  State<Isaacecommerce> createState() => _IsaacecommerceState();
}

class _IsaacecommerceState extends State<Isaacecommerce> {

List products = [];
List productsHeader = [];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  //get products
getProducts() async {
    var dio = Dio();
    var response = await dio.get("http://10.0.2.2/piagric/api/get_products");
    //print(response);
   // print(response.data.sublist(0, 2));
    //pick two products productsHeader
   var productsHeader1 = response.data.sublist(0, 3);

    //print ("this is $productsHeader1");
    //pcik the rest of the products take out first two products
    var products1 = response.data.sublist(0); //what do you plan on archieving here? i want it to list two post below the slider
    // print("this is product1 $products1");
    // print(products1.runtimeType);
    setState(() {
      products = products1;
      //print (products);
      productsHeader = productsHeader1;
    });
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: products.length > 0 ? Column(
        children: [
          Isaacproductslider().getProductSlider(
            height: height, products: productsHeader),
            Divider(
              color: Colors.green,
              thickness: 2,
            ),
             Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("Latest goods", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            //product list
            Isaacproductcard().getCard(context, products)
        ],
      )
      : Center(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          child: CircularProgressIndicator(color: Colors.red,)),
      ),
    ),
      );
  }
}