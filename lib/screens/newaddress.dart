import 'package:flutter/material.dart';
import 'package:malabis/screens/paymentpage.dart';
import 'package:malabis/screens/stitchingpayment.dart';
class NewDeliveraddress extends StatefulWidget {
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
var shopid;
var shoptype;
   NewDeliveraddress({Key? key,this.designimageurl,this.pickup_date,this.uid,this.neckdesign,
     this.shoptype,this.shopid,
     this.wristdesign,this.designcollar,this.category,this.type,this.name,this.phone,this.stitching_price,this.submit_measurement,this.samplegarment_pickupaddress,this.samplegarment_pickuplocation,this.samplegarment_pickuppincode,this.materialpickup_address,this.materialpickup_location,this.materialpickup_pincode}) : super(key: key);

  @override
  _NewDeliveraddressState createState() => _NewDeliveraddressState();
}

class _NewDeliveraddressState extends State<NewDeliveraddress> {


   final _nKey = GlobalKey<FormState>();
  TextEditingController _aTextcontroller=TextEditingController();
  TextEditingController _lTextcontroller=TextEditingController();
  TextEditingController _pTextcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color(0xffFAD4D4),
    ),
      body:
      Center(
        child: SingleChildScrollView(
          child: Form(
            key: _nKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                  child: Text("Enter New Address",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                  child: TextFormField(

                    controller: _aTextcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return "Enter Address";
                      }
                    },
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Address",
                      hintStyle: TextStyle(
                        color: Colors.grey,

                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25),),


                      ),
                    ),
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 10,right: 10),
                  child: TextFormField(
                    controller: _lTextcontroller,
                    validator: (value) {
                      if (value!.isEmpty || value == "") {
                        return "Enter Location";
                      }
                    },
                    minLines: 2,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        hintText: "Location",
                        hintStyle: TextStyle(
                          color: Colors.grey,

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25),),


                        )
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 10,right: 10),
                  child: TextFormField(
                    controller: _pTextcontroller,
                    validator: (value) {
                      if (value!.length != 6 ||
                          num.tryParse(value) == null) {
                        return 'Pincode should contains 6 digits';
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    minLines: 2,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Pincode",
                        hintStyle: TextStyle(
                          color: Colors.grey,

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25),),


                        )
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                ElevatedButton(onPressed: (){
    if(_nKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          StitchingPayment(
            newaddress:_aTextcontroller.text,
            newlocation:_lTextcontroller.text,
            newpincode:_pTextcontroller.text,
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
    }
                }, child: Text("Submit"))
              ],),
          ),
        ),


      ),);
  }
}
