import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/confirmbooking.dart';

import '../stitchingpayment.dart';

class OrderDeliverAddress extends StatefulWidget {
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
  String? neckdesign;
  String? wristdesign;
  var stitching_price;
  String? submit_measurement;
  String? pickup_date;
  String? designimageurl;
  String? paymentMode;
  var shopid;
  var shoptype;
  OrderDeliverAddress(
      {Key? key,
        this.shoptype,
        this.shopid,
        this.paymentMode,
      this.designimageurl,
      this.pickup_date,
      this.newaddress,
      this.type,
      this.designcollar,
      this.neckdesign,
      this.wristdesign,
      this.category,
      this.uid,
      this.name,
      this.phone,
      this.cashbyhand_material_date,
      this.materialpickup_pincode,
      this.materialpickup_location,
      this.materialpickup_address,
      this.samplegarment_pickuppincode,
      this.samplegarment_pickuplocation,
      this.samplegarment_pickupaddress,
      this.submit_measurement,
      this.material_price,
      this.fabrictype,
      this.stitching_price,
      this.newlocation,
      this.newpincode,
      this.preferred_order_date})
      : super(key: key);

  @override
  _OrderDeliverAddressState createState() => _OrderDeliverAddressState();
}

class _OrderDeliverAddressState extends State<OrderDeliverAddress> {
  final _dKey = GlobalKey<FormState>();
  TextEditingController _adTextcontroller = TextEditingController();
  TextEditingController _loTextcontroller = TextEditingController();
  TextEditingController _pcodeTextcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
           // key: _dKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, top: 5),
                //   child: Text("Enter Deliver Address",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.w600,
                //           fontSize: 18)),
                // ),
                //
                // Padding(
                //   padding:
                //       const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                //   child: TextFormField(
                //     controller: _adTextcontroller,
                //     validator: (value) {
                //       if (value!.isEmpty || value == "") {
                //         return "Enter Address";
                //       }
                //     },
                //     minLines: 2,
                //     maxLines: 5,
                //     keyboardType: TextInputType.multiline,
                //     decoration: InputDecoration(
                //       hintText: "Address",
                //       hintStyle: TextStyle(
                //         color: Colors.grey,
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(25),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                //
                // Padding(
                //   padding:
                //       const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                //   child: TextFormField(
                //     controller: _loTextcontroller,
                //     validator: (value) {
                //       if (value!.isEmpty || value == "") {
                //         return "Enter Location";
                //       }
                //     },
                //     minLines: 2,
                //     maxLines: 5,
                //     keyboardType: TextInputType.multiline,
                //     decoration: InputDecoration(
                //         hintText: "Location",
                //         hintStyle: TextStyle(
                //           color: Colors.grey,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(25),
                //           ),
                //         )),
                //   ),
                // ),
                //
                // Padding(
                //   padding:
                //       const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                //   child: TextFormField(
                //     controller: _pcodeTextcontroller,
                //     validator: (value) {
                //       if (value!.length != 6 || num.tryParse(value) == null) {
                //         return 'Pincode should contains 6 digits';
                //       } else {
                //         return null;
                //       }
                //     },
                //     keyboardType: TextInputType.number,
                //     minLines: 2,
                //     maxLines: 5,
                //     decoration: InputDecoration(
                //         hintText: "Pincode",
                //         hintStyle: TextStyle(
                //           color: Colors.grey,
                //         ),
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(25),
                //           ),
                //         )),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmBooking(
                                shoptype: widget.shoptype,
                                shopid: widget.shopid,
                                    // orderdeliveraddress: _adTextcontroller.text,
                                    // orderdeliverlocation:
                                    //     _loTextcontroller.text,
                                    // orderdeliver_pincode:
                                    //     _pcodeTextcontroller.text,
                                    preferred_order_date:
                                        widget.preferred_order_date,
                                    newaddress: widget.newaddress,
                                    newlocation: widget.newlocation,
                                    newpincode: widget.newpincode,
                                    cashbyhand_material_date:
                                        widget.cashbyhand_material_date,
                                    uid: widget.uid,
                                    name: widget.name,
                                    phone: widget.phone,
                                    samplegarment_pickupaddress:
                                        widget.samplegarment_pickupaddress,
                                    samplegarment_pickuplocation:
                                        widget.samplegarment_pickuplocation,
                                    samplegarment_pickuppincode:
                                        widget.samplegarment_pickuppincode,
                                    materialpickup_address:
                                        widget.materialpickup_address,
                                    materialpickup_location:
                                        widget.materialpickup_location,
                                    materialpickup_pincode:
                                        widget.materialpickup_pincode,
                                    pickup_date: widget.pickup_date,
                                    fabrictype: widget.fabrictype,
                                    material_price: widget.material_price,
                                    neckdesign: widget.neckdesign,
                                    wristdesign: widget.wristdesign,
                                    designcollar: widget.designcollar,
                                    designimageurl: widget.designimageurl,
                                    category: widget.category,
                                    submit_measurement:
                                        widget.submit_measurement,
                                    stitching_price: widget.stitching_price,
                                    type: widget.type,
                                  )));
                    },
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
