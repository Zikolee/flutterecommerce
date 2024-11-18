
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestate/pages/shop-single.dart';

class Isaacproductcard {
  var formatter = NumberFormat("#,###,000");
  Widget getCard(context, products) {
    return Wrap(
              children: [
                for (var i = 0; i < products.length; i++)
                InkWell(
                  onTap: (){
                    //goto product detail
                    Navigator.push(context, MaterialPageRoute(builder:
                   (context)=> Isaacproductdetail(product: products[i],
                   )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: Container(
                      //add border color
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[400]!),
                      ),
                      width: 180,
                      height: 230,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Image.network(
                          products[i]["image"],
                          width: 180,
                          height: 120,
                          fit: BoxFit.cover),
                          Divider(
                              color: Colors.green,
                               thickness: 1,
                               ),
                          //category
                          Container(
                            padding: EdgeInsets.all(1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[i]["category"], style: TextStyle(
                                fontSize: 13, color: Colors.orange, fontWeight: FontWeight.bold
                              ),),
                              Divider(
                               color: Colors.green,
                               thickness: 2,
                               ),
                              Text(products[i]["title"], maxLines: 1,
                              style: TextStyle(
                                fontSize: 16, color: Colors.black,
                                fontWeight: FontWeight.w900),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              Row(
                                children: [
                                   Text(
                               "π${formatter.format(int.parse(products[i]["price"]))}",
                                 style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 15,
                                   fontWeight: FontWeight.w900
                                 ),
                               ),
                                   Spacer(),
                                  Container(
                                    padding: EdgeInsets.all(1),
                                    //add background color
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text("New design", style: TextStyle(
                                      fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white
                                    ),
                                    ))
                                ],
                              )
                            ],
                          )),
                                ]),
                    ),
                  ),
                )
              ],
            );
  }
}