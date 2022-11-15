import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/coddateforshopmaterial.dart';

class PaymentPage extends StatefulWidget {
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
   PaymentPage({Key? key,this.designimageurl,this.type,this.category,this.wristdesign,this.designcollar,this.neckdesign,
   this.uid,this.name,this.phone,this.stitching_price,this.submit_measurement,
     this.shoptype,this.shopid,
     this.fabrictype,this.material_price,this.samplegarment_pickupaddress,this.samplegarment_pickuplocation,this.samplegarment_pickuppincode}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  int value=0;
  final paymentLabels=[
    "Cash at Hand"
  ];
  final paymentIcons=[
    Icons.money_off,
  ];

  initState(){

    print(widget.material_price);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),

      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            HeaderLabel(

              headerText:"Payment for material",
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: ListView.separated(
                  itemCount: paymentLabels.length,

                  itemBuilder: (context,index){
                    return ListTile(
                      leading: Radio(activeColor: Color(0xffEF9F9F),
                        value: index,
                        groupValue:value ,
                        onChanged: (i)=>setState(()=>value),
                      ),
                      title: Text(paymentLabels[index],style: TextStyle(color: Colors.black),
                      ),
                      trailing: Icon(paymentIcons[index],color: Color(0xffEF9F9F),),
                    );
                  },
                  separatorBuilder: (context,index){
                    return Divider();
                  }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:80.0),
              child: TextButton(

                  onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CodDateforshopmaterial(

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
              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.all(20),
                      color: Color(0xffef9f9f),
                      child: Center(child: Text("Price:${widget.material_price}/-",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16),))),
                  Container(
                      height: 50,
                      width: 100,
                      margin: EdgeInsets.all(20),
                      color: Color(0xffef9f9f),
                      child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),))),
                ],
              )),
            )
          ],
        ),
      )
    );
  }
}
class HeaderLabel extends StatelessWidget {
  final String headerText;
   HeaderLabel({Key? key,required this.headerText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10),

    child: Text(headerText,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
    );




  }
}

