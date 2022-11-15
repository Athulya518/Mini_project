import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkaddr.dart';
class PickupMaterial extends StatefulWidget {
  String? designcollar;
  String? category;
var uid;
var name;
var phone;
String? samplegarment_pickupaddress;
String? samplegarment_pickuplocation;
String? samplegarment_pickuppincode;
String? materialpickup_address;
String? materialpickup_location;
String? materialpickup_pincode;
  String? type;
  var stitching_price;
  String? submit_measurement;
  String?neckdesign;
  String? wristdesign;
  String? designimageurl;
  var shopid;
  var shoptype;
   PickupMaterial({Key? key,this.designimageurl,this.samplegarment_pickupaddress,
     this.samplegarment_pickuplocation,this.samplegarment_pickuppincode,
     this.materialpickup_address,this.materialpickup_location,this.materialpickup_pincode,
     this.phone,this.name,this.category,this.type,this.neckdesign,this.wristdesign,
     this.designcollar,this.uid,this.stitching_price,this.submit_measurement
   ,this.shoptype,this.shopid}) : super(key: key);

  @override
  _PickupMaterialState createState() => _PickupMaterialState();
}

class _PickupMaterialState extends State<PickupMaterial> {



  @override
  void initState() {
printData();
    super.initState();
  }
  printData(){
    print(widget.type);
    print(widget.category);
    print(widget.uid);
    print(widget.name);
    print(widget.phone);
    print(widget.neckdesign);
    print(widget.wristdesign);
    print(widget.designcollar);
    print(widget.stitching_price);
    print(widget.submit_measurement);
    print(widget.samplegarment_pickupaddress);
    print(widget.samplegarment_pickuplocation);
    print(widget.samplegarment_pickuppincode);
    print(widget.materialpickup_address);
    print(widget.materialpickup_location);
    print(widget.materialpickup_pincode);


  }
   DateTime date=DateTime(2022,08,24);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFAD4D4),),

body: Center(
  child: Padding(
    padding: const EdgeInsets.only(top: 20),
    child: SingleChildScrollView(
      child: Column(

        children: [
          Center(
            child: Container(

              margin: EdgeInsets.all(20),

              height: 100,

             width: MediaQuery.of(context).size.width,
              child: ElevatedButton(


                child:Text("Select your preferred Material Pickup Date",style: TextStyle(color:Color(0xffFAD4D4),fontWeight:FontWeight.w600,fontSize:18),),
                onPressed: ()async{
                  DateTime? newDate=await showDatePicker(context: context, initialDate: date, firstDate: DateTime(1900), lastDate: DateTime(2100));
                  if (newDate==null)
                    return;
                  setState(()=>date=newDate);
                },

              ),

            ),

          ),


          Text("${date.year}/${date.month}/${date.day}",
           style:TextStyle(fontSize: 32,color: Colors.black),
              ),





          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Container(
color: Color(0xffF47C7C),
              margin: EdgeInsets.all(20),

              height: 50,

              width: 150,
              child: Center(
                child: TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckaddressSame(
                  pickup_date:date.toString(),
                  neckdesign: widget.neckdesign,
                  wristdesign:widget.wristdesign,
                  designcollar: widget.designcollar,
                  designimageurl:widget.designimageurl,
                  uid: widget.uid,
                  name:widget.name,
                  phone:widget.phone,
                  samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                  samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                  samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                  materialpickup_address:widget.materialpickup_address,
                  materialpickup_location:widget.materialpickup_location,
                  materialpickup_pincode:widget.materialpickup_pincode,
                  category: widget.category,
                  submit_measurement:widget.submit_measurement,
                  stitching_price:widget.stitching_price,
                  type: widget.type,
                  shoptype: widget.shoptype,
                  shopid: widget.shopid,


                )));
                },
                child: Text("Checkout",style: TextStyle(color:Colors.white,fontWeight:FontWeight.w500,fontSize:18,)
                ),

            ),
              ),),),

        ],
      ),
    ),
  ),
),

    );
  }
}
