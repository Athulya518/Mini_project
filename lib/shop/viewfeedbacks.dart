import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/vieworderdetails.dart';

import '../../widgets/appbutton.dart';
import '../../widgets/apptext.dart';

class ViewFeedbacks extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
  var shopid;
  ViewFeedbacks(
      {Key? key, this.uid, this.name, this.email, this.phone, this.shopid})
      : super(key: key);

  @override
  _ViewFeedbacksState createState() => _ViewFeedbacksState();
}

class _ViewFeedbacksState extends State<ViewFeedbacks> {
  @override
  Widget build(BuildContext context) {
    print(widget.shopid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
        title: Text("All Feedbacks"),
      ),
      body: Container(
        height: double.infinity,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('feedback')
              .where('shopid', isEqualTo: widget.shopid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data?.docs.length == 0)
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(

                        child: ListTile(
                          leading: CircleAvatar(
                            child: Center(
                              child: Text((index + 1).toString()),
                            ),
                          ),
                          title: Text(
                              snapshot.data!.docs[index]['title'].toString()),
                          subtitle: Text(
                              snapshot.data!.docs[index]['message'].toString()),
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
