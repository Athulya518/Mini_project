import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/tailor/tailororderview.dart';

import '../../widgets/appbutton.dart';
import '../../widgets/apptext.dart';
import '../admin/tailororder.dart';

class OrdersView extends StatefulWidget {
  String? tailorid;
  OrdersView({Key? key, this.tailorid}) : super(key: key);

  @override
  _OrdersViewState createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    print(widget.tailorid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'View Current Orders',
        ),
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('booking')
              .where('tailorid', isEqualTo: widget.tailorid)
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

            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      child: ListTile(

                        title: Text(
                            snapshot.data!.docs[index]['username'].toString()),
                        subtitle: Text(
                            snapshot.data!.docs[index]['category'].toString()),
                        trailing: snapshot.data!.docs[index]['workcomplete']!=1?InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TailorViewOrder(

                                          dboyassigned: snapshot.data!
                                              .docs[index]['dboyassigned'],
                                          dboyid: snapshot.data!.docs[index]
                                          ['dboyid'],
                                          bookingid: snapshot
                                              .data!.docs[index]['bookingid']
                                              .toString(),
                                          name: snapshot.data!.docs[index]
                                          ['username'],
                                          type: snapshot.data!.docs[index]
                                          ['type'],
                                          category: snapshot.data!.docs[index]
                                          ['category'],
                                          phone: snapshot.data!.docs[index]
                                          ['userphone'],

                                          designimgurl: snapshot.data!
                                              .docs[index]['designimgurl'],
                                          measurement: snapshot
                                              .data!.docs[index]['measurement'],
                                          shoporpickup: snapshot.data!
                                              .docs[index]['shoporpickup'],
                                          pickupaddress: snapshot.data!
                                              .docs[index]['pickupaddress'],
                                          pickuplocation: snapshot.data!
                                              .docs[index]['pickuplocation'],
                                          pickuppin: snapshot.data!.docs[index]
                                          ['pickuppin'],
                                          pickupdate: snapshot.data!.docs[index]
                                          ['pickupdate'],
                                          fabricid: snapshot.data!.docs[index]
                                          ['fabricid'],
                                          fabrictype: snapshot.data!.docs[index]
                                          ['fabrictype'],
                                          deliverydate: snapshot.data!
                                              .docs[index]['deliverydate'],
                                          status: snapshot.data!.docs[index]
                                          ['status'],
                                          confirmstatus: snapshot.data!
                                              .docs[index]['confirmstatus'],
                                          tailorassigned: snapshot.data!
                                              .docs[index]['tailorassigned'],
                                          workcomplete: snapshot.data!
                                              .docs[index]['workcomplete'],
                                          materialpicked: snapshot.data!
                                              .docs[index]['materialpicked'],
                                          cancelled: snapshot.data!.docs[index]
                                          ['cancelled'],
                                        )));
                          },
                          child: Container(
                            height: 20,
                            width: 100,
                            color: Colors.blueGrey,
                            child: Text(
                              "View Details",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ):ScaffoldMessenger(child: Text("Already Completed")),
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
