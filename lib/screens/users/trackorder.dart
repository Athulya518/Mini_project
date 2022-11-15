import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';
import '../../widgets/colors.dart';

class TrackOrder extends StatefulWidget {
  String? userid;

  String? bookingid;

  TrackOrder({Key? key, this.userid, this.bookingid})
      : super(
          key: key,
        );

  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  bool confirmedstatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'Track Order',
        ),
      ),
      body: Container(
          height: double.infinity,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('booking')
                  .where('bookingid', isEqualTo: widget.bookingid)
                  .snapshots(),
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

                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context,i){

                  return  Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 20),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        snapshot.data!.docs[i]['status']==0?Text("Order Placed",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text(""),
                        SizedBox(height: 10,),Divider(indent: 0,endIndent: 50, color: Colors.green,),
                        snapshot.data!.docs[i]['confirmstatus']==1?Text("Order Confirmed",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text("Waiting to be Confirmed"),

                        SizedBox(height: 10,),Divider(indent: 0,endIndent: 50, color: Colors.green,),
                        snapshot.data!.docs[i]['tailorassigned']==1?Text("Tailor Assigned",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text("Waiting for Tailor"),
                        SizedBox(height: 10,),Divider(indent: 0,endIndent: 50, color: Colors.green,),
                        snapshot.data!.docs[i]['workcomplete']==1?Text("Work Completed",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text("Work in Progress"),

                        SizedBox(height: 10,),Divider(indent: 0,endIndent: 50, color: Colors.green,),
                        snapshot.data!.docs[i]['dboyassigned']==1?Text("Delivery Assigned",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text("Work in Progress"),


                        SizedBox(height: 10,),Divider(indent: 0,endIndent: 50, color: Colors.green,), snapshot.data!.docs[i]['deliverystatus']==1?Text("Delivered Successfully,",style: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.w700),):Text("Not Delivered"),
                      ],
                    ),
                  );
                });






              })),
    );
  }
}
