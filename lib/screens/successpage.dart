import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/bottomNavigationPage.dart';
import 'package:malabis/screens/homepage.dart';

class SuccessPage extends StatefulWidget {
  String? pickup_date;
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
  var oid;
  String? samplegarment_pickupaddress;
  String? samplegarment_pickuplocation;
  String? samplegarment_pickuppincode;
  String? type;
  String? neckdesign;
  String? wristdesign;
  var stitching_price;
  String? submit_measurement;
  String? designimageurl;
  var shopid;
  var shoptype;
  SuccessPage(
      {Key? key,
      this.designimageurl,
      this.pickup_date,
      this.oid,
      this.newaddress,
      this.designcollar,
      this.wristdesign,
      this.neckdesign,
      this.category,
      this.shoptype,
      this.shopid,
      this.type,
      this.orderdeliver_pincode,
      this.orderdeliverlocation,
      this.orderdeliveraddress,
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
      this.preferred_order_date,
      this.uid,
      this.name,
      this.phone})
      : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  var oid;
  var orderdeliveraddress;
  var orderdeliverlocation;
  var orderdeliver_pincode;

  @override
  void initState() {
    oid = DateTime.now().toString();
    //printData();
  }

  // printData() {
  //   print(widget.type);
  //   print(widget.category);
  //   print(widget.uid);
  //   print(widget.name);
  //   print(widget.phone);
  //   print(widget.neckdesign);
  //   print(widget.wristdesign);
  //   print(widget.designcollar);
  //   print(widget.stitching_price);
  //   print(widget.submit_measurement);
  //   print(widget.samplegarment_pickupaddress);
  //   print(widget.samplegarment_pickuplocation);
  //   print(widget.samplegarment_pickuppincode);
  //   print(widget.materialpickup_address);
  //   print(widget.materialpickup_location);
  //   print(widget.materialpickup_pincode);
  //   print(widget.pickup_date);
  //   print(widget.newaddress);
  //   print(widget.newlocation);
  //   print(widget.newpincode);
  //   print(widget.preferred_order_date);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              FirebaseFirestore.instance.collection('order').doc(oid).set({
                'status': 0,
                'oid': oid,
                'uid': widget.uid,
                'name': widget.name,
                'phone': widget.phone,
                'type': widget.type,
                'category': widget.category,
                'designimageurl': widget.designimageurl,
                'neckdesign': widget.neckdesign,
                'wristdesign': widget.wristdesign,
                'designcollar': widget.designcollar,
                'stitching_price': widget.stitching_price,
                'submit_measurement': widget.submit_measurement,
                'samplegarment_pickupaddress':
                    widget.samplegarment_pickupaddress,
                'samplegarment_pickuplocation':
                    widget.samplegarment_pickuplocation,
                'samplegarment_pickuppincode':
                    widget.samplegarment_pickuppincode,
                'materialpickup_address': widget.materialpickup_address,
                'materialpickup_location': widget.materialpickup_location,
                'materialpickup_pincode': widget.materialpickup_pincode,
                'pickup_date': widget.pickup_date,
                'newaddress': widget.newaddress,
                'newlocation': widget.newlocation,
                'newpincode': widget.newpincode,
                'material_price': widget.material_price,
                'fabrictype': widget.fabrictype,
                'cashbyhand_material_date': widget.cashbyhand_material_date,
                'preferred_order_date': widget.preferred_order_date,
                'orderdeliveraddress': widget.orderdeliveraddress,
                'orderdeliverlocation': widget.orderdeliverlocation,
                'orderdeliver_pincode': widget.orderdeliver_pincode,
              }).then(
                (value) => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationPage(
                        name: widget.name,
                        phone: widget.phone,
                        uid: widget.uid,

                      ),
                    ),
                    (route) => false),
              );
            },
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xffef9f9f),
              ),
              child: Text("Your Booking is done Successfully"),
            ),
          )
        ],
      ),
    );
  }
}
