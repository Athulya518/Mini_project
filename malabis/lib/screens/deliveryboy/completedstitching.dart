import 'package:flutter/material.dart';
import 'package:malabis/screens/deliveryboy/deliveryboyhome.dart';

import '../../widgets/apptext.dart';
class WorkCompleted extends StatefulWidget {
  const WorkCompleted({Key? key}) : super(key: key);

  @override
  _WorkCompletedState createState() => _WorkCompletedState();
}

class _WorkCompletedState extends State<WorkCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'Completed Work',


        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>DeliveryboyHomepage()
                ), (route) => false);
              },
              child: Center(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  
                  child: Center(child: Text("Delivered to Home and Cash Received",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(20)),

            ),
              ),
          )
        ],
      ),
    );
  }
}
