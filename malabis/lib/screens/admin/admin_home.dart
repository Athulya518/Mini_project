import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/admin_materials.dart';
import 'package:malabis/screens/admin/admin_products.dart';
import 'package:malabis/screens/admin/registerdeliveryboy.dart';
import 'package:malabis/screens/admin/registertailor.dart';
import 'package:malabis/screens/admin/viewallordrs.dart';
import 'package:malabis/screens/admin/viewdboys.dart';
import 'package:malabis/screens/admin/vieworders.dart';
import 'package:malabis/screens/admin/viewpayments.dart';
import 'package:malabis/screens/admin/viewtailors.dart';
import 'package:malabis/screens/admin/viewusers.dart';

import '../loginscreen.dart';
import 'ViewShops.dart';


class AdminHomepage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
   AdminHomepage({Key? key,this.uid,this.name,this.email,this.phone}) : super(key: key);

  @override
  _AdminHomepageState createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
title: Text("Admin",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),

      ),
      drawer: Drawer(
       child: ListView(
         padding: EdgeInsets.zero,
         children: [
           UserAccountsDrawerHeader(accountName: Text("Admin"), accountEmail: Text("admin@gmail.com"),

           currentAccountPicture: CircleAvatar(backgroundColor: Colors.grey,child: Text("A",style: TextStyle(fontSize: 40),),),

           ),
           ListTile(title: Text("Dress Styles"),
           onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminProducts()));},
           ),
           ListTile(title: Text("Materials in the Store"),
             onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminMaterials()));},
           ),
         ],
       ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewShops()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Shops",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),



              Center(
                child: InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAllOrdersadmin()));
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPayments()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Payments",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterDeliveryBoy()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("Register Delivery Boy",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewUser()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Users",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
                    decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewDboys()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 40,right: 40),

                    height: 75,
                    child: Center(child: Text("View Delivery Boys",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),)),
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
