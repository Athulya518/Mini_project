import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/tailor/tailorwork.dart';

import '../../widgets/apptext.dart';
import '../../widgets/colors.dart';
class TailorViewOrder extends StatefulWidget {


  String? deliverydate;
  String? pickupaddress;
  String? pickuplocation;
  String? pickuppin;
  String? pickupdate;
  var fabrictype;
  String? collardesign;
  String? category;
  String?bookingid;
  var name;
  var phone;
  String? type;
  String? neckdesign;
  String? wristdesign;
  String? measurement;
  String? shoporpickup;
  String? designimgurl;
  var status;
  var tailorassigned;
  var workcomplete;
  var materialpicked;
  var cancelled;
  var fabricid;
  var confirmstatus;
  var dboyassigned;
  var dboyid;



  TailorViewOrder({Key? key,this.name,this.dboyid,this.dboyassigned,this.fabrictype,this.wristdesign,this.neckdesign,this.type,this.category,this.phone,this.status,this.collardesign,this.bookingid,this.cancelled,this.confirmstatus,this.deliverydate,this.designimgurl,this.fabricid,this.materialpicked,this.measurement,this.pickupaddress,this.pickupdate,this.pickuplocation,this.pickuppin,this.shoporpickup,this.tailorassigned,this.workcomplete,}) : super(key: key);

  @override
  _TailorViewOrderState createState() => _TailorViewOrderState();
}

class _TailorViewOrderState extends State<TailorViewOrder> {


  @override
  void initState() {
    print(widget.workcomplete);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'View Orders',
        ),
      ),
      body: Container(
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
                    child: Center(child:
                    widget.designimgurl!=null?
                    Text("Upload Design Image : "+widget.designimgurl.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),): Text("Upload Design Image : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

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



                  SizedBox(height: 60,),



                  widget.workcomplete==0?InkWell(

                    onTap: ()




                    {



                      FirebaseFirestore.instance.collection('booking').doc(widget.bookingid).update({

                        'workcomplete':1

                      }).then((value){

                        Navigator.pop(context);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Work Completed")));

                      });
                    },
                    child: Container(
                      color: btncolor,
                      height: 45,
                      width: 250,
                      child: Center(child: AppText(text: "Mark as Complete ",color: Colors.white,),),
                    ),
                  ):Text(
                    "Already Completed ",
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
