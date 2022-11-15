import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/users/trackorder.dart';
import 'package:malabis/widgets/colors.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/apptext.dart';

class AdminViewOrderDetails extends StatefulWidget {
  String? deliveryaddress;
  String? deliverylocation;
  String? deliverypin;
  String? deliverydate;
  String? pickupaddress;
  String? pickuplocation;
  String? pickuppin;
  String? pickupdate;
  var fabrictype;
  var materialprice;
  String? collardesign;
  String? category;
  String? bookingid;
  var name;
  var phone;
  String? type;
  String? neckdesign;
  String? wristdesign;
  var stitchingprice;
  String? measurement;
  String? shoporpickup;
  String? designimgurl;
  String? paymentmode;
  var totalprice;
  var status;
  var tailorassigned;
  var workcomplete;
  var materialpicked;
  var cancelled;
  var fabricid;
  var confirmstatus;
  var dboyassigned;
  var dboyid;
  var deliverystatus;
  var amountreceived;
  String? remarks;
  String?shopid;

  AdminViewOrderDetails(
      {Key? key,
        this.shopid,
        this.dboyassigned,
        this.dboyid,
        this.type,
        this.confirmstatus,
        this.category,
        this.phone,
        this.bookingid,
        this.neckdesign,
        this.wristdesign,
        this.fabrictype,
        this.name,
        this.shoporpickup,
        this.fabricid,
        this.totalprice,
        this.materialprice,
        this.measurement,
        this.status,
        this.cancelled,
        this.collardesign,
        this.deliveryaddress,
        this.deliverydate,
        this.deliverylocation,
        this.deliverypin,
        this.designimgurl,
        this.materialpicked,
        this.paymentmode,
        this.pickupaddress,
        this.pickupdate,
        this.pickuplocation,
        this.pickuppin,
        this.stitchingprice,
        this.tailorassigned,
        this.workcomplete,
        this.amountreceived,
        this.deliverystatus,
        this.remarks})
      : super(
    key: key,
  );

  @override
  _AdminViewOrderDetailsState createState() => _AdminViewOrderDetailsState();
}

class _AdminViewOrderDetailsState extends State<AdminViewOrderDetails> {
  bool confirm = false;

  String? _myTailor;
  String? _mydboy;
  String? _mpicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'My Orders ',
        ),
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
            stream:
            FirebaseFirestore.instance.collection('booking').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData && snapshot.data!.docs.length == 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Name : " + widget.name.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Type : " + widget.type.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Category : " + widget.category.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.neckdesign != null
                              ? Text(
                            "Neck Style : " +
                                widget.neckdesign.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Neck Style : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.wristdesign != null
                              ? Text(
                            "Wrist Style : " +
                                widget.wristdesign.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Wrist Style : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.collardesign != null
                              ? Text(
                            "Collar Style : " +
                                widget.collardesign.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Collar Style : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.designimgurl != null
                              ? Image.network(
                            widget.designimgurl.toString(),
                          )
                              : Text(
                            "Design Image Url : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Stitching Price : " + widget.stitchingprice.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.shoporpickup != null
                              ? Text(
                            "Shop or Pickup : " +
                                widget.shoporpickup.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Shop or Pickup : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.pickupaddress != null
                              ? Text(
                            "Pickup Address : " +
                                widget.pickupaddress.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Pickup Address : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.pickuplocation != null
                              ? Text(
                            "Pickup Location : " +
                                widget.pickuplocation.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Pickup Location : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: widget.pickuppin != null
                              ? Text(
                            "Pickup Pin : " + widget.pickuppin.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                              : Text(
                            "Pickup Pin : Not Selected ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                        child: widget.pickupdate != null
                            ? Text(
                          "Pickup Date : " + widget.pickupdate.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )
                            : Text(
                          "Pickup Date : Not Selected ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                        child: widget.fabricid != null
                            ? Text(
                          "Fabric id : " + widget.fabricid.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )
                            : Text(
                          "Fabric id : Not Selected ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                        child: widget.materialprice != null
                            ? Text(
                          "Material Price : " +
                              widget.materialprice.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )
                            : Text(
                          "Material Price : Not Selected ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                        child: widget.fabrictype != null
                            ? Text(
                          "Material for : " +
                              widget.fabrictype.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )
                            : Text(
                          "Material Price : Not Selected ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Payment Mode : " + widget.paymentmode.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Total Price : " + widget.totalprice.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Delivery Address : " +
                                widget.deliveryaddress.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Delivery Location : " +
                                widget.deliverylocation.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Delivery Pin : " + widget.deliverypin.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                          child: Text(
                            "Delivery Date : " + widget.deliverydate.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(
                        child: widget.measurement != null
                            ? Text(
                          "Submit Measurement : " +
                              widget.measurement.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        )
                            : Text(
                          "Submit Measurement : Not Selected ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    TextButton(onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrder(bookingid: widget.bookingid,)));
                    }, child: AppText(text: "Track this Order",txtalign: TextAlign.left,color: Colors.black,))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
