import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/deliveryboy/deliveryboyhome.dart';
import 'package:malabis/screens/deliveryboy/completedstitching.dart';

import '../../widgets/apptext.dart';
import '../../widgets/colors.dart';

class CompletedWorkDetails extends StatefulWidget {
  String? deliveryaddress;
  String? deliverylocation;
  String? deliverypin;
  String? deliverydate;
  var fabrictype;
  var materialprice;
  String? collardesign;
  String? category;
  String?bookingid;
  var name;
  var phone;
  String? type;
  var stitchingprice;
  String? paymentmode;
  var totalprice;
  var status;
  var tailorassigned;
  var workcomplete;
  var materialpicked;
  var cancelled;
  var fabricid;
  var confirmstatus;
  var deliverystatus;
  var amountreceived;
  String? remarks;
  var dboyassigned;
  var dboyid;



  CompletedWorkDetails(
      {Key? key,
        this.dboyassigned,this.dboyid,
      this.type,

      this.category,
      this.phone,
      this.fabrictype,
      this.name,
      this.status,
      this.bookingid,this.cancelled,this.confirmstatus,this.materialpicked,this.tailorassigned,this.workcomplete,this.collardesign,this.deliverydate,this.fabricid,this.totalprice,this.stitchingprice,this.paymentmode,this.materialprice,this.deliveryaddress,this.deliverylocation,this.deliverypin,this.remarks,this.deliverystatus,this.amountreceived
      })
      : super(key: key);

  @override
  _CompletedWorkDetailsState createState() => _CompletedWorkDetailsState();
}

class _CompletedWorkDetailsState extends State<CompletedWorkDetails> {
  @override
  void initState() {
    print(widget.deliverystatus);

    amountController.text=widget.totalprice.toString();
    super.initState();
  }
  final _amtKey = GlobalKey<FormState>();
  final _rmkKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(backgroundColor: Color(0xffef9f9f),
      title: AppText(
        text: 'Completed Work',


      ),
    ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
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
                    "Material for : " + widget.fabrictype.toString(),
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
                      "Delivery Address : " + widget.deliveryaddress.toString(),
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
              SizedBox(
                height: 20
              ),


              widget.deliverystatus==0?   Form(
                key: _rmkKey,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

Padding(
  padding: const EdgeInsets.only(top: 20.0,left:20,right: 20),
  child:   AppText(text: "Update Delivery Status"),
),


                     widget.paymentmode=="COD"? Container(
                        padding: const EdgeInsets.only(top: 20.0,left:20,right: 20),

                        child: Center(child:
                        TextFormField(
                          controller: amountController,
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty || value == "") {
                              return "Enter Amount";
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.payment,
                              color: Colors.black,
                            ),
                            hintText: "Amount",
                            filled: true,
                            fillColor: Colors.white,

                          ),

                        )),
                      ):Container(
                         padding: const EdgeInsets.only(top:15,left:20,right: 20),


                         child: Text("Online Payment: Already Paid")),
                      Container(
                        padding: const EdgeInsets.only(top: 20.0,left:20,right: 20),


                    
                        child: Center(child:
                        TextFormField(
                          controller: remarkController,
                          validator: (value) {
                            if (value!.isEmpty || value == "") {
                              return "Enter Remarks";
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.payment,
                              color: Colors.black,
                            ),
                            hintText: "Enter Remarks",
                            filled: true,
                            fillColor: Colors.white,

                          ),

                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: InkWell(

                          onTap: (){

                            if(_rmkKey.currentState!.validate()){

                              FirebaseFirestore.instance.collection('booking').doc(widget.bookingid).update({


                                'amountreceived':amountController.text,
                                'deliverystatus':1,
                                'remarks':remarkController.text


                              }).then((value) {

                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Delivered")));

                              });


                            }

                          },
                          child: Container(

                            color: btncolor,
                            height: 45,
                            width: 150,
                            child:Center(child: AppText(text: "Update Status",color: Colors.white),),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      )



                    ],
                  ),
                ),
              ):Padding(
                padding: const EdgeInsets.all(20.0),
                child: AppText(text: "Already Delivered"),
              )







]
              ),
        ),
      ),
    );
  }
}
