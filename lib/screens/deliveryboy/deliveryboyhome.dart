import 'package:flutter/material.dart';
import 'package:malabis/screens/deliveryboy/pickmaterial.dart';
import 'package:malabis/screens/deliveryboy/pickuporderdetails.dart';

import '../loginscreen.dart';
import 'comp[etedwork.dart';
class DeliveryboyHomepage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  String? dboyid;

   DeliveryboyHomepage({Key? key,this.uid,this.name,this.email,this.phone,this.dboyid}) : super(key: key);

  @override
  _DeliveryboyHomepageState createState() => _DeliveryboyHomepageState();
}

class _DeliveryboyHomepageState extends State<DeliveryboyHomepage> {

  @override
  Widget build(BuildContext context) {
    print(widget.dboyid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
        title: Text("Dboy",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CompletedWork(dboyid: widget.dboyid,)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("Delivery Orders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),


              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PickMaterial(dboyid: widget.dboyid,)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("Pickup  Material",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width:MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0,top: 10),
                      child: Text("Logout",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    IconButton(
                        iconSize: 40,
                        onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    }, icon: Icon(Icons.logout))

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
