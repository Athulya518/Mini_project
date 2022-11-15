import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:malabis/screens/deliveryboy/pickuporderdetails.dart';

import '../../widgets/apptext.dart';
class PickMaterial extends StatefulWidget {
  String? dboyid;
  PickMaterial({Key? key,this.dboyid}) : super(key: key);

  @override
  _PickMaterialState createState() => _PickMaterialState();
}

class _PickMaterialState extends State<PickMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Color(0xffef9f9f),
      title: AppText(
        text: 'pickup',


      ),
    ),
     body: Container(
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('booking').where('dboyid', isEqualTo: widget.dboyid).snapshots(),
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

            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: ListTile(
                        leading:
                        Column(
                          children: [


                          ],
                        ),
                        title:

                        Text(snapshot.data!.docs[index]['username'].toString()),
                        subtitle:
                        Text(snapshot.data!.docs[index]['category'].toString()),
                        trailing: snapshot.data!.docs[index]['materialpicked']!=1?InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PickupDetails(
                              dboyassigned: snapshot.data!
                                  .docs[index]['dboyassigned'],
                              dboyid: snapshot.data!.docs[index]
                              ['dboyid'],
                              bookingid:snapshot.data!.docs[index]['bookingid'].toString() ,
                              name: snapshot.data!.docs[index]['username'],
                              type: snapshot.data!.docs[index]['type'],
                              category: snapshot.data!.docs[index]['category'],
                              phone: snapshot.data!.docs[index]['userphone'],
                              measurement: snapshot.data!.docs[index]['measurement'],
                              shoporpickup: snapshot.data!.docs[index]['shoporpickup'],
                              pickupaddress: snapshot.data!.docs[index]['pickupaddress'],
                              pickuplocation: snapshot.data!.docs[index]['pickuplocation'],
                              pickuppin: snapshot.data!.docs[index]['pickuppin'],
                              pickupdate: snapshot.data!.docs[index]['pickupdate'],
                              status: snapshot.data!.docs[index]['status'],
                              confirmstatus:   snapshot.data!.docs[index]['confirmstatus'],
                              tailorassigned: snapshot.data!.docs[index]['tailorassigned'],
                              workcomplete: snapshot.data!.docs[index]['workcomplete'],
                              materialpicked: snapshot.data!.docs[index]['materialpicked'],
                              cancelled: snapshot.data!.docs[index]['cancelled'],
                              deliverystatus:snapshot.data!.docs[index]['deliverystatus'],
                              amountreceived:snapshot.data!.docs[index]['amountreceived'],
                              remarks:snapshot.data!.docs[index]['remarks'],


                            )));
                          },
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.blueGrey,
                            child: Text("View Details",style: TextStyle(color: Colors.white),),
                          ),
                        ):ScaffoldMessenger(child: Text("Already Picked")),


                      ),

                    );



                  }),
            );
          },
        ),
      ),
    );
  }
}
