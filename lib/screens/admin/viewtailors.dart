import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/tailordetails.dart';
import 'package:malabis/widgets/apptext.dart';
import 'package:url_launcher/url_launcher.dart';
class ViewTailor extends StatefulWidget {
  var shopid;

  ViewTailor({Key? key,this.shopid}) : super(key: key);

  @override
  _ViewTailorState createState() => _ViewTailorState();
}

class _ViewTailorState extends State<ViewTailor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
      ),
body: Padding(
  padding: const EdgeInsets.only(top:30.0),
  child:   StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('tailor').where('status',isEqualTo: 1).snapshots(),
    builder: (context, snapshot) {
       if (snapshot.hasData &&
      snapshot.data?.docs.length == 0)
      return Center(child: Text("No data found"));

      return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context,int index
      )

          {

            if(snapshot.hasData)
              {
                return Card(
                  child: ListTile(
                    tileColor:Color(0xffef9f9f) ,
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TailorDetails(
uid: snapshot.data!.docs[index]['uid'],
                        name:snapshot.data!.docs[index]['name'] ,
                        phone: snapshot.data!.docs[index]['phone'],
                        type: snapshot.data!.docs[index]['type'],
                      )));
                    },
                    textColor: Colors.black,
                    title: Padding(
                      padding: const EdgeInsets.only(right: 80.0),
                      child: AppText(text: snapshot.data!.docs[index]['name']),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(right:80.0),
                      child: AppText(text: snapshot.data!.docs[index]['type']),
                    ),
                    // leading:InkWell(
                    //   onTap:(){
                    //     _makePhoneCall(snapshot.data!.docs[index]['phone'].toString());
                    //   },
                    //   child: Icon(
                    //     Icons.call,color: Colors.green,
                    //     size: 30,
                    //
                    //   ),
                    // ) ,
                  ),
                );

              }
       else {
              return Center(child: Text("No Data Found"));
            }
      });
    }
  ),
),
    );
  }
  // Future<void>_makePhoneCall(String phoneNumber)async {
  //   final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber,);
  //   await launchUrl(launchUri);
  // }
}
