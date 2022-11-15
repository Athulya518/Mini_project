import 'package:flutter/material.dart';
import 'package:malabis/screens/tailor/previousordersview.dart';

import '../loginscreen.dart';
import 'ordersview.dart';
class TailorHomepage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var tailorid;
   TailorHomepage({Key? key,this.uid,this.name,this.email,this.phone,this.tailorid}) : super(key: key);

  @override
  _TailorHomepageState createState() => _TailorHomepageState();
}

class _TailorHomepageState extends State<TailorHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color(0xffFAD4D4),
      title: Text("Tailor",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrdersView(
                      tailorid: widget.tailorid


                    )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Orders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),


              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewpreviousOrders(
                        tailorid: widget.tailorid
                    )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Previous Orders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
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
      ),);
  }
}
