import 'dart:async';

import 'package:flutter/material.dart';

import 'onboardingscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget>createState()=>InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  startTimer()async{
    var duration=Duration(seconds: 3);
    return new Timer(duration, loginRoute);
  }
  loginRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
  }
  Widget build(BuildContext context){
    return initWidget();
  
    
  }
  Widget initWidget(){
    return Scaffold(
      body:Stack(
        children: [

          Container(
            decoration: BoxDecoration(
             // color: Color(0xffEF9F9F),

            ),

          ),

          Center(
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/logo.png"),
            ),
          )
        ],
      ) ,
      
    );
  }
}
