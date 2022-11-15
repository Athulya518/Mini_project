import 'package:flutter/material.dart';
import 'package:malabis/screens/confirmbooking.dart';
import 'package:malabis/screens/successpage.dart';
import 'package:malabis/screens/users/orderdeliveraddress.dart';

class PreferredDate extends StatefulWidget {
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
var shopid;
var shoptype;
  String?paymentMode;
  PreferredDate(
      {Key? key,
        this.paymentMode,
      this.designimageurl,
      this.pickup_date,
      this.uid,
      this.type,
      this.category,
      this.designcollar,
      this.wristdesign,
      this.neckdesign,
      this.newaddress,
      this.name,
      this.phone,
      this.newpincode,
      this.newlocation,
      this.stitching_price,
      this.fabrictype,
      this.material_price,
      this.submit_measurement,
      this.samplegarment_pickupaddress,
      this.samplegarment_pickuplocation,
      this.samplegarment_pickuppincode,
      this.materialpickup_address,
      this.materialpickup_location,
      this.materialpickup_pincode,
      this.cashbyhand_material_date,this.shopid,this.shoptype})
      : super(key: key);

  @override
  _PreferredDateState createState() => _PreferredDateState();
}

class _PreferredDateState extends State<PreferredDate> {
  DateTime date = DateTime(2022, 09, 12);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),
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
                      child: Text(
                        "Select your preferred Order Deliver Date",
                        style: TextStyle(
                            color: Color(0xffFAD4D4),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;
                        setState(() => date = newDate);
                      },
                    ),
                  ),
                ),
                Text(
                  "${date.year}/${date.month}/${date.day}",
                  style: TextStyle(fontSize: 32, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 180.0),
                  child: Container(
                    color: Color(0xffF47C7C),
                    margin: EdgeInsets.all(20),
                    height: 50,
                    width: 150,
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderDeliverAddress(
                                    shoptype: widget.shoptype,
                                    shopid: widget.shopid,
                                    paymentMode: widget.paymentMode,
                                        preferred_order_date: date.toString(),
                                        pickup_date: widget.pickup_date,
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
                        child: Text("Book Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
