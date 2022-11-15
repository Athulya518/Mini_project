import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/users/trackorder.dart';

import '../../widgets/apptext.dart';
import '../../widgets/colors.dart';
class MyOrderDetails extends StatefulWidget {
  String?userid;
  String? deliveryaddress;
  String? deliverylocation;
  String? deliverypin;
  String? deliverydate;
  String? pickupaddress;
  String? pickuplocation;
  String? pickuppin;
  String? pickupdate;
  var fabrictype;
  var materialprice;
  String? collardesign;
  String? category;
  var name;
  var phone;
  String? type;
  String?neckdesign;
  String? wristdesign;
  var stitchingprice;
  String? measurement;
  String? shoporpickup;
  String? designimgurl;
  String? paymentmode;
  var  totalprice;
  var status;
  var tailorassigned;
  var workcomplete;
  var materialpicked;
  var cancelled;
  var fabricid;
  String? bookingid;
  var dboyassigned;
  var dboyid;
  var deliverystatus;
  var amountreceived;
  String? remarks;
  var confirmstatus;





  MyOrderDetails({Key? key,this.userid,this.confirmstatus,this.type,this.category,this.phone,this.neckdesign,this.wristdesign,this.fabrictype,this.name,this.shoporpickup,this.fabricid,this.totalprice,this.materialprice,this.measurement,this.status,this.cancelled,this.collardesign,this.deliveryaddress,this.deliverydate,this.deliverylocation,this.deliverypin,this.designimgurl,this.materialpicked,this.paymentmode,this.pickupaddress,this.pickupdate,this.pickuplocation,this.pickuppin,this.stitchingprice,this.tailorassigned,this.workcomplete,this.dboyassigned,this.deliverystatus,this.amountreceived,this.remarks,this.dboyid,this.bookingid}) : super(key: key,);

  @override
  _MyOrderDetailsState createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  bool confirmedstatus=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>TrackOrder(userid: widget.userid,bookingid: widget.bookingid,)));
          }, child: AppText(text: "Track this Order",txtalign: TextAlign.left,color: Colors.white,))
        ],
        backgroundColor: Color(0xffef9f9f),
        title: AppText(
          text: 'My Orders',
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
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
                child: Center(child:
                widget.neckdesign!=null?
                Text("Neck Style : "+widget.neckdesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),): Text("Neck Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

              ),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.wristdesign!=null? Text("Wrist Style : "+widget.wristdesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Wrist Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),



              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.collardesign!=null? Text("Collar Style : "+widget.collardesign.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Collar Style : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.designimgurl!=null? Text("Design Image Url : "+widget.designimgurl.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Design Image Url : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

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
                child: Center(child:widget.shoporpickup!=null? Text("Shop or Pickup : "+widget.shoporpickup.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Shop or Pickup : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),




              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.pickupaddress!=null?  Text("Pickup Address : "+widget.pickupaddress.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Pickup Address : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.pickuplocation!=null?  Text("Pickup Location : "+widget.pickuplocation.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Pickup Location : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.pickuppin!=null?  Text("Pickup Pin : "+widget.pickuppin.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Pickup Pin : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),





              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child: widget.pickupdate!=null?Text("Pickup Date : "+widget.pickupdate.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Pickup Date : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),),

              ),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.fabricid!=null? Text("Fabric id : "+widget.fabricid.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Fabric id : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),),

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
                child: Center(child: widget.fabrictype!=null?Text("Material for : "+widget.fabrictype.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Material Price : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),),),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child: Text("Payment Mode : "+widget.paymentmode.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child: Text("Total Price : "+widget.totalprice.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),

              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:Text("Delivery Address : "+widget.deliveryaddress.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:Text("Delivery Location : "+widget.deliverylocation.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:Text("Delivery Pin : "+widget.deliverypin.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:Text("Delivery Date : "+widget.deliverydate.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                color: Color(0xfffad4d4),
                child: Center(child:widget.measurement!=null? Text("Submit Measurement : "+widget.measurement.toString(),style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),):Text("Submit Measurement : Not Selected ",style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400,fontSize: 16),)),),

              SizedBox(height: 50,),


              // widget.status!=1?
              //
              //
              // InkWell(
              //   onTap: (){
              //
              //     print(widget.bookingid);
              //
              //     setState(() {
              //       confirmedstatus=true;
              //     });
              //
              //
              //     FirebaseFirestore.instance.collection('booking').doc(widget.bookingid).update({
              //
              //       'confirmstatus':1
              //
              //     }).then((value){
              //
              //       Navigator.pop(context);
              //
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Confirmed")));
              //
              //     });
              //
              //   },
              //
              //   child: Container(
              //     color: btncolor,
              //     height: 45,
              //     width: 100,
              //     child: Center(child: AppText(text: "Confirm",color: Colors.white,),),
              //   ),
              //
              // ):Text(
              //   "Already Confirmed",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontWeight: FontWeight.w400,
              //       fontSize: 16),
              // ),SizedBox(height: 10,),



              (widget.cancelled!=1 && widget.confirmstatus==1)?Text("Order Confirmed"):


              (widget.cancelled!=0 && widget.confirmstatus!=0)? InkWell(
                onTap: (){

                  print(widget.bookingid);

                  setState(() {
                    confirmedstatus=true;
                  });


                  FirebaseFirestore.instance.collection('booking').doc(widget.bookingid).update({

                    'cancelled':1

                  }).then((value){

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Cancelled")));

                  });

                },

                child: Container(
                  color: btncolor,
                  height: 45,
                  width: 100,
                  child: Center(child: AppText(text: "Cancel",color: Colors.white,),),
                ),

              ):Text(
                "Already Cancelled",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),SizedBox(height: 50,),






            ],
          ),
        )
      ),
    );
  }
}
