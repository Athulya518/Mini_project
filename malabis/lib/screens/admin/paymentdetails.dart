import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';
import 'admin_home.dart';

class ViewPaymentDetails extends StatefulWidget {


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
  var confirmstatus;
  String? fabrictype;

  ViewPaymentDetails({Key? key,this.fabrictype,this.type,this.category,this.phone,this.name,this.workcomplete,this.tailorassigned,this.materialpicked,this.confirmstatus,this.cancelled,this.bookingid,this.collardesign,this.status,this.materialprice,this.paymentmode,this.stitchingprice,this.totalprice}) : super(key: key);


  @override
  _ViewPaymentDetailsState createState() => _ViewPaymentDetailsState();
}

class _ViewPaymentDetailsState extends State<ViewPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'View Payments',
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
                    child: Center(child: Text("Stitching Price : "+widget.stitchingprice.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

                  ),




                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    color: Color(0xfffad4d4),
                    child: Center(child:widget.materialprice!=null? Text("Material Price : "+widget.materialprice.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Material Price : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),),

                  ),


                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    color: Color(0xfffad4d4),
                    child: Center(child: widget.fabrictype!=null?Text("Material for : "+widget.fabrictype.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Material for : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),),),

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




                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>AdminHomepage()
                      ), (route) => false);
                    },
                    child: Container(
                      height: 50,
                      width:100,
                      margin: EdgeInsets.all(10),
                      
                      child: Center(child: Text("Paid",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)),
decoration: BoxDecoration(color: Color(0xffef9f9f),borderRadius: BorderRadius.circular(20)),
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
