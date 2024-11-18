import 'dart:convert';

import 'package:ade_flutterwave_working_version/core/ade_flutterwave.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestate/pages/Isaaclogin.dart';
import 'package:realestate/pages/cart/cart-function.dart';
import 'package:realestate/pages/isaacorderpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IsaacCheckout extends StatefulWidget {
  final totalAmount;
  const IsaacCheckout({Key? key, this.totalAmount}) : super(key: key);

  @override
  State<IsaacCheckout> createState() => _IsaacCheckoutState(totalAmount:
  totalAmount);
}
class _IsaacCheckoutState extends State<IsaacCheckout> {
  dynamic totalAmount;
  var formatter = NumberFormat("#,###,000");

  _IsaacCheckoutState({this.totalAmount});

   //check if user is logged in
  isUserLoggedIn() async {
    // Obtain shared preferences.
  final prefs = await SharedPreferences.getInstance();
  var user_detail = prefs.getString('userdetail');
  if (user_detail == null) {
    return false;
  } else {
    return true;
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
         backgroundColor: Color.fromARGB(255, 5, 124, 9),
        foregroundColor: Colors.white,),
        body: Column(
          children: [
          //total amount
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "π${formatter.format(totalAmount)}",                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                  color: Colors.red),
                ),
              ],
            ),
          ),
          //divider
          Divider(
            thickness: 2, color: Colors.green,
          ),
          //payment method title
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 10),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(
                 "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //icon
                Icon(Icons.credit_card)
              ],
            ),
          ),
          //Flutterwave
          InkWell(
            onTap: () async {
              isUserLoggedIn(). then((value) {
                            if (value) {
                              //process flutterwave payment
                               processFlutterwave();
                            } else {
                              //goto login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Isaaclogin()));
                            }
                          });
              //get data from shared preferences
           // final prefs = await SharedPreferences.getInstance();
            //get string
           // var userdetail = prefs.getString('userdatail');
            //decode userdetail
           // var userdetaildecoded = jsonDecode(userdetail!)
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                //add background color
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                width: double.infinity,
                child: Image(image: NetworkImage(
                  "https://uploads-ssl.webflow.com/605b36f6fle296440dc6f503/61e9e9f6e231ba78035e36d2_Flutterwave.png"
                ),
                height: 60,
                width: double.infinity),
              ),
            ),
          ),
          //paystack
          InkWell(
            onTap: () {
              print("paystack");
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 10),
                //add background color
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 60,
                width: double.infinity,
                child: Image(image: NetworkImage(
                  "https://uploads-ssl.webflow.com/605b36f6fle296440dc6f503/61e9e9f6e231ba78035e36d2_Flutterwave.png"
                ),
                height: 60,
                width: double.infinity),
              ),
            ),
          ),
        ]),
    );
  }

  //processFlutterwave
  processFlutterwave()async {
           //get data from shared preferences
            final prefs = await SharedPreferences.getInstance();
            //get string
            var userdetail = prefs.getString('userdatail');
            //decode userdetail
            var userdetaildecoded = jsonDecode(userdetail!);
            var user_id = userdetaildecoded["user_details"]["id"];
               //check if the fields are empty
      // if (totalAmount.isEmpty ||
        //_emailController.text.isEmpty ||
        //_phoneController.text.isEmpty ||
        //_fullNameController.text.isEmpty) {
      //ScaffoldMessenger.of(context).showSnackBar(
        //const SnackBar(
          //content: Text('Please fill all the fields'),
        //),
      //);
      //return;
    //}
    //data
    var data = {
      'amount': totalAmount,
      'email': "${userdetaildecoded["user_details"]["email"]}",
      'phone': "",
      'name': "${userdetaildecoded["user_details"]["name"]}",
      'title': 'products payment',
      'currency': "NGN",
      'tx_ref':
          "ecommerce-${DateTime.now().millisecondsSinceEpoch}",
      'icon':
          "https://www.aqskill.com/wp-content/uploads/2020/05/logo-pde.png",
      'public_key':
          "FLWPUBK_TEST-e0787ab2e5b0b6fcb3d32ce465ad44d0-X",
      'sk_key':
          'FLWSECK_TEST-af1af523da3f141f894a26be4b071230-X'
    };

    //get only product id and quantity
     Navigator.push(
     context,
    MaterialPageRoute(
    builder: (context) => AdeFlutterWavePay(data),
    ),
    ).then((payresponse) async {
     // payresponse is the payresponse from the payment
     if(payresponse["status"] != "success") {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("payment Failed"),
        backgroundColor: Colors.red,
      ));
      return false;
     }
     var tx_id = payresponse["data"]["id"];
  });
    //get cart
    var allcart = await IsaacCartfunction().getCart();
    var products = [];
    for (var cartdata in allcart) {
      products.add({
        "product_id": cartdata["product_id"],
        "quantity": cartdata["quantity"],
        "product_price" : cartdata["product"]["price"]
      });
    }
    //use dio
  var dio = Dio();
  var total = await getTotal();
    //send data to server
    var serverData = {
      "user_id": user_id,
      "products": products,
      "total": total,
      "payment_gateway": "flutterwave",
      "tx_id": "tx_id"
      };
  //convert to formdata
  var formData = FormData.fromMap(serverData);

  //send data to server
  var response = await dio.post(
    "http://10.0.2.2/piagric/api/create_order",
    data: formData);
     //check if the response is 200
      if (response.data["code"] == 200) {
        //do something good
        //clear the cart
        await IsaacCartfunction().clearCart();
        //go to order page
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>
          isaacorderpage())
        );
      } else {
        //show info
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.data["message"])));
      }
}
//gettotal
getTotal() async {
    int total = 0;
    var cart = await IsaacCartfunction().getCart();
    for (var i = 0; i < cart.length; i++) {
      int price = int.parse(cart[i]["product"]["price"]);
      int quantity = cart[i]["quantity"];
      total += price * quantity;
    }
    return total;
  }
}