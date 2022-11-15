import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/materialoption.dart';
import 'package:malabis/screens/samplegarment.dart';
import 'package:malabis/screens/submitmeasure.dart';
class MeasurementOptionPage extends StatefulWidget {
  String? category;
  String? type;
  var uid;
  var name;
  var phone;
  var stitching_price;
  String? designcollar;
  String? neckdesign;
  String? wristdesign;
  String? designimageurl;
  var shopid;
  var shoptype;
// for collar design
   MeasurementOptionPage({Key? key,this.designimageurl, this.category,this.uid, this.neckdesign,this.type,this.designcollar,this.wristdesign,this.phone,this.name,this.stitching_price,this.shopid,this.shoptype}) : super(key: key);

  @override
  _MeasurementOptionPageState createState() => _MeasurementOptionPageState();
}

class _MeasurementOptionPageState extends State<MeasurementOptionPage> {


  @override
  void initState() {
    printData();
    super.initState();
  }

  printData(){
    print(widget.uid);
    print(widget.name);
    print(widget.phone);
    print(widget.stitching_price);
    print(widget.type);
    print(widget.category);
    print("*****************");

    print(widget.designimageurl);
    print(widget.neckdesign);
    print(widget.wristdesign);
    print(widget.designcollar);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

            appBar: AppBar(
              backgroundColor: Color(0xffFAD4D4),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Text(widget.designimageurl.toString()),
                    Text("Select Measurement Option",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),),
                    SizedBox(
                      height: 30,
                    ),

                    InkWell(
                      onTap: (){


                        FirebaseFirestore.instance.collection('callback').doc(DateTime.now().toString()).set({

                          'reqid':DateTime.now(),
                          'userid':widget.uid,
                          'username':widget.name,
                          'userphone':widget.phone,
                          'status':0,
                          'createdat':DateTime.now(),
                          'updatedat':DateTime.now(),
                          'remarks':null

                        }).then((value) {

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Call Back Request to ${widget.phone} is Registred")));

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MaterialOption(
                            callbackstatus: "true",
                            shoptype: widget.shoptype,
                            shopid: widget.shopid,
                            uid:widget.uid,
                            name:widget.name,
                            phone:widget.phone,
                            neckdesign:widget.neckdesign,
                            wristdesign:widget.wristdesign,
                            designcollar:widget.designcollar,
                            designimageurl:widget.designimageurl,
                            category: widget.category,
                            stitching_price:widget.stitching_price,
                            type: widget.type,


                          )
                            ,),);

                        });


                      },
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: Center(child: Text("Tailor will call you for your measurement",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),)),
                        decoration: BoxDecoration(
                            color: Color(0xffFAD4D4),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)
                        ),



                      ),
                    ),
                    SizedBox(height: 40,),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SubmitMeasure(
                    //       uid:widget.uid,
                    //       name:widget.name,
                    //       phone:widget.phone,
                    //       neckdesign:widget.neckdesign,
                    //       wristdesign:widget.wristdesign,
                    //       designcollar:widget.designcollar,
                    //       designimageurl:widget.designimageurl,
                    //       category: widget.category,
                    //       stitching_price:widget.stitching_price,
                    //       type: widget.type,
                    //     )));
                    //   },
                    //   child: Container(
                    //     margin:EdgeInsets.all(10),
                    //     height: 100,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Center(child: Text("Submit on app now",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),)),
                    //     decoration: BoxDecoration(
                    //         color: Color(0xffFAD4D4),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)
                    //     ),
                    //
                    //
                    //   ),
                    // ),
                    // SizedBox(height: 30,),
                    // InkWell(
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context)=>SampleGarment(
                    //       uid:widget.uid,
                    //       name:widget.name,
                    //       phone:widget.phone,
                    //       neckdesign:widget.neckdesign,
                    //       wristdesign:widget.wristdesign,
                    //       designcollar:widget.designcollar,
                    //       designimageurl:widget.designimageurl,
                    //       category: widget.category,
                    //       stitching_price:widget.stitching_price,
                    //       type: widget.type,
                    //     ),),);
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.all(10.0),
                    //     height: 100,
                    //     width: MediaQuery.of(context).size.width,
                    //     child: Center(child: Text("My Sample Garment",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400,fontSize: 14),)),
                    //
                    //     decoration: BoxDecoration(
                    //         color: Color(0xffFAD4D4),borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.grey)
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 40,),
                  ],
                ),
              ),
            ),
    );
  }
}
