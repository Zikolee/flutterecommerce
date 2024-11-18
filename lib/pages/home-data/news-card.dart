//create blog stateful

// ignore_for_file: avoid_init_to_null, avoid_print
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/single-blog.dart';
import 'news-card-list.dart';

class IsaacBlogpage extends StatefulWidget {
  const IsaacBlogpage({super.key});

  @override
  State<IsaacBlogpage> createState() => _IsaacBlogpageState();
}

class _IsaacBlogpageState extends State<IsaacBlogpage> {
dynamic blogheader = null;
dynamic blogbody = null;

// oninit
@override
 void initState() {
  super.initState();
  getBlog();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SingleChildScrollView(
        child: Column(
          children: [
            //blog header
            blogheader != null ? InkWell(
              onTap: (){
                //goto blog detail
                Navigator.push(context,
                 MaterialPageRoute(builder: (context) => IsaacBlogDetail(blogdetail:
                 blogheader)));
              },
              child: Container(
                width: double.infinity,
                height: 240,
                //backgroud image
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                    blogheader["image"]),
                    fit: BoxFit.cover,
                    ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(.0),
                      ],
                    )
                  ),
                  padding: const EdgeInsets.all(15),
                  child:
                  Align(
                    alignment: Alignment.bottomLeft,
                  child: Text(
                    blogheader["title"],
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 22,
                  color: Colors.white, height: 1.2, fontWeight: FontWeight.w900),)), 
                ),
              ),
            ) : const Center(
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: CircularProgressIndicator(color: 
                Colors.purple,))),
                Divider(
              color: Colors.green,
              thickness: 3,
            ),
            Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text("Latest Posts", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
            //body
            blogbody != null ? Column(
              children: [
                 for (var i = 0; i < blogbody.length; i++)
            InkWell(
              onTap: () {
                //goto blog detail
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IsaacBlogDetail
                  (blogdetail: blogbody[i])));
              },
              child: zikoBloglist().getCard(
              date: blogbody[i]["date"] ?? " ",
              thumbnail: blogbody[i]["image"] ?? " ",
              title: blogbody[i]["title"] ?? " ",
              description: blogbody[i]["content"] ?? " ",
              author: blogbody[i]["author"] ?? " ",
              comments: blogbody[i]["comments"] ?? "",
              ),
            )
            ],
          ) :const Center(
              child: Padding(
                padding: EdgeInsets.all(60.0),
                child: CircularProgressIndicator(color: 
                Colors.purple,))),
        ],
        ),
      ));
  }
  //get_posts
   void getBlog() async {
    try {
      var response = await Dio().get('http://10.0.2.2/piagric/api/get_posts');
      var data = response.data;
      var firstindex = data[0];
      var body = data.sublist(1);
      setState(() {
        blogheader = firstindex;
        blogbody = body;
      });
 } catch (e) {
  print(e);
 }
}
}