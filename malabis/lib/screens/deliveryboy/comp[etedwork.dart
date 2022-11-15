import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/deliveryboy/deliveryboyhome.dart';

import '../../widgets/appbutton.dart';
import '../../widgets/apptext.dart';
import 'completedworkdetails.dart';
class CompletedWork extends StatefulWidget {
  String? dboyid;
   CompletedWork({Key? key,this.dboyid}) : super(key: key);

  @override
  _CompletedWorkState createState() => _CompletedWorkState();
}

class _CompletedWorkState extends State<CompletedWork> {
  @override
  void initState() {
    print(widget.dboyid);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'Completed Work',


        ),
      ),

      body:

      Container(
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

                        title:

                        Text(snapshot.data!.docs[index]['username'].toString()),
                        subtitle:
                        Text(snapshot.data!.docs[index]['category'].toString()),
                        trailing: snapshot.data!.docs[index]['deliverystatus']!=1?InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CompletedWorkDetails(
                              dboyassigned: snapshot.data!
                                  .docs[index]['dboyassigned'],
                              dboyid: snapshot.data!.docs[index]
                              ['dboyid'],
                              bookingid:snapshot.data!.docs[index]['bookingid'].toString() ,
                              name: snapshot.data!.docs[index]['username'],
                              type: snapshot.data!.docs[index]['type'],
                              category: snapshot.data!.docs[index]['category'],
                              phone: snapshot.data!.docs[index]['userphone'],
                              stitchingprice: snapshot.data!.docs[index]['stitchingprice'],
                              materialprice: snapshot.data!.docs[index]['materialprice'],
                              fabricid: snapshot.data!.docs[index]['fabricid'],
                              fabrictype: snapshot.data!.docs[index]['fabrictype'],
                              paymentmode: snapshot.data!.docs[index]['paymentmode'],
                              totalprice: snapshot.data!.docs[index]['totalprice'],
                              deliveryaddress: snapshot.data!.docs[index]['deliveryaddress'],
                              deliverylocation: snapshot.data!.docs[index]['deliverylocation'],
                              deliverypin: snapshot.data!.docs[index]['deliverypin'],
                              deliverydate: snapshot.data!.docs[index]['deliverydate'],
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
                        ):ScaffoldMessenger(child: Text("Already Delivered")),


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
