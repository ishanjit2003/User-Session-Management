import 'dart:async';


import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';
import 'package:login/login.dart';
import 'package:login/student_screen.dart';
import 'package:login/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
   isLogin();
  }

  void isLogin() async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin') ?? false; //if null then false
    String userType=sp.getString('userType')??'';

    if(isLogin){

      if(userType=='teacher'){
        Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));
      });}
      else if(userType=='student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
        });
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }

    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
    }


  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Image(image: NetworkImage('https://images.pexels.com/photos/18125688/pexels-photo-18125688/free-photo-of-attractive-blonde-in-dark.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
      height: double.infinity,
      fit: BoxFit.fitHeight,)
    );
  }
}
