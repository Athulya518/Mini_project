import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../bottomNavigationPage.dart';

class BookingPage extends StatefulWidget {
  String? designimageurl;
  String? designcollar;
  String? category;
  String? type;
  var uid;
  var name;
  var phone;
  String? neckdesign;
  String? wristdesign;

  var stitching_price;
  var fabrictype;
  var materialprice;
  var totalprice;
  String? delivaddress;
  String? delivlocation;
  String? delivpin;
  String? delivdate;
  String? pickvaddress;
  String? picklocation;
  String? pickvpin;
  String? pickdate;
  String? paymentMode;
  String? pickuporshop;

  String? measurement;
  String?fabricid;
  var shopid;
  var shoptype;

  BookingPage(
      {Key? key,
      this.measurement,
      this.pickuporshop,
      this.uid,
      this.category,
      this.type,
      this.wristdesign,
      this.designcollar,
      this.neckdesign,
      this.name,
      this.phone,
      this.stitching_price,
      this.designimageurl,
      this.fabrictype,
      this.paymentMode,
      this.materialprice,
      this.totalprice,
      this.delivaddress,
      this.delivdate,
      this.delivlocation,
      this.delivpin,
      this.pickdate,
        this.fabricid,
      this.picklocation,
      this.pickvaddress,
      this.pickvpin,
      this.shopid,
      this.shoptype})
      : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var uuid=Uuid();

  var bookingid;

  @override
  void initState() {

    bookingid=uuid.v1();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  FirebaseFirestore.instance
                      .collection('booking')
                      .doc(bookingid)
                      .set({
                    'shopid':widget.shopid,
                    'shoptype':widget.shoptype,

                    'bookingid':bookingid,
                    'measurement':widget.measurement,
                    'shoporpickup': widget.pickuporshop,
                    'userid':  widget.uid,
                    'category':  widget.category,
                    'type':  widget.type,
                    'wristdesign':  widget.wristdesign,
                    'collardesign':  widget.designcollar,
                    'neckdesign':  widget.neckdesign,
                    'username':  widget.name,
                    'userphone':  widget.phone,
                    'stitchingprice':widget.stitching_price,
                    'designimgurl': widget.designimageurl,
                    'fabrictype':  widget.fabrictype,
                    'paymentmode':  widget.paymentMode,
                    'materialprice':  widget.materialprice,
                    'totalprice': widget.totalprice,
                    'deliveryaddress':  widget.delivaddress,
                    'deliverydate':  widget.delivdate,
                    'deliverylocation':  widget.delivlocation,
                    'deliverypin':  widget.delivpin,
                    'pickupdate': widget.pickdate,
                    'pickuplocation': widget.picklocation,
                    'pickupaddress': widget.pickvaddress,
                    'pickuppin': widget.pickvpin,
                    'status':0,
                    'tailorassigned':0,
                    'workcomplete':0,
                    'materialpicked':0,
                    'cancelled':0,'fabricid':widget.fabricid,
                    'confirmstatus':0,
                    'tailorid':"not assigned",
                    'dboyassigned':0,
                    'dboyid':"not set",
                    'deliverystatus':0,
                    'amountreceived':0.0,
                    'remarks':"not set",


                  }).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavigationPage(name: widget.name,uid: widget.uid,phone: widget.phone,email: "email",)), (route) => false));
                },
                child: Center(
                  child: Container(
                      height: 100,
                      width: 450,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration( color: Colors.orange,borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left:58.0),
                        child: Text("Your Booking is done Successfully",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      ))),
                ))
          ],
        ),
      ),
    );
  }
}