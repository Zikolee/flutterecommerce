// ignore_for_file: no_logic_in_create_state, unused_local_variable, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsaacBlogComment extends StatefulWidget {
  final commentArray;
  final postId;

  const IsaacBlogComment({super.key, this.commentArray, this.postId});

  @override
  State<IsaacBlogComment> createState() => _IsaacBlogCommentState(
    commentArray: commentArray, postId: postId);
}

class _IsaacBlogCommentState extends State<IsaacBlogComment> {

dynamic commentArray;
dynamic postId;

 _IsaacBlogCommentState({this.commentArray, this.postId});

 //formkey
 final formkey = GlobalKey<FormState>();
 //commentController
 final commentController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Comments"),
      ),
      body: Container(
        child: CommentBox(
          labelText: 'write a comment...',
          withBorder: true,
          errorText: 'comment cannot be blank',
          sendButtonMethod: ()  async {
            //get data from shared preferences
            final prefs = await SharedPreferences.getInstance();
            //get string
            var userdetail = prefs.getString('userdatail');
            //decode userdetail
            var userdetaildecoded = jsonDecode(userdetail!);
            //print(userdetaildecoded["user_details"]);
            if (formkey.currentState!.validate()) {
              //print(commentController.text);
              //send comment to server
              submitComment(userdetaildecoded["user_details"]["id"],
              commentController.text, postId);
          } else {
           //print("Not validated");
          }
       },
       formKey: formkey,
       commentController: commentController,
       backgroundColor: Colors.black,
       textColor: Colors.white,
       sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: commentChild(commentArray),
        ),
      ),
    );
  }

  //comment child
  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
        Padding(
          padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                //Display the image in large form
               // print("Comment Clicked");
              },
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.
                  circular(50))),
                  child: const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 30,)),
                  ),
                ),
                title: Text(
                  data[i]["user"],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data[i]['comment']),
              ),
            ),
      ],
    );
  }

//submit Comment
submitComment(userId, message, postId) async {
  //use dio
  var dio = Dio();
  //send data to server
  var data = {
    "user_id": userId,
    "message": message,
    "post_id": postId,
  };

  //convert to formdata
  var formData = FormData.fromMap(data);

  //send data to server
  var response = await dio.post(
    "http://10.0.2.2/piagric/api/add_comment",
    data: formData);
    if(response.data["code"] == 200) {
      //snackbar
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: 
      Text("comment added, waiting admin approval"),
      backgroundColor: Colors.green,));
      commentController.clear();
      FocusScope.of(context).unfocus();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: 
      Text("unable to add comment"),
      backgroundColor: Colors.red,));
    }
}
}