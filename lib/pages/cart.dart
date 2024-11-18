//cart page

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestate/pages/cart/cart-function.dart';
import 'package:realestate/pages/checkout.dart';

class IsaacCartpage extends StatefulWidget {
  const IsaacCartpage({super.key});

  @override
  State<IsaacCartpage> createState() => _IsaacCartpageState();
}

class _IsaacCartpageState extends State<IsaacCartpage> {

  dynamic cart = [];
  IsaacCartfunction isaacCartfunction = IsaacCartfunction();
   var formatter = NumberFormat("#,###,000");

  @override
  void initState() {
    //TODO: implement initState
    super.initState();
    //get cart
    getCart();
  }

  //get cart
  getCart() async {
    //get cart from local storage
    var cartRes = await isaacCartfunction.getCart();
    //update state
    setState(() {
     cart = cartRes;
    });
  }

  //getTotal
  getTotal() {
    int total = 0;
    for (var i = 0; i < cart.length; i++) {
      int price = int.parse(cart[i]["product"]["price"]);
      int quantity = cart[i]["quantity"];
      total += price * quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Color.fromARGB(255, 5, 124, 9),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: cart.length > 0 ? Column(
          children: [
            for (var i = 0; i < cart.length; i++)
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //product image
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image:  DecorationImage(
                            image: NetworkImage(
                              cart[i]["product"]["image"] ?? " "),
                            fit: BoxFit.cover
                            )),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      //product name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            reduceWords(cart[i]["product"]["title"] ?? " "),
                            style: TextStyle(fontSize: 18, fontWeight:
                            FontWeight.bold),
                          ),
                           SizedBox(
                        height: 1,
                      ),
                      Text(
                            "π${formatter.format(int.parse(cart[i]["product"]["price"] ?? " "))}",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                               fontWeight:
                            FontWeight.bold),
                          ),
                          SizedBox(
                        height: 3,
                      ),
                       Row(
                         children: [
                           Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  //check if quantity is greater than 1
                                  if (cart[i]["quantity"] > 1) {
                                    //decrease quantity
                                    var newQuantity =
                                    cart[i]["quantity"] - 1;
                                    //update cart
                                    isaacCartfunction.addToCart(
                                      product: cart[i]["product"], quantity:
                                      newQuantity);
                                      //update state
                                      getCart();
                               }
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(
                                    Icons.remove, color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                cart[i]["quantity"].toString(),
                                 style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold
                              ),),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  //increase quantity
                                  var newQuantity =
                                  cart[i]["quantity"] + 1;
                                  //update cart
                                  isaacCartfunction.addToCart(
                                    product: cart[i]["product"],
                                    quantity: newQuantity);
                                    //update state
                                    getCart();
                                  },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
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
                        width: 10,
                      ),
                      //remove cart icon
                      InkWell(
                        onTap: () {
                          //remove cart
                          isaacCartfunction.removeFromCart(
                            productid: cart[i]["product_id"]);
                            //snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Color.fromARGB(255, 5, 124, 9),
                                content: Text(
                                "Item Removed from cart"
                              ))
                            );
                            //update state
                            getCart();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            Icons.delete, color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Text(
                        "π${formatter.format((int.parse(cart[i]["product"]["price"]) * 
                        cart[i]["quantity"]))}",
                       style: TextStyle(color: Colors.red,
                      fontSize: 15, fontWeight: FontWeight.w900),)
                         ],
                       ),
                        ],
                      )
                    ],
                  ),),
                  Divider(
                    color: Colors.grey,
                  ),
              ],
            ),
            //footer
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                   "π${formatter.format(getTotal())}",
                   style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w900), 
                  )
                ],
              ),
            ),
            //checkout button
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ElevatedButton(
                onPressed: () {
                  //check if cart is empty
                  if (cart.length == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Color.fromARGB(255, 5, 124, 9),
                      content: Text("Cart is empty")
                    ));
                  } else {
                    //navigate to checkout page
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => IsaacCheckout
                    (totalAmount: getTotal(),)));
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 5, 124, 9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            )
          ],
        )
        : Center(
          child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Icon(Icons.shopping_bag_outlined,
              size: 100, color: Colors.grey),
              SizedBox(
                height: 10,
              ),
              Text(
                " Your Cart is empty",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  //background color
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    "Go to shop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
  //reduce words more than 20
String reduceWords(String text) {
  if (text.length > 20) {
    return "${text.substring(0, 25)}...";
  } else {
    return text;
  }
}
}