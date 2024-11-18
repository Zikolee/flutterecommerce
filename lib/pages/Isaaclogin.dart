// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_build_context_synchronously, unused_local_variable

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class Isaaclogin extends StatefulWidget {
  const Isaaclogin({Key? key}) : super(key: key);

  @override
  State<Isaaclogin> createState() => _IsaacloginState();
}

class _IsaacloginState extends State<Isaaclogin> {

  //email controller
  final emailController = TextEditingController();
  //password controller
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login to comment"),
        backgroundColor:Color.fromARGB(255, 5, 124, 9),
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: 
              Text("Login to comment", style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold))),
          SizedBox(
            height: 20,
          ),
          //useremail
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                //border color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0), 
                ),
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.black),
                hintText: "Enter Email",
                labelText: 'Email'),
            ),
          ),
          //password
           Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                //border color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.0), 
                ),
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.black),
                hintText: "Enter password",
                labelText: 'Password'),
            ),
          ),
          //login button
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.black,
              ),
              onPressed: () {
                //get email value
                var email = emailController.text;
                //get password value
                var password = passwordController.text;
                //check if email and password is empty
                if (email.isEmpty || password.isEmpty) {
                  //show error message
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Email and password cannot be empty"),
                    backgroundColor: Colors.red,
                  ));
              } else {
                //process login
                processLogin(email, password).then((value) {
                  //check if login is successful
                  if (value) {
                  //close page
                  Navigator.pop(context);
                }
              });
              }
              },
              child: Text("sign in", style: TextStyle(
                fontSize: 15)),
              ),
          ),
          ],
        ),
      ),
    );
  }

  //process login
  processLogin(email, password) async {
    //dio post request
    var dio = Dio();
    //post data
    var data = {
      "email": email,
      "password": password};
    //use formdata to send data
   var formData = FormData.fromMap(data);
    //post request
   var response = await dio.post("http://10.0.2.2/piagric/api/user_login", data: formData);
    //check if response is successful
    if (response.data["code"] == 200) {
      //shared preferences
      //save user data
      final prefs = await SharedPreferences.getInstance();
      //encode user data
      var userData = response.data;
      //encode user data
      var encodedata = jsonEncode(userData);
      //save user data
      prefs.setString("userdetail", encodedata);
      //show success message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Login successfully"),
      ));
      return true;
  } else {
    //show error message
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(response.data["error"]),
    backgroundColor: Colors.red,
    ));
    return false;
  }
  }
}