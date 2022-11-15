import 'package:flutter/material.dart';
import 'package:malabis/models/materialsmennboys.dart';
import 'package:malabis/models/materialswomenngirls.dart';
import 'package:malabis/screens/paymentpage.dart';

class ShopMaterial extends StatefulWidget {

  String? designcollar;
  String? category;
var uid;
var name;
var phone;
String? samplegarment_pickupaddress;
String? samplegarment_pickuplocation;
String? samplegarment_pickuppincode;
  String? type;
  String?neckdesign;
  String? wristdesign;
  var stitching_price;
  String? submit_measurement;
  String? designimageurl;
var shopid;
var shoptype;
  ShopMaterial({Key? key,this.designimageurl,this.uid,this.category,this.type,this.neckdesign,
    this.shopid,this.shoptype,
    this.designcollar,this.wristdesign,this.phone,this.name,this.samplegarment_pickupaddress,this.samplegarment_pickuplocation,this.samplegarment_pickuppincode,this.submit_measurement,this.stitching_price}) : super(key: key);

  @override
  _ShopMaterialState createState() => _ShopMaterialState();
}

class _ShopMaterialState extends State<ShopMaterial> {
  var fabrictype;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),


        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start,

            children: [





              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40),
                child: Center(child: Text("Shop the Material for Stitching",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18))),
              ),



              Padding(
                padding: const EdgeInsets.only(left: 20,top: 40,right: 20),
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
                    itemCount: materialsMennboys.length,
                    itemBuilder: (context,int index){

                      return InkWell(
                        onTap: (){
                          setState(() {
                            fabrictype="men";
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(

                            uid:widget.uid,
                            name:widget.name,
                            phone:widget.phone,
                            samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                            samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                            samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                            fabrictype:fabrictype,
                            material_price:materialsMennboys[index].price,
                            neckdesign: widget.neckdesign,
                            wristdesign:widget.wristdesign,
                            designcollar: widget.designcollar,
                            designimageurl:widget.designimageurl,
                            category: widget.category,
                            submit_measurement:widget.submit_measurement,
                            stitching_price:widget.stitching_price,
                            type: widget.type,
                            shoptype: widget.shoptype,
                            shopid: widget.shopid,




                          ),),);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5,),
                          height: 250,
                          width: 200,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Image.asset(materialsMennboys[index].image),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                    height: 45,
                                    width: 200,
                                    color: Colors.black54,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(child:Text("Price: RS. ${materialsMennboys[index].price}/-",style: TextStyle(color: Colors.white),)
                                        ),
                                      ],
                                    )),
                              ),

                            ],
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
                color: Color(0xffFAD4D4),
                height: 250,
                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: materialsWomenngirls.length,
                    itemBuilder: (context,int index){

                      return InkWell(
                        onTap: (){
                          setState(() {
                            fabrictype="women";
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentPage(

                            fabrictype:fabrictype,
                            uid: widget.uid,
                            name:widget.name,
                            phone:widget.phone,
                            samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                            samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                            samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                            material_price:materialsWomenngirls[index].price,
                            neckdesign: widget.neckdesign,
                            wristdesign:widget.wristdesign,
                            designcollar: widget.designcollar,
                            designimageurl:widget.designimageurl,
                            category: widget.category,
                            submit_measurement:widget.submit_measurement,
                            stitching_price:widget.stitching_price,
                            type: widget.type,
                            shoptype: widget.shoptype,
                            shopid: widget.shopid,


                          )));
                        },
                        child: Container(

                          margin: EdgeInsets.only(right: 5,),
                          height: 250,
                          width: 200,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Image.asset(materialsWomenngirls[index].image),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(

                                    height: 45,
                                    width: 200,
                                    color: Colors.black54,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(child:Text("Price: RS. ${materialsWomenngirls[index].price}/-",style: TextStyle(color: Colors.white),)
                                        ),

                                      ],
                                    )),
                              ),

                            ],
                          ),
                        ),
                      );

                    }

                ),
              ),
SizedBox(height: 60,)
            ],
          ),
        ),

    );

  }
}
