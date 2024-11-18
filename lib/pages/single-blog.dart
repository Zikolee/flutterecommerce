//IsaacBlogDetail

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/Isaaclogin.dart';
import 'package:realestate/pages/comments.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsaacBlogDetail extends StatefulWidget {
  
  final blogdetail;
  const IsaacBlogDetail({Key? key, this.blogdetail}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<IsaacBlogDetail> createState() => _IsaacBlogDetailState(blogdetail:
  blogdetail);
}

class _IsaacBlogDetailState extends State<IsaacBlogDetail> {

  final blogdetail;
 dynamic blogcontent;
 dynamic blogcomment;

//constructor
  _IsaacBlogDetailState({this.blogdetail});

  //oninit
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    getBlogContent();
    getBlogComment();
    //TODO: fix issue in comments and body
  }

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
  
  //getBlogContent
  getBlogContent() async {
    try {
      var response = await Dio().get('http://10.0.2.2/piagric/api/get_post/${blogdetail["post_id"]}');
      var data = response.data;
      
      setState(() {
        blogcontent = data["content"];
        //blogcontent = data;
      });
 } catch (e) {
  print(e);
 }
  }

  //getBlogComment
  getBlogComment() async {
    try {
      var response = await Dio().get('http://10.0.2.2/piagric/api/get_comments/${blogdetail["post_id"]}');
     print(response);
      var data = response.data;
      setState(() {
        blogcomment = data;
        });
        } catch (e) {
  print(e);
 }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 5, 124, 9),
        foregroundColor: Colors.white,
        title: Text(blogdetail["title"] ?? " "),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              //background
              decoration:  BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(blogdetail["image"] ?? " "),
                          fit: BoxFit.cover,
                          ),
              ),
            ),
            Divider(
              color: Colors.green,
              thickness: 3,
            ),
            //share icon and comments
            Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Share.share('${blogdetail["title"]} ${blogdetail["link"]}');
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 124, 9),
                            fontSize: 16,
                            height: 1.2,
                            fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.comment,
                        color: Colors.black,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          isUserLoggedIn(). then((value) {
                            if (value) {
                              //goto comment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IsaacBlogComment(
                                    commentArray: blogcomment)));
                            } else {
                              //goto login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Isaaclogin()));
                            }
                          });
                        },
                        child:
                          Text(
                           "(${blogcomment != null ? blogcomment! .length :'---'}) Comments",
                           style: const TextStyle(
                             color: Color.fromARGB(255, 5, 124, 9),
                             fontSize: 16,
                             height: 1.2,
                             fontWeight: FontWeight.bold),
                         ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //divider
            const Divider(
              height: 5,
              color: Color.fromARGB(255, 5, 124, 9),
            ),
            
            //blog title
            Container(
              padding: const EdgeInsets.all(10),
                  child:
                  Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                  blogdetail["title"],
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20,
                  color: Colors.black, height: 1.2, fontWeight: FontWeight.w900),)),
                  ),
               Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(blogdetail["user"] ?? "",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.black, fontSize: 20, height: 1.2,
                    fontWeight: FontWeight.w900),),
                    const SizedBox(
                      height: 5,
                    ),
                    //date
                    Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                     //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              blogdetail["date"] ?? " ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        //author data
                        Row(
                          children: [
                            const Icon(
                              Icons.person_2,
                              color: Colors.black,
                              size: 20,
                            ),
                            const SizedBox(
                             width: 5,
                            ),
                            Text(
                              blogdetail["author"] ?? " ",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            

            Divider(
              height: 4,
              color: Color.fromARGB(255, 5, 124, 9),
            ),
            
            //content
            Container(
              padding: const EdgeInsets.all(15),
              child:
                   blogcontent != null ? Text(
                    blogcontent,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 1.2,
                      fontWeight: FontWeight.normal),
                      ) : const Center(child: Padding(
                        padding: EdgeInsets.all(50.0),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),)),
                      Divider(
                      color: Colors.green,
                      thickness: 3,
                      ),
                      //recent comments
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Recent comments",
                              style: TextStyle(
                               color: Color.fromARGB(255, 5, 124, 9),
                                fontSize: 16,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                              ),
                              //icon to add comment
                               const Spacer(),
                                  InkWell(
                                 onTap: () {
                          isUserLoggedIn(). then((value) {
                            if (value) {
                              //goto comment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IsaacBlogComment(
                                    commentArray: blogcomment)));
                            } else {
                              //goto login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Isaaclogin()));
                            }
                          });
                                 },
                                    child: const Row(
                                    children: [
                                      Icon(
                                        Icons.add_comment,
                                        color: Colors.black,
                                        size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Add comment",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 5, 124, 9),
                                          fontSize: 16,
                                          height: 1.2,
                                          fontWeight: FontWeight.bold),
                                          ),
                                       ],
                                    ),
                                  ),
                                ],
                              ),
                          const SizedBox(
                           height: 10,
                        ),
                        Divider(
                        color: Colors.green,
                         thickness: 3,
                        ),
                        //comment
                       blogcomment != null ? Column(
                         children: [
                          blogcomment.length > 0 ?
                           Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            ),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.black,
                                          child: Icon(Icons.person,
                                          color: Colors.white,
                                          ),
                                        ),
                                        ),
                                         const SizedBox(
                                          width: 10,
                                          ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              blogcomment[0]["user"] ?? " ",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                height: 1.2,
                                                fontWeight: FontWeight.normal),
                                            ),
                                             Text(
                                              blogcomment[0]["date"] ?? " ",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                height: 1.2,
                                                fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Divider(
                                    color: Colors.green,
                                    thickness: 2,
                                     ),
                                    const SizedBox(
                                      height: 10,
                                      ),
                                      Text(
                                        blogcomment[0]["comment"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          height: 1,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ]
                                )
                              ) : Center(
                                child: Column(
                                  children: [
                                    const Divider(
                                            height: 3,
                                            color: Colors.grey,
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: const Text(
                                              "No comments yet",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                height: 1,
                                                fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                            child: const Text(
                                              "Be the first to comment",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                height: 1,
                                                fontWeight: FontWeight.normal),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                         ],
                       ) : const Center(
                            child: Padding(padding: 
                            EdgeInsets.all(50.0),
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                            ),
                          ),
                          Divider(
              color: Colors.green,
              thickness: 3,
            ),
                          //load more
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                                size: 30,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                 onTap: () {
                           isUserLoggedIn(). then((value) {
                            if (value) {
                              //goto comment page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IsaacBlogComment(
                                    commentArray: blogcomment)));
                            } else {
                              //goto login page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Isaaclogin()));
                            }
                          });
                                 },
                                  child: const Text(
                                    "Load more",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 5, 124, 9),
                                      fontSize: 15,
                                      height: 1.2,
                                      fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                        ])),
          ],
        ),
       ),
      );
  }
 
}