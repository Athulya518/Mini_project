import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/widgets/colors.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/apptext.dart';
import '../users/trackorder.dart';

class ViewOrderDetails extends StatefulWidget {
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

  ViewOrderDetails(
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
  _ViewOrderDetailsState createState() => _ViewOrderDetailsState();
}

class _ViewOrderDetailsState extends State<ViewOrderDetails> {
  bool confirm = false;

  String? _myTailor;
  String? _mydboy;
  String? _mpicked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrder(bookingid: widget.bookingid,)));
          }, child: AppText(text: "Track this Order",txtalign: TextAlign.left,color: Colors.white,))
        ],
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
                    widget.confirmstatus != 1
                        ? InkWell(
                            onTap: () {
                              print(widget.bookingid);

                              setState(() {
                                confirm = true;
                              });

                              FirebaseFirestore.instance
                                  .collection('booking')
                                  .doc(widget.bookingid)
                                  .update({'confirmstatus': 1}).then((value) {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Order Confirmed")));
                              });
                            },
                            child: Container(
                              color: btncolor,
                              height: 45,
                              width: 100,
                              child: Center(
                                child: AppText(
                                  text: "Confirm",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    widget.confirmstatus == 1 && widget.tailorassigned != 1
                        ? Container(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 10, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(text: "Select Tailor to Assign"),
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('tailor')
                                            .where('shopid',isEqualTo: widget.shopid.toString())

                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          print(widget.shopid);
                                          if (!snapshot.hasData) {
                                            return SizedBox.shrink();
                                          }

                                          if (snapshot.hasData &&
                                              snapshot.data!.docs.length == 0) {
                                            return SizedBox.shrink();
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 10, right: 20),
                                            child: Column(
                                              children: [
                                                DropdownButtonFormField<String>(
                                                    value: _myTailor,
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          1.2)),
                                                      hintText: "Select Item",
                                                      //prefixIcon: Icon(Icons.email),
                                                      //suffixIcon: Icon(Icons.panorama_fish_eye),
                                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    onChanged: (value) =>
                                                        setState(() {
                                                          _myTailor = value;
                                                          print(_myTailor
                                                              .toString());
                                                        }),
                                                    validator: (value) =>
                                                        value == null
                                                            ? 'field required'
                                                            : null,
                                                    items: snapshot.data!.docs
                                                        .map((DocumentSnapshot
                                                            document) {
                                                      return DropdownMenuItem<
                                                              String>(
                                                          value: document[
                                                              'tailorid'],
                                                          child: Text(
                                                              '${document['tailorid']}'));
                                                    }).toList()),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        if (_myTailor != null) {
                                          FirebaseFirestore.instance
                                              .collection('booking')
                                              .doc(widget.bookingid)
                                              .update({
                                            'tailorid': _myTailor.toString(),
                                            'tailorassigned': 1
                                          }).then((value) {
                                            Navigator.pop(context);

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Tailor Assigned")));
                                          });
                                        }
                                      },
                                      child: Container(
                                        color: btncolor,
                                        height: 45,
                                        width: 150,
                                        child: Center(
                                          child: AppText(
                                              text: "Assign Tailor",
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ):widget.confirmstatus == 1 && widget.tailorassigned == 1?Text("Tailor Assigned")
                        : Text(
                            "Tailor Not Assigned ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    widget.workcomplete == 1 && widget.dboyassigned != 1
                        ? Container(
                            height: 150,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 10, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                      text: "Select Delivery boy to Assign"),
                                  Expanded(
                                    child: Container(
                                      height: 100,
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('dboy')
                                            .where('status', isEqualTo: 1)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return SizedBox.shrink();
                                          }

                                          if (snapshot.hasData &&
                                              snapshot.data!.docs.length == 0) {
                                            return SizedBox.shrink();
                                          }
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 10, right: 20),
                                            child: Column(
                                              children: [
                                                DropdownButtonFormField<String>(
                                                    value: _mydboy,
                                                    icon: Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          1.2)),
                                                      hintText: "Select Delivery Boy",
                                                      //prefixIcon: Icon(Icons.email),
                                                      //suffixIcon: Icon(Icons.panorama_fish_eye),
                                                      //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                                    ),
                                                    onChanged: (value) =>
                                                        setState(() {
                                                          _mydboy = value;
                                                          print(_mydboy.toString());
                                                        }),
                                                    validator: (value) =>
                                                        value == null
                                                            ? 'field required'
                                                            : null,
                                                    items: snapshot.data!.docs
                                                        .map((DocumentSnapshot
                                                            document) {
                                                      return DropdownMenuItem<
                                                              String>(
                                                          value: document[
                                                              'dboyid'],
                                                          child: Text(
                                                              '${document['dboyid']}'));
                                                    }).toList()),

                                                Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      if (_mydboy !=
                                                          null) {
                                                        print(_mydboy.toString());
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                            'booking')
                                                            .doc(widget
                                                            .bookingid)
                                                            .update({
                                                          'dboyid':
                                                          _mydboy.toString(),
                                                          'dboyassigned':
                                                          1
                                                        }).then((value) {
                                                          Navigator.pop(
                                                              context);

                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                              content:
                                                              Text("Delivery Assigned")));
                                                        });
                                                      }
                                                    },
                                                    child:
                                                    Container(
                                                      color:
                                                      btncolor,
                                                      height: 45,
                                                      width: 150,
                                                      child:
                                                      Center(
                                                        child: AppText(
                                                            text:
                                                            "Assign Delivery",
                                                            color:
                                                            Colors.red),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                widget.dboyassigned == 1 &&
                                                        widget.materialpicked !=
                                                            1
                                                    ? Container(
                                                        height: 150,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0,
                                                                  top: 10,
                                                                  right: 20),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AppText(
                                                                  text:
                                                                      "Select Delivery boy to Pick Material"),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  height: 100,
                                                                  child: StreamBuilder<
                                                                      QuerySnapshot>(
                                                                    stream: FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'dboy')
                                                                        .where(
                                                                            'status',
                                                                            isEqualTo:
                                                                                1)
                                                                        .snapshots(),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return SizedBox
                                                                            .shrink();
                                                                      }

                                                                      if (snapshot
                                                                              .hasData &&
                                                                          snapshot.data!.docs.length ==
                                                                              0) {
                                                                        return SizedBox
                                                                            .shrink();
                                                                      }
                                                                      return Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                20.0,
                                                                            top:
                                                                                10,
                                                                            right:
                                                                                20),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            DropdownButtonFormField<String>(
                                                                                value: _mpicked,
                                                                                icon: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  color: Colors.black,
                                                                                ),
                                                                                decoration: InputDecoration(
                                                                                  enabledBorder: UnderlineInputBorder(
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 1.2)),
                                                                                  hintText: "Select Delivery Boy",
                                                                                  //prefixIcon: Icon(Icons.email),
                                                                                  //suffixIcon: Icon(Icons.panorama_fish_eye),
                                                                                  //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),
                                                                                ),
                                                                                onChanged: (value) => setState(() {
                                                                                      _mpicked = value;
                                                                                      //print(_mydboy.toString());
                                                                                    }),
                                                                                validator: (value) => value == null ? 'field required' : null,
                                                                                items: snapshot.data!.docs.map((DocumentSnapshot document) {
                                                                                  return DropdownMenuItem<String>(value: document['dboyid'], child: Text('${document['dboyid']}'));
                                                                                }).toList()),

                                                                          ],
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    :SizedBox.shrink(),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox.shrink()
                  ],
                ),
              );
            }),
      ),
    );
  }
}
