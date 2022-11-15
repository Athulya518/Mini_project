import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/register.dart';
import 'package:malabis/widgets/colors.dart';

import 'loginscreen.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
              //color: Color(0XffEF9F9F),
              padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Welcome",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),),
                      ],
          ),





              Container(
              height: 250,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),


              ),
              ),
            ),
                  Column(
                    children: [
                      MaterialButton(
                        color: btncolor,
                        minWidth: double.infinity,
                          height: 60,



                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          },
                        shape: RoundedRectangleBorder(
                          side: BorderSide(


                          ),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text("Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white
                        ),),





                      ),
                      SizedBox(height: 20,),
                      MaterialButton(minWidth: double.infinity,
                        height: 60,
color: btncolor,


                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(


                            ),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Text("Register",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white
                      ),
                        )
                      ),

                    ],
                  ),





          ],
      ),
      ),
        ),

    ),
    );
  }
}
