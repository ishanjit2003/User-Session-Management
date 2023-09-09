import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  String email='',password='',age='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  loadData() async{
    SharedPreferences sp=await SharedPreferences.getInstance();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: false,
        title: Center(child: Text('student Screen')),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Center(child: Text('hello bix')),
          SizedBox(height: 40,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('email- '),
                Text(email.toString()),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('password- '),
                Text(password.toString()),

              ],
            ),
          ),

          SizedBox(height: 40,),


          InkWell(
            onTap: () async{
              SharedPreferences sp=await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

            },
            child: Container(
              child: Center(child: Text("Logout",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ],
      ),


    );
  }
}
