// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import 'cart.dart';
import 'cart/cart-function.dart';

class Isaacproductdetail extends StatefulWidget {
  final product;
  const Isaacproductdetail({Key? key, this.product}) : super(key: key);

  @override
  State<Isaacproductdetail> createState() => _IsaacproductdetailState(product: product);
}

class _IsaacproductdetailState extends State<Isaacproductdetail> {
  var formatter = NumberFormat("#,###,000");
  int quantity = 1;
  dynamic product;
  _IsaacproductdetailState({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 124, 9),
        foregroundColor: Colors.white,
         actions: [
              //goto cart
              IconButton(onPressed: (){
                //got to IsaacCart
                Navigator.push(context, MaterialPageRoute(builder:
                (context) {
                  return IsaacCartpage();
                }
                 ));
              }, icon: Icon(Icons.shopping_cart, color: Colors.white)),
              SizedBox(
                width: 10,
              )
            ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(product["image"],
              fit: BoxFit.cover,),
            ),
            //leading: IconButton(
             // icon:Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 5, 124, 9),),
             // onPressed: () {
              //  Navigator.pop(context);
              //},
           // ),
            //actions: [
              //goto cart
             // IconButton(onPressed: (){
                //got to IsaacCart
              //  Navigator.push(context, MaterialPageRoute(builder:
              //  (context) {
              //    return IsaacCartpage();
              //  }
              //   ));
             // }, icon: Icon(Icons.shopping_cart, color: Colors.orange)),
            //  SizedBox(
             //   width: 10,
             // )
            //],
            //status bar color to white
            backgroundColor: Colors.green,
          ),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 2, bottom: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  style: BorderStyle.solid,
                  width: 2.0,
                )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("π${formatter.format(int.parse(product["price"]))}", style: TextStyle(color: Colors.red, fontSize: 18,
                      fontWeight: FontWeight.w900)),
                      Spacer(),
                      //share icon
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.black,),
                        onPressed: () {
                          Share.share("Check out this product on Isaacstore ${product["title"]} ${product["link"]}");
                        },
                        )
                    ],
                  ),
                 Divider(
              color: Colors.green,
              thickness: 1,
            ),
            Text(product["title"], style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold
            )),
            Container(
              //add background color
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(product["category"] ?? " ", style: TextStyle(color: Colors.purple,
              fontSize: 14, fontWeight: FontWeight.bold),)),
               Divider(
              color: Colors.green,
              thickness: 2,
            ),
            //product title
               Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text("Product Details", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
                  Divider(
              color: Colors.green,
              thickness: 2,
            ),
            Text(product["content"],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.green,
              thickness: 2,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    //check if quantity is greater than 1
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                        });
                  }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(
                      Icons.remove, color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  quantity.toString(), style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                      setState(() {
                        quantity++;
                        });
                    },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(
                      Icons.add, color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                IsaacCartfunction().addToCart(product: product, quantity: quantity);
               //show snackbar
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Added to cart"),
                duration: Duration(seconds: 2),
               ));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 5, 124, 9),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text("add to cart", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            )
                ],
              ),
            ),
          ]))
        ],
          ));
  }
}