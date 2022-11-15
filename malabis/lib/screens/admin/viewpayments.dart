import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/paymentdetails.dart';
import 'package:malabis/widgets/apptext.dart';

import '../../widgets/appbutton.dart';
class ViewPayments extends StatefulWidget {
  var shopid;
  ViewPayments({Key? key,this.shopid}) : super(key: key);

  @override
  _ViewPaymentsState createState() => _ViewPaymentsState();
}

class _ViewPaymentsState extends State<ViewPayments> {
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

            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: ListTile(
                        // leading:
                        // Column(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: (){
                        //         FirebaseFirestore.instance.collection('order').doc(snapshot.data!.docs[index]['oid']).update(
                        //             {
                        //               "status":1
                        //             });
                        //       },
                        //       child:  snapshot.data!.docs[index]['status']==1?Container(
                        //           color: Colors.green,
                        //           height: 20,
                        //           width: 80,
                        //           child:AppButton(
                        //             text:'Confirmed',
                        //             height: 30,
                        //             width: 120,
                        //             color: Colors.black,
                        //             textColor: Colors.white,
                        //           )):
                        //       Container(
                        //         color: Colors.red,
                        //         height: 20,
                        //         width: 80,
                        //         child: AppButton(
                        //           text:'Confirm',
                        //           height: 30,
                        //           width: 120,
                        //           color: Colors.green,
                        //           textColor: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 5,),
                        //
                        //
                        //   ],
                        // ),
                        title:

                        Text(snapshot.data!.docs[index]['username'].toString()),
                        subtitle:
                        Text(snapshot.data!.docs[index]['category'].toString()),
                        trailing: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPaymentDetails(
                              bookingid:snapshot.data!.docs[index]['bookingid'].toString() ,
                              name: snapshot.data!.docs[index]['username'],
                              type: snapshot.data!.docs[index]['type'],
                              category: snapshot.data!.docs[index]['category'],
                              phone: snapshot.data!.docs[index]['userphone'],
                              stitchingprice: snapshot.data!.docs[index]['stitchingprice'],
                              fabrictype: snapshot.data!.docs[index]['fabrictype'],
                              materialprice: snapshot.data!.docs[index]['materialprice'],
                              paymentmode: snapshot.data!.docs[index]['paymentmode'],
                              totalprice: snapshot.data!.docs[index]['totalprice'],
                              status: snapshot.data!.docs[index]['status'],
                              confirmstatus:   snapshot.data!.docs[index]['confirmstatus'],
                              tailorassigned: snapshot.data!.docs[index]['tailorassigned'],
                              workcomplete: snapshot.data!.docs[index]['workcomplete'],
                              materialpicked: snapshot.data!.docs[index]['materialpicked'],
                              cancelled: snapshot.data!.docs[index]['cancelled'],




                            )));
                          },
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.blueGrey,
                            child: Text("View Details",style: TextStyle(color: Colors.white),),
                          ),
                        ),


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
