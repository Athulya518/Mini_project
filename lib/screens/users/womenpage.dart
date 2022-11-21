import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/models/productsBoys.dart';

import 'package:malabis/models/productsGirls.dart';
import 'package:malabis/models/productsMen.dart';
import 'package:malabis/models/productsWomen.dart';
import 'package:malabis/screens/customizeorderPage.dart';
import 'package:malabis/screens/users/feedbackPage.dart';

import '../models/productsBoys.dart';




class WomenPage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var shopid;
  var type;
  WomenPage({Key? key,this.uid, this.name,this.email,this.phone,this.type,this.shopid }) : super(key: key);

  @override
  _WomenPageState createState() => _WomenPageState();
}

class _WomenPageState extends State<WomenPage> {


  var type;


  @override
  Widget build(BuildContext context) {

    return  Scaffold(

appBar: AppBar(

title:Text("Women",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)) ,
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





            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 40),
            //   child: Text("Select Category to Start",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w400,fontSize:18)),
            // ),









            Container(
              // color: Color(0xffFAD4D4),
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: productsWomen.length,
                  itemBuilder: (context,int index){


                    return InkWell(
                      onTap: (){

                        setState(() {
                          type="women";
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
                          uid:widget.uid,
                          name:widget.name,
                          phone:widget.phone,
                          category: productsWomen[index].title,
                          stitching_price:productsWomen[index].price,
                          type:type,
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
                              Center(child: Image.asset(productsWomen[index].image)),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                    height: 45,

                                    color: Color(0xffed872d),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(child: Text(productsWomen[index].title,style: TextStyle(color: Colors.white),)),
                                        Text("Price: RS. ${productsWomen[index].price}/-",style: TextStyle(color: Colors.white),)

                                      ],
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
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 40),
            //   child: Text("Boys",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            // ),
            //
            // Container(
            //   // color: Color(0xffFAD4D4),
            //   height: 250,
            //   margin: EdgeInsets.only(left: 20,top: 10),
            //
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: productsBoys.length,
            //       itemBuilder: (context,int index){
            //
            //         return InkWell(
            //           onTap: (){
            //
            //             setState(() {
            //               type="boys";
            //             });
            //             Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
            //               uid:widget.uid,
            //               name:widget.name,
            //               phone:widget.phone,
            //               category: productsBoys[index].title,
            //               stitching_price:productsBoys[index].price,
            //               type: type,
            //
            //             )));
            //           },
            //           child: Card(
            //             elevation: 5.0,
            //             child: Container(
            //
            //               height: 250,
            //               width: 200,
            //               color: Colors.white,
            //               child: Stack(
            //                 children: [
            //                   Image.asset(productsBoys[index].image),
            //                   Align(
            //                     alignment: Alignment.bottomCenter,
            //                     child: Container(
            //
            //                         height: 45,
            //
            //                         color: Color(0xffed872d),
            //                         child: Column(
            //                           mainAxisAlignment: MainAxisAlignment.center,
            //                           children: [
            //                             Center(child: Text(productsBoys[index].title,style: TextStyle(color: Colors.white),)),
            //                             Text("Price: RS. ${productsBoys[index].price}/-",style: TextStyle(color: Colors.white),)
            //
            //                           ],
            //                         )),
            //                   ),
            //
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //
            //       }
            //
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 40),
            //   child: Text("Girls",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            // ),
            //
            // Container(
            //   //color: Color(0xffFAD4D4),
            //   height: 250,
            //   margin: EdgeInsets.only(left: 20,top: 10),
            //
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: productsGirls.length,
            //       itemBuilder: (context,int index){
            //
            //         return InkWell(
            //           onTap: (){
            //
            //             setState(() {
            //               type="girls";
            //             });
            //             Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
            //               uid:widget.uid,
            //               name:widget.name,
            //               phone:widget.phone,
            //               category: productsGirls[index].title,
            //               stitching_price:productsGirls[index].price,
            //               type: type,
            //
            //             )));
            //           },
            //           child: Card(
            //             elevation: 5.0,
            //             child: Container(
            //
            //               height: 250,
            //               width: 200,
            //               color: Colors.white,
            //               child: Stack(
            //                 children: [
            //                   Image.asset(productsGirls[index].image),
            //                   Align(
            //                     alignment: Alignment.bottomCenter,
            //                     child: Container(
            //
            //                         height: 45,
            //
            //                         color: Color(0xffed872d),
            //                         child: Column(
            //                             mainAxisAlignment: MainAxisAlignment.center,
            //                             children: [
            //                               Center(child: Text(productsGirls[index].title,style: TextStyle(color: Colors.white),)),
            //                               Text("Price: RS. ${productsGirls[index].price}/-",style: TextStyle(color: Colors.white),)
            //
            //                             ]
            //                         )),
            //                   ),
            //
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //
            //       }
            //
            //   ),
            // ),

          ],
        ),
      ),

    );

  }
}









