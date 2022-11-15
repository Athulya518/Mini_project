import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:malabis/screens/newaddress.dart';
import 'package:malabis/screens/stitchingpayment.dart';
import 'package:malabis/screens/users/orderdeliveraddress.dart';


class CodDateforshopmaterial extends StatefulWidget {
  var fabrictype;
  var material_price;
  String? designcollar;
  String? category;
  var uid;
  var name;
  var phone;
  String? samplegarment_pickupaddress;
  String? samplegarment_pickuplocation;
  String? samplegarment_pickuppincode;
  String? type;
  String?neckdesign;
  String? wristdesign;
  var stitching_price;
  String? submit_measurement;
  String? designimageurl;
  var shopid;
  var shoptype;
  CodDateforshopmaterial({Key? key,this.designimageurl,this.type,this.uid,this.category,
    this.shopid,this.shoptype,
    this.neckdesign,this.wristdesign,this.designcollar,this.phone,this.name,this.fabrictype,this.material_price,this.samplegarment_pickuppincode,this.samplegarment_pickuplocation,this.samplegarment_pickupaddress,this.submit_measurement,this.stitching_price}) : super(key: key);

  @override
  _CodDateforshopmaterialState createState() => _CodDateforshopmaterialState();
}

class _CodDateforshopmaterialState extends State<CodDateforshopmaterial> {
  DateTime date=DateTime(2022,09,8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFAD4D4),),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Center(
                  child: Container(

                    margin: EdgeInsets.all(20),

                    height: 100,

                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(


                      child:Text("Select preferred shop material payment date",style: TextStyle(color:Color(0xffFAD4D4),fontWeight:FontWeight.w600,fontSize:18),),
                      onPressed: ()async{
                        DateTime? newDate=await showDatePicker(context: context, initialDate: date, firstDate: DateTime(1900), lastDate: DateTime(2100));
                        if (newDate==null)
                          return;
                        setState(()=>date=newDate);
                      },

                    ),

                  ),
                ),


                Text("${date.year}/${date.month}/${date.day}",
                  style:TextStyle(fontSize: 32,color: Colors.black),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 200.0,bottom: 100),
                  child: Container(
                    color: Color(0xffef9f9f),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StitchingPayment(
                        cashbyhand_material_date:date.toString(),
                        uid:widget.uid,
                        name:widget.name,
                        phone:widget.phone,
                        samplegarment_pickupaddress:widget.samplegarment_pickupaddress,
                        samplegarment_pickuplocation:widget.samplegarment_pickuplocation,
                        samplegarment_pickuppincode:widget.samplegarment_pickuppincode,
                        fabrictype:widget.fabrictype,
                        material_price:widget.material_price,
                        neckdesign: widget.neckdesign,
                        wristdesign:widget.wristdesign,
                      designcollar: widget.designcollar,
                        designimageurl:widget.designimageurl,
                      category: widget.category,
                      submit_measurement:widget.submit_measurement,
                        stitching_price:widget.stitching_price,
                        type: widget.type,
                        shoptype: widget.shoptype,
                        shopid: widget.shopid,

                      )));
                    },
                      child: Text("OK",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w500,fontSize:18,),
                      ),


                    ),
                  ),
                      ),
                    ],
                  ),

                ),



            ),
          ),


    );
  }
}
