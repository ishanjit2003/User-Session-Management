import 'package:flutter/material.dart';
import 'package:login/home_screen.dart';
import 'package:login/sign_up.dart';
import 'package:login/student_screen.dart';
import 'package:login/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.mail),

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)
                ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)
                  )

              ),

            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.mail),
                  suffixIcon: Icon(Icons.remove_red_eye_rounded),

                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)
                  )

              ),

            ),
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: () async{
              SharedPreferences sp=await SharedPreferences.getInstance();
              sp.setString('email', emailController.text.toString());
              sp.setString('password', passwordController.text.toString());
              sp.setBool('isLogin',true);
              sp.setString('userType', 'teacher');

              if(sp.getString('userType')=='teacher'){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherScreen()));

            }
              else if(sp.getString('userType')=='student'){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentScreen()));
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }
              },

            child: Container(
              child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          SizedBox(height: 40,),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
            },
            child: Container(
              height: 50,
              width: 100,
              child: Center(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey

              ),
            ),
          )


        ],
      ),
    );
  }
}
