import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:malabis/models/productsMen.dart';
import 'package:malabis/models/productsWomen.dart';
import 'package:malabis/screens/customizeorderPage.dart';

import '../models/productsBoys.dart';
import '../models/productsGirls.dart';




class HomePage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
 HomePage({Key? key,this.uid, this.name,this.email,this.phone }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  var type;
  List<ProductMen>productsMen=[
    ProductMen(id: 1,
        image: "assets/images/shirt.jpg",
        title:" Shirt",
        price: 350,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 2,
        image: "assets/images/tshirt.jpg",
        title:"TShirt",
        price: 300,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 3,
        image: "assets/images/pant.jpg",
        title:"Pant",
        price: 450,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 4,
        image: "assets/images/suit.jpg",
        title:"Suit",
        price: 800,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 5,
        image: "assets/images/jeans.jpg",
        title:"Jeans",
        price: 700,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 6,
        image: "assets/images/jacket.jpg",
        title:"Jacket",
        price: 600,
        color: Color(0xFF3DB2AE)),
    ProductMen(id: 7,
        image: "assets/images/denimjacket.jpg",
        title:"Denim Jacket",
        price: 600,
        color: Color(0xFF3DB2AE)),
  ];

  @override
  Widget build(BuildContext context) {

    return  Scaffold(



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

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: Text("Select Category to Start",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w400,fontSize:18)),
              ),



              Padding(
                padding: const EdgeInsets.only(left: 20,top: 30,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Men",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),

                  ],
                ),
              ),

              Container(
                 // color: Color(0xffFAD4D4),
                height: 250,
                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
scrollDirection: Axis.horizontal,
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
                            category: productsMen[index].title,
                            stitching_price:productsMen[index].price,
                            type: type,

                          )));
                        },
                        child: Card(
                          elevation: 5.0,
                          child: Container(
                            //margin: EdgeInsets.only(right: 5,),
                            height: 250,
                            width: 200,
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Image.asset(productsMen[index].image),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                    height: 45,

                                    color: Color(0xffed872d),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(child: Text(productsMen[index].title,style: TextStyle(color: Colors.white),)),
                                        Text("Price: RS. ${productsMen[index].price}/-",style: TextStyle(color: Colors.white),)

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

              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: Text("Women",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
              ),

              Container(
               // color: Color(0xffFAD4D4),
                height: 250,
                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                                Image.asset(productsWomen[index].image),
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
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: Text("Boys",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
              ),

              Container(
               // color: Color(0xffFAD4D4),
                height: 250,
                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productsBoys.length,
                    itemBuilder: (context,int index){

                      return InkWell(
                        onTap: (){

                          setState(() {
                            type="boys";
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomizeOrderPage(
                            uid:widget.uid,
                            name:widget.name,
                            phone:widget.phone,
                            category: productsBoys[index].title,
                            stitching_price:productsBoys[index].price,
                            type: type,

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
                                Image.asset(productsBoys[index].image),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(

                                      height: 45,

                                      color: Color(0xffed872d),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Center(child: Text(productsBoys[index].title,style: TextStyle(color: Colors.white),)),
                                          Text("Price: RS. ${productsBoys[index].price}/-",style: TextStyle(color: Colors.white),)

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
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: Text("Girls",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
              ),

              Container(
                //color: Color(0xffFAD4D4),
                height: 250,
                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
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
                                Image.asset(productsGirls[index].image),
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









