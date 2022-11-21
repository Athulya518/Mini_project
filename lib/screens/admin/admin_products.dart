import 'package:flutter/material.dart';

import '../../models/productsBoys.dart';
import '../../models/productsGirls.dart';
import '../../models/productsMen.dart';
import '../../models/productsWomen.dart';

class AdminProducts extends StatefulWidget {
  const AdminProducts({Key? key}) : super(key: key);

  @override
  _AdminProductsState createState() => _AdminProductsState();
}

class _AdminProductsState extends State<AdminProducts> {
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
  var type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(



          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,

          children: [





            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Center(child: Text("Styles",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18))),
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
              color: Color(0xffFAD4D4),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsMen.length,
                  itemBuilder: (context,int index){

                    return Container(
                      margin: EdgeInsets.only(right: 5,),
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
                                width: 200,
                                color: Colors.black54,
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
                    );

                  }

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Text("Women",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            ),

            Container(
              color: Color(0xffFAD4D4),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsWomen.length,
                  itemBuilder: (context,int index){


                    return Container(
                      margin: EdgeInsets.only(right: 5,),
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
                                width: 200,
                                color: Colors.black54,
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
                    );

                  }

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Text("Boys",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            ),

            Container(
              color: Color(0xffFAD4D4),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsBoys.length,
                  itemBuilder: (context,int index){

                    return Container(
                      margin: EdgeInsets.only(right: 5,),
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
                                width: 200,
                                color: Colors.black54,
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
                    );

                  }

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Text("Girls",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            ),

            Container(
              color: Color(0xffFAD4D4),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productsGirls.length,
                  itemBuilder: (context,int index){

                    return Container(
                      margin: EdgeInsets.only(right: 5,),
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
                                width: 200,
                                color: Colors.black54,
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
