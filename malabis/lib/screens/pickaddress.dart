import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/materialoption.dart';
import 'package:malabis/screens/stitchingpayment.dart';
class PickAddress extends StatefulWidget {
String? designimageurl;
  String? designcollar;
  String? category;
  var stitching_price;
  String? type;
var uid;
var name;
var phone;
  String?neckdesign;
  String? wristdesign;

   PickAddress({Key? key,this.designimageurl,this.name,this.phone,this.uid,this.designcollar,this.wristdesign,this.neckdesign,this.category,this.type,this.stitching_price}) : super(key: key);

  @override
  _PickAddressState createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  final _pickupKey = GlobalKey<FormState>();
  TextEditingController _addressTextcontroller=TextEditingController();
  TextEditingController _locationTextcontroller=TextEditingController();
  TextEditingController _pincodeTextcontroller=TextEditingController();

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
            key: _pickupKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
            //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
            Padding(
            padding: const EdgeInsets.only(left: 20,top: 5),
            child: Text("Pickup Address",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
      ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                                       child: TextFormField(

                        controller: _addressTextcontroller,
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
                      controller: _locationTextcontroller,
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
                      controller: _pincodeTextcontroller,
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
    if(_pickupKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          MaterialOption(

            uid: widget.uid,
            name:widget.name,
            phone:widget.phone,
            samplegarment_pickupaddress:_addressTextcontroller.text,
            samplegarment_pickuplocation:_locationTextcontroller.text,
            samplegarment_pickuppincode:_pincodeTextcontroller.text,
            neckdesign: widget.neckdesign,
            wristdesign: widget.wristdesign,
            designcollar: widget.designcollar,
            designimageurl:widget.designimageurl,
            category: widget.category,
            stitching_price: widget.stitching_price,
            type: widget.type,
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
