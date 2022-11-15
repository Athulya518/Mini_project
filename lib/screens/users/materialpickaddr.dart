import 'package:flutter/material.dart';
import 'package:malabis/screens/pickuppage.dart';
class MaterialPickupAddress extends StatefulWidget {

  String? submit_measurement;
  String? designcollar;
  String? category;
  String? type;
  var uid;
  var name;
  var phone;
  String?neckdesign;
  String? wristdesign;
  String? samplegarment_pickupaddress;
  String? samplegarment_pickuplocation;
  String? samplegarment_pickuppincode;
  var stitching_price;
  String? designimageurl;
String?callbackstatus;
var shopid;
var shoptype;
  MaterialPickupAddress({Key? key,this.callbackstatus,this.designimageurl,
    this.samplegarment_pickuppincode,this.samplegarment_pickuplocation,
    this.samplegarment_pickupaddress,this.name,this.phone,this.uid,this.category,
    this.wristdesign,this.neckdesign,this.designcollar,this.type,this.submit_measurement,
    this.stitching_price,this.shopid,this.shoptype}) : super(key: key);

  @override
  _MaterialPickupAddressState createState() => _MaterialPickupAddressState();
}

class _MaterialPickupAddressState extends State<MaterialPickupAddress> {
  final _matKey = GlobalKey<FormState>();
  TextEditingController _addrTextcontroller=TextEditingController();
  TextEditingController _locTextcontroller=TextEditingController();
  TextEditingController _pinTextcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),
      body:
      Center(
        child: SingleChildScrollView(
          child: Form(
            key: _matKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 5),
                  child: Text("Material Pickup Address",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                  child: TextFormField(

                    controller: _addrTextcontroller,
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
                    controller: _locTextcontroller,
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
                    controller: _pinTextcontroller,
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
                  if(_matKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        PickupMaterial(

                          uid:widget.uid,
                          name:widget.name,
                          phone:widget.phone,
                          samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                          samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                          samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                          materialpickup_address:_addrTextcontroller.text,
                          materialpickup_location:_locTextcontroller.text,
                          materialpickup_pincode:_pinTextcontroller.text,
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
                  }
                }, child: Text("Submit"))
              ],),
          ),
        ),


      ),
    );
  }
}
