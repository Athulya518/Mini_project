import 'package:flutter/material.dart';
import 'package:malabis/screens/tailor/tailorhome.dart';

import '../successpage.dart';
class TailorWork extends StatefulWidget {
  const TailorWork({Key? key}) : super(key: key);

  @override
  _TailorWorkState createState() => _TailorWorkState();
}

class _TailorWorkState extends State<TailorWork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
    children: [

    InkWell(
    onTap: (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>TailorHomepage()
      ), (route) => false);
    },
    child: Center(
      child: Container(
      height: 150,
      width: 350,
      margin: EdgeInsets.all(20),
      
      child: Center(child: Text("Stitching is completed Successfully",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius:BorderRadius.circular(20) ),


      ),
    ),),
    ],),
    );


  }
}
