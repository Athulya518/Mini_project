import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/appbutton.dart';
import '../../widgets/apptext.dart';
import 'vieworderdetails.dart';

class ViewAllOrdersadmin extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var shopid;
  ViewAllOrdersadmin({Key? key,this.uid,this.name, this.email,this.phone,this.shopid}) : super(key: key);

  @override
  _ViewAllOrdersadminState createState() => _ViewAllOrdersadminState();
}

class _ViewAllOrdersadminState extends State<ViewAllOrdersadmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
      ),


      body:

      Container(
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('booking').where('shopid',isEqualTo: widget.shopid).snapshots(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasData &&
                snapshot.data?.docs.length == 0)
              return Center(child: Text("No data found"));
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
                        color: Color(0xffef9f9f),
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
                        //     GestureDetector(
                        //       onTap: (){
                        //         FirebaseFirestore.instance.collection('order').doc(snapshot.data!.docs[index]['oid']).update(
                        //             {
                        //               "status":0
                        //             });
                        //       },
                        //       child:  snapshot.data!.docs[index]['status']==0?Container(
                        //           color: Colors.green,
                        //           height: 20,
                        //           width: 80,
                        //           child:AppButton(
                        //             text:'Cancelled',
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
                        //           text:'Cancel',
                        //           height: 30,
                        //           width: 120,
                        //           color: Colors.green,
                        //           textColor: Colors.black,
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(height: 5,),
                        //
                        //   ],
                        // ),
                        title:

                        Text(snapshot.data!.docs[index]['username'].toString()),
                        subtitle:
                        Text(snapshot.data!.docs[index]['category'].toString()),
                        trailing: snapshot.data!.docs[index]['workcomplete']!=1?InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewOrderDetails(
                              dboyassigned: snapshot.data!
                                  .docs[index]['dboyassigned'],
                              dboyid: snapshot.data!.docs[index]
                              ['dboyid'],
                              bookingid:snapshot.data!.docs[index]['bookingid'].toString() ,
                              name: snapshot.data!.docs[index]['username'],
                              type: snapshot.data!.docs[index]['type'],
                              category: snapshot.data!.docs[index]['category'],
                              phone: snapshot.data!.docs[index]['userphone'],
                              neckdesign: snapshot.data!.docs[index]['neckdesign'],
                              wristdesign: snapshot.data!.docs[index]['wristdesign'],
                              collardesign: snapshot.data!.docs[index]['collardesign'],
                              designimgurl: snapshot.data!.docs[index]['designimgurl'],
                              stitchingprice: snapshot.data!.docs[index]['stitchingprice'],
                              measurement: snapshot.data!.docs[index]['measurement'],
                              shoporpickup: snapshot.data!.docs[index]['shoporpickup'],
                              pickupaddress: snapshot.data!.docs[index]['pickupaddress'],
                              pickuplocation: snapshot.data!.docs[index]['pickuplocation'],
                              pickuppin: snapshot.data!.docs[index]['pickuppin'],
                              pickupdate: snapshot.data!.docs[index]['pickupdate'],
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
                        ):SizedBox.shrink(),
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
