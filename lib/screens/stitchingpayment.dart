import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/deliverdate.dart';
import 'package:malabis/screens/successpage.dart';

class StitchingPayment extends StatefulWidget {
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
var shoptype;
var shopid;

  StitchingPayment({
    Key? key,

    this.designimageurl,
    this.pickup_date,
    this.uid,
    this.neckdesign,
    this.designcollar,
    this.wristdesign,
    this.type,
    this.category,
    this.phone,
    this.name,
    this.materialpickup_pincode,
    this.materialpickup_location,
    this.materialpickup_address,
    this.samplegarment_pickuppincode,
    this.samplegarment_pickuplocation,
    this.samplegarment_pickupaddress,
    this.submit_measurement,
    this.stitching_price,
    this.material_price,
    this.fabrictype,
    this.newaddress,
    this.newlocation,
    this.newpincode,
    this.cashbyhand_material_date,this.shoptype,this.shopid
  }) : super(key: key);

  @override
  _StitchingPaymentState createState() => _StitchingPaymentState();
}

class _StitchingPaymentState extends State<StitchingPayment> {
  @override
  void initState() {
    printData();
    super.initState();
  }

  printData() {
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
    print(widget.newaddress);
    print(widget.newlocation);
    print(widget.newpincode);
  }

  int value = 0;
  final paymentLabels = ["Cash on delivery"];
  final paymentIcons = [
    Icons.money_off,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffFAD4D4),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              HeaderLabel(
                headerText: "Payment for Stitching",
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ListView.separated(
                      itemCount: paymentLabels.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Radio(
                            activeColor: Color(0xffEF9F9F),
                            value: index,
                            groupValue: value,
                            onChanged: (i) => setState(() => value),
                          ),
                          title: Text(
                            paymentLabels[index],
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: Icon(
                            paymentIcons[index],
                            color: Color(0xffEF9F9F),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreferredDate(
                                paymentMode:paymentLabels[0] ,
                                    pickup_date: widget.pickup_date,
                                    newaddress: widget.newaddress,
                                    newlocation: widget.newlocation,
                                    newpincode: widget.newpincode,
                                    cashbyhand_material_date:
                                        widget.cashbyhand_material_date,

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
                                submit_measurement:
                                widget.submit_measurement,
                                uid: widget.uid,
                                name: widget.name,
                                phone: widget.phone,
                                    fabrictype: widget.fabrictype,
                                    material_price: widget.material_price,
                                    neckdesign: widget.neckdesign,
                                    wristdesign: widget.wristdesign,
                                    designcollar: widget.designcollar,
                                    designimageurl: widget.designimageurl,
                                    category: widget.category,

                                    stitching_price: widget.stitching_price,
                                    type: widget.type,
                                shoptype: widget.shoptype,
                                shopid: widget.shopid,
                                  )));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 50,
                            width: 100,
                            margin: EdgeInsets.all(20),
                            color: Color(0xffef9f9f),
                            child: Center(
                                child: Text(
                              "Price:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),
                            ))),
                        Container(
                            height: 50,
                            width: 100,
                            margin: EdgeInsets.all(20),
                            color: Color(0xffef9f9f),
                            child: Center(
                                child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}

class HeaderLabel extends StatelessWidget {
  final String headerText;
  HeaderLabel({Key? key, required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        headerText,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
