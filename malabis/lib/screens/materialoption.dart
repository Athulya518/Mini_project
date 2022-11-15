import 'package:flutter/material.dart';

import 'package:malabis/screens/pickuppage.dart';
import 'package:malabis/screens/shopmaterial.dart';
import 'package:malabis/screens/users/materialpickaddr.dart';


class MaterialOption extends StatefulWidget {
String?callbackstatus;
String? submit_measurement;
String? designcollar;
String? category;
var stitching_price;
String? samplegarment_pickupaddress;
String? samplegarment_pickuplocation;
String? samplegarment_pickuppincode;
String? type;
var uid;
var name;
var phone;
String?neckdesign;
String? wristdesign;
String? designimageurl;
var shopid;
var shoptype;
   MaterialOption({Key? key,this.callbackstatus,this.designimageurl,this.samplegarment_pickupaddress,this.samplegarment_pickuplocation,this.samplegarment_pickuppincode,this.phone,this.name,this.submit_measurement,this.uid,this.category,this.type,this.designcollar,this.wristdesign,this.neckdesign,this.stitching_price,this.shoptype,this.shopid}) : super(key: key);

  @override
  _MaterialOptionState createState() => _MaterialOptionState();
}

class _MaterialOptionState extends State<MaterialOption> {

  bool materialoption=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Color(0xffFAD4D4),
    ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Select option for the material to stitch",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),),
                SizedBox(
                  height: 30,
                ),

                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MaterialPickupAddress(
                      callbackstatus: widget.callbackstatus,
                      uid:widget.uid,
                      name:widget.name,
                      phone:widget.phone,
                      samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                      samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                      samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                      submit_measurement:widget.submit_measurement,
                      neckdesign: widget.neckdesign,
                      wristdesign:widget.wristdesign,
                      designcollar: widget.designcollar,
                      designimageurl:widget.designimageurl,
                      category: widget.category,
                      stitching_price:widget.stitching_price,
                      type: widget.type,
                      shoptype: widget.shoptype,
                      shopid: widget.shopid,




                    ),),);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("Pickup the Material",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),)),

                    decoration: BoxDecoration(
                        color: Color(0xffFAD4D4),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)
                    ),


                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShopMaterial(

                      uid: widget.uid,
                      name:widget.name,
                      phone:widget.phone,
                      samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                      samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                      samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                      neckdesign: widget.neckdesign,
                      wristdesign:widget.wristdesign,
                      designcollar: widget.designcollar,
                      designimageurl:widget.designimageurl,
                      submit_measurement:widget.submit_measurement,
                      category: widget.category,
                      stitching_price:widget.stitching_price,
                      type: widget.type,
                      shoptype: widget.shoptype,
                      shopid: widget.shopid,






                    )));
                  },
                  child: Container(
                    margin:EdgeInsets.all(10),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Text("Shop material",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),)),
                    decoration: BoxDecoration(
                        color: Color(0xffFAD4D4),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)
                    ),


                  ),
                ),
                SizedBox(height: 30,),

              ],
            ),
          ),
        )
    );
  }
}
