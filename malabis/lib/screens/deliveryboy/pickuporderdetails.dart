import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/users/materialpickaddr.dart';

import '../../widgets/appbutton.dart';
import '../../widgets/apptext.dart';
import '../../widgets/colors.dart';
import 'materialpickuppage.dart';
class PickupDetails extends StatefulWidget {


  String? pickupaddress;
  String? pickuplocation;
  String? pickuppin;
  String? pickupdate;
  String? category;
  String?bookingid;
  var name;
  var phone;
  String? type;
  String? measurement;
  String? shoporpickup;
  var status;
  var tailorassigned;
  var workcomplete;
  var materialpicked;
  var cancelled;
  var confirmstatus;
  var deliverystatus;
  var amountreceived;
  String? remarks;
  var dboyassigned;
  var dboyid;

   PickupDetails({Key? key,this.name,this.phone,this.category,this.type,this.measurement,this.pickupaddress,this.pickupdate,this.pickuplocation,this.pickuppin,this.shoporpickup,this.workcomplete,this.tailorassigned,this.materialpicked,this.confirmstatus,this.cancelled,this.bookingid,this.status,this.dboyid,this.dboyassigned,this.remarks,this.amountreceived,this.deliverystatus}) : super(key: key);

  @override
  _PickupDetailsState createState() => _PickupDetailsState();
}

class _PickupDetailsState extends State<PickupDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(backgroundColor: Color(0xffef9f9f),
      title: AppText(
        text: 'Pickup Order',


      ),
    ),

        body:

        Container(
          height: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('booking').snapshots(),
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
                      child: Center(child: Text("Name : "+widget.name.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(child: Text("Type : "+widget.type.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

                    ),

                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      color: Color(0xfffad4d4),
                      child: Center(child: Text("Category : "+widget.category.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

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

SizedBox(height: 60,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MaterialPickup()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.all(10),
                        color: Color(0xffef9f9f),
                        child: Center(child: Text("Ok",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),

                      ),
                    ),


                    widget.materialpicked==0?InkWell(

                      onTap: ()




                      {



                        FirebaseFirestore.instance.collection('booking').doc(widget.bookingid).update({

                          'materialpicked':1

                        }).then((value){

                          Navigator.pop(context);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Material Picked")));

                        });
                      },
                      child: Container(
                        color: btncolor,
                        height: 45,
                        width: 250,
                        child: Center(child: AppText(text: "Mark as Pickup ",color: Colors.white,),),
                      ),
                    ):Text(
                      "Already Picked ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),











                  ],
                ),
              );
            },
          ),
        ),
      );
  }
}
