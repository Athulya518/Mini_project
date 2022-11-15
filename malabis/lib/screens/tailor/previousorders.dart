import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class TailorViewPreviousOrder extends StatefulWidget {
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

  TailorViewPreviousOrder({Key? key,this.name,this.fabrictype,this.wristdesign,this.neckdesign,this.phone,this.category,this.type,this.status,this.collardesign,this.bookingid,this.cancelled,this.confirmstatus,this.materialpicked,this.tailorassigned,this.workcomplete,this.shoporpickup,this.pickuppin,this.pickuplocation,this.pickupdate,this.pickupaddress,this.measurement,this.fabricid,this.designimgurl,this.deliverydate}) : super(key: key);

  @override
  _TailorViewPreviousOrderState createState() => _TailorViewPreviousOrderState();
}

class _TailorViewPreviousOrderState extends State<TailorViewPreviousOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Center(child:
                    widget.neckdesign!=null?
                    Text("Neck Style : "+widget.neckdesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),): Text("Neck Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

                  ),

                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    color: Color(0xfffad4d4),
                    child: Center(child:widget.wristdesign!=null? Text("Wrist Style : "+widget.wristdesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Wrist Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),



                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    color: Color(0xfffad4d4),
                    child: Center(child:widget.collardesign!=null? Text("Collar Style : "+widget.collardesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Collar Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

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














                ],
              ),
            );
          },
        ),
      ),
    );
  }
}