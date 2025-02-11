//new class for blog list template

import 'package:flutter/material.dart';

class zikoBloglist {
  //method
  Widget getCard ({thumbnail, title, description, author, date, comments}) {
return Card(
            margin: const EdgeInsets.all(7),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              child: Row(children: [
                //image
                Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      thumbnail),
                      fit: BoxFit.cover,
                  ),
                ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    //title
                    Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(fontSize: 15, color: Color.fromARGB(255, 5, 124, 9),
                    fontWeight: FontWeight.w900, height: 1.2),),
                    const SizedBox(height: 5,),
                    //date and author
                    Text.rich(TextSpan(
                      text: "by ",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: author,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 5, 124, 9),
                            height: 1.2,
                            fontWeight: FontWeight.w900,
                          ),
                         ),
                          TextSpan(
                            text: " at $date",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              height: 1.2,
                              fontWeight: FontWeight.normal,
                            )),
                            //comment
                            // TextSpan(
                            //  text: "()",
                             // style: const TextStyle(
                             //   fontSize: 15,
                               // color: Colors.black,
                              //  height: 1.2,
                               // fontWeight: FontWeight.normal,
                              //)
                           // )
                      ]
                    )
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.2,
                      fontWeight: FontWeight.normal
                    ),)
            
                  ],),
                )
              ]),
            ),
          );
  }
}