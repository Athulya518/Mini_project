import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';
import 'deliveryboyhome.dart';
class MaterialPickup extends StatefulWidget {
  const MaterialPickup({Key? key}) : super(key: key);

  @override
  _MaterialPickupState createState() => _MaterialPickupState();
}

class _MaterialPickupState extends State<MaterialPickup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'Pickup Order',


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
          height: 60,
          width: 150,
          margin: EdgeInsets.all(10),
          
          child: Center(child: Text("Pickedup Order",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(20)),


        ),
      ),),
    ],),
    );
  }
}
