import 'package:flutter/material.dart';
import 'package:malabis/screens/paymentpage.dart';
import 'package:malabis/screens/stitchingpayment.dart';

import 'newaddress.dart';
class CheckaddressSame extends StatefulWidget {
String? designimageurl;
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
  String? pickup_date;
  var shoptype;
  var shopid;
   CheckaddressSame({Key? key,this.designimageurl,this.pickup_date,this.type,this.uid,
     this.category,this.designcollar,this.wristdesign,this.neckdesign,this.materialpickup_pincode,
     this.materialpickup_address,this.materialpickup_location,this.samplegarment_pickuppincode,
     this.samplegarment_pickuplocation,this.samplegarment_pickupaddress,this.name,this.phone,
     this.stitching_price,this.submit_measurement,this.shopid,this.shoptype}) : super(key: key);

  @override
  _CheckaddressSameState createState() => _CheckaddressSameState();
}

class _CheckaddressSameState extends State<CheckaddressSame> {
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
    print(widget.pickup_date);


  }

  bool value1=false;
  bool value2=false;
  String? checkaddress;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),

      ),
      body:
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
margin: EdgeInsets.all(10),
                      child: Text("Is  Pickup  Address  and  Preferred  Order  Delivery  Address  same?",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),),

),
                  ),

               Padding(
               padding: const EdgeInsets.only(bottom: 350),
               child: Container(
                 margin: EdgeInsets.all(120),
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Text("Yes"),

                          InkWell(
                            onTap: (){

                            },
                            child:Checkbox(

                                value: value1,
                                onChanged: (value){

                                  if(value2==false){
                                    setState(() {
                                      this.value1=value!;

                                    });
                                  }

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StitchingPayment(
                                    shoptype: widget.shoptype,
                                    shopid: widget.shopid,

                                    newaddress:widget.samplegarment_pickupaddress,
                                    newlocation:widget.samplegarment_pickuplocation,
                                    newpincode:widget.samplegarment_pickuppincode,
                                    pickup_date:widget.pickup_date,
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



                                  )));

                                }
                           ),
                      ),

                        ],
                  ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("No"),

                          InkWell(
                            onTap: (){

                            },
                            child: Checkbox(
                                value:value2,
                                onChanged: (value){

                                  if(value1==false){
                                    setState(() {
                                      this.value2=value!;
                                    });
                                  }
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewDeliveraddress(
                                    shoptype: widget.shoptype,
                                    shopid: widget.shopid,
                                    pickup_date:widget.pickup_date,
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


                                  )));
                                }
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
               ),







          ],
        ),
            ),


    );
  }
}
