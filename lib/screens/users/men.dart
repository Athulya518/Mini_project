import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/models/productsBoys.dart';

import 'package:malabis/models/productsGirls.dart';
import 'package:malabis/models/productsMen.dart';
import 'package:malabis/models/productsWomen.dart';
import 'package:malabis/screens/customizeorderPage.dart';

import '../models/productsBoys.dart';
import 'feedbackPage.dart';




class MenPage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var shopid;
  var type;
  MenPage({Key? key,this.uid, this.name,this.email,this.phone,this.shopid ,this.type}) : super(key: key);

  @override
  _MenPageState createState() => _MenPageState();
}

class _MenPageState extends State<MenPage> {

  List productsMen=[
    {
     "id":1,
      "image":"assets/images/shirt.jpg",
    "title":"Shirt",
      "price":350,
      "color": Color(0xFF3DB2AE)

    },
    {
      "id":2,
      "image":"assets/images/tshirt.jpg",
      "title":"TShirt",
      "price":300,
      "color": Color(0xFF3DB2AE)

    },
    {"id":3,
      "image":"assets/images/pant.jpg",
      "title":"Shirt",
      "price":450,
      "color": Color(0xFF3DB2AE)

    },
    {
      "id":4,
      "image":"assets/images/suit.jpg",
      "title":"Suit",
      "price":750,
      "color": Color(0xFF3DB2AE)

    },
    {
      "id":5,
      "image":"assets/images/jacket.jpg",
      "title":"Jacket",
      "price":750,
      "color": Color(0xFF3DB2AE)

    },
    {
      "id":6,
      "image":"assets/images/denimjacket.jpg",
      "title":"Denim Jcket",
      "price":1000,
      "color": Color(0xFF3DB2AE)

    },





  ];
  var type;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        title: Text("Men"),
        actions: [

        Padding(padding: EdgeInsets.all(15),child: InkWell(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBackPage(uid: widget.shopid,)));
          },
          child: Text("Feedback"),
        ),)
        ],
      ),



      body: Container(
        height: double.infinity,

        child:    Container(
          // color: Color(0xffFAD4D4),
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(left: 20,top: 10),

          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: productsMen.length,
              itemBuilder: (context,int index){

                return InkWell(
                  onTap: (){

                    setState(() {
                      type="men";
                    });

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
                      uid:widget.uid,
                      name:widget.name,
                      phone:widget.phone,
                      category: productsMen[index]['title'],
                      stitching_price:productsMen[index]['price'],
                      type: type,
                      shopid: widget.shopid,
                      shoptype: widget.type,


                    )));
                  },
                  child: Card(
                    elevation: 5.0,
                    child: Container(
                      //margin: EdgeInsets.only(right: 5,),
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Center(child: Image.asset(productsMen[index]['image'])),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(

                                height: 45,

                                color: Color(0xffed872d),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: Text(productsMen[index]['title'],style: TextStyle(color: Colors.white),)),
                                    Text("Price: RS. ${productsMen[index]['price']}/-",style: TextStyle(color: Colors.white),)

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
      ),

    );

  }
}









