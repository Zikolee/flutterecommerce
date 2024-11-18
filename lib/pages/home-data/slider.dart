// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:realestate/pages/shop-single.dart';

class Isaacproductslider {
  var formatter = NumberFormat("#,###,000");
  Widget getProductSlider({height, products, context}) {
    dynamic Product = products[0];
    //print (Product);
    return  Container(
        child: CarouselSlider(items: [
          for(var i = 0; i < products.length; i++)
          InkWell(
            onTap: () {
              //navigate to products details
              Navigator.push(context, MaterialPageRoute(builder:
                   (context)=> Isaacproductdetail(product: products[i],
                   )));
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(1.0),
              //background image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                   products[i]["image"]),
                    fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0.1),
                    ],
                  )
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //add background color
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            //border radius
                            borderRadius: BorderRadius.circular(2),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            products[i]["category"],
                            style: const TextStyle(color: Colors.white,
                            fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          products[i]["title"],
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                          ),
                           SizedBox(
                            height: 5,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               "π${formatter.format(int.parse(products[i]["price"]))}",
                                 style: TextStyle(
                                   color: Colors.red,
                                   fontSize: 15,
                                   fontWeight: FontWeight.w900
                                 ),
                               ),
                              Container(
                                //add background color
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  //border radius
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.all(2.0),
                                child: const Text(
                                  "Active",
                                  style: TextStyle(color: Colors.white,
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                      ],
                    ),
                  )),
                ),
              ),
          ),
        ],
        options: CarouselOptions(
          height: (height / 3.2),
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          pauseAutoPlayOnTouch: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
        ));
  }

  newMethod(products, int i) => products[i];
}