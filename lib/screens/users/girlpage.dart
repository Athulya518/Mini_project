import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/models/productsBoys.dart';

import 'package:malabis/models/productsGirls.dart';
import 'package:malabis/models/productsMen.dart';
import 'package:malabis/models/productsWomen.dart';
import 'package:malabis/screens/customizeorderPage.dart';
import 'package:malabis/screens/users/feedbackPage.dart';

import '../models/productsBoys.dart';




class GirlPage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var shopid;
  var type;
  GirlPage({Key? key,this.uid, this.name,this.email,this.phone,this.type,this.shopid }) : super(key: key);

  @override
  _GirlPageState createState() => _GirlPageState();
}

class _GirlPageState extends State<GirlPage> {


  var type;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      appBar: AppBar(
        title: Text("Girls"),
        actions: [

          Padding(padding: EdgeInsets.all(15),child: InkWell(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBackPage(uid: widget.shopid,)));
            },
            child: Text("Feedback"),
          ),)
        ],
      ),

      body: SingleChildScrollView(
        child: Column(



          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,

          children: [



            Container(

              padding: EdgeInsets.only(left: 20,right: 10,top: 30),
              width: MediaQuery.of(context).size.width,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Text(widget.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)

                ],
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 40),
            //   child: Text("Select Category to Start",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w400,fontSize:18)),
            // ),






            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Text("Girls",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            ),

            Container(
              //color: Color(0xffFAD4D4),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productsGirls.length,
                  itemBuilder: (context,int index){

                    return InkWell(
                      onTap: (){

                        setState(() {
                          type="girls";
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
                          uid:widget.uid,
                          name:widget.name,
                          phone:widget.phone,
                          category: productsGirls[index].title,
                          stitching_price:productsGirls[index].price,
                          type: type,
                          shopid: widget.shopid,
                          shoptype: widget.type,

                        )));
                      },
                      child: Card(
                        elevation: 5.0,
                        child: Container(

                          height: 250,
                          width: 200,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Center(child: Image.asset(productsGirls[index].image)),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                    height: 45,

                                    color: Color(0xffed872d),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(child: Text(productsGirls[index].title,style: TextStyle(color: Colors.white),)),
                                          Text("Price: RS. ${productsGirls[index].price}/-",style: TextStyle(color: Colors.white),)

                                        ]
                                    )),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );

                  }

              ),
            ),

          ],
        ),
      ),

    );

  }
}









