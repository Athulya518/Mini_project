import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/successpage.dart';
class ConfirmBooking extends StatefulWidget {
  String? orderdeliveraddress;
  String? orderdeliverlocation;
  String? orderdeliver_pincode;
  String? preferred_order_date;
  String? cashbyhand_material_date;
  String? newaddress;
  String? newlocation;
  String? newpincode;
  String? materialpickup_address;
  String? materialpickup_location;
  String? materialpickup_pincode;
  var fabrictype;
  var material_price;
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
  String? pickup_date;
  String? designimageurl;
var shopid;
var shoptype;
  ConfirmBooking({Key? key,this.designimageurl,this.pickup_date,this.uid,this.type,
    this.category,this.designcollar,this.wristdesign,this.neckdesign,this.phone,
    this.shopid,this.shoptype,
    this.name,this.preferred_order_date,this.newpincode,this.newlocation,
    this.stitching_price,this.fabrictype,this.material_price,this.submit_measurement,this.samplegarment_pickupaddress,this.samplegarment_pickuplocation,this.samplegarment_pickuppincode,this.materialpickup_address,this.materialpickup_location,this.materialpickup_pincode,this.cashbyhand_material_date,this.newaddress,this.orderdeliveraddress,this.orderdeliverlocation,this.orderdeliver_pincode}) : super(key: key);

  @override
  _ConfirmBookingState createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAD4D4),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Uid : " + widget.uid.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Type : ${widget.type}", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Category : " + widget.category.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Name : " + widget.name.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Phone : " + widget.phone.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.designimageurl!=null? Text("Upload Design Image : " + widget.designimageurl.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ):Text("Upload Design Image : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                  ),

                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.neckdesign!=null? Text("Neck Style : " + widget.neckdesign.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ):Text("Neck Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

                ), SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.wristdesign!=null? Text(
                      "Wrist Style : " + widget.wristdesign.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Wrist Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                  ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.designcollar!=null?Text(
                      "Collar Style : " + widget.designcollar.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Collar Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                  ),
                SizedBox(height: 20,),

                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text(
                      "Stitching Price : " + widget.stitching_price.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.submit_measurement!=null? Text("Submit Measurement : " +
                        widget.submit_measurement.toString(), style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    ): Text("Submit Measurement : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.samplegarment_pickupaddress!=null?Text("Sample Garment Pickup Address : " +
                        widget.samplegarment_pickupaddress.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Sample Garment Pickup Address : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.samplegarment_pickuplocation!=null? Text("Sample Garment Pickup Location : " +
                        widget.samplegarment_pickuplocation.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Sample Garment Pickup Location : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.samplegarment_pickuppincode!=null?Text("Sample Garment Pickup Pincode : " +
                        widget.samplegarment_pickuppincode.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ) : Text("Sample Garment Pickup Pincode : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.materialpickup_address!=null?Text("Material Pickup Address : " +
                        widget.materialpickup_address.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Material Pickup Address : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.materialpickup_location!=null? Text("Material Pickup Location : " +
                        widget.materialpickup_location.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Material Pickup Location : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.materialpickup_pincode!=null?Text("Material Pickup Pincode : " +
                        widget.materialpickup_pincode.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Material Pickup Pincode : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.pickup_date!=null?Text(
                      "Pickup Date : " + widget.pickup_date.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Pickup Date : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.newaddress!=null? Text(
                      "New Deliver Address : " + widget.newaddress.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("New Deliver Address : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.newlocation!=null? Text(
                      "New Deliver Location : " + widget.newlocation.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("New Deliver Location : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.newpincode!=null? Text("New Pincode : " + widget.newpincode.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("New Pincode : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: widget.newpincode!=null?Text(
                      "Material Price : " + widget.material_price.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Material Price : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.fabrictype!=null? Text(
                      "Material for : " + widget.fabrictype.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Material for : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child:widget.cashbyhand_material_date!=null? Text("Shop Material Payment Date : " +
                        widget.cashbyhand_material_date.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ): Text("Shop Material Payment Date : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Preferred Order Deliver  Date : " +
                        widget.preferred_order_date.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Order Deliver Address : " +
                        widget.orderdeliveraddress.toString(), style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Order Deliver Location : " +
                        widget.orderdeliverlocation.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(color: Color(0xffef9f9f), height: 50,
                  child: Center(
                    child: Text("Order Deliver Pincode : " +
                        widget.orderdeliver_pincode.toString(),
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),


                ElevatedButton(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SuccessPage(
                    shoptype: widget.shoptype,
                    shopid: widget.shopid,
                    orderdeliveraddress:widget.orderdeliveraddress,
                    orderdeliverlocation: widget.orderdeliverlocation,
                    orderdeliver_pincode:widget.orderdeliver_pincode,
                    preferred_order_date:widget.preferred_order_date,
                    newaddress:widget.newaddress,
                    newlocation:widget.newlocation,
                    newpincode:widget.newpincode,
                    cashbyhand_material_date:widget.cashbyhand_material_date,
                    uid:widget.uid,
                    name:widget.name,
                    phone:widget.phone,
                    samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                    samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                    samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                    materialpickup_address:widget.materialpickup_address,
                    materialpickup_location:widget.materialpickup_location,
                    materialpickup_pincode:widget.materialpickup_pincode,
                    pickup_date:widget.pickup_date,
                    fabrictype:widget.fabrictype,
                    material_price:widget.material_price,
                    neckdesign: widget.neckdesign,
                    wristdesign:widget.wristdesign,
                    designcollar: widget.designcollar,
                    designimageurl:widget.designimageurl,
                    category: widget.category,
                    submit_measurement:widget.submit_measurement,
                    stitching_price:widget.stitching_price,
                    type: widget.type,

                  )));







                },
                    child: Text("Ok"))


              ],
            ),
          ),
        ),
      );
    }
  }
