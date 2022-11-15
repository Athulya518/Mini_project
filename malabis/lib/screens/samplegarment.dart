import 'package:flutter/material.dart';
import 'package:malabis/screens/materialoption.dart';
import 'package:malabis/screens/pickaddress.dart';
class SampleGarment extends StatefulWidget {
String? designimageurl;
  String? designcollar;
  String? category;
var stitching_price;
  String? type;
var uid;
var name;
var phone;
  String?neckdesign;
  String? wristdesign;
    SampleGarment({Key? key,this.designimageurl,this.phone,this.name,this.uid,this.category,this.type, this.neckdesign,this.designcollar,this.wristdesign,this.stitching_price}) : super(key: key);

  @override
  _SampleGarmentState createState() => _SampleGarmentState();
}

class _SampleGarmentState extends State<SampleGarment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFAD4D4),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 80,top: 30),
            child: Text("My Sample Garment",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 150.0,left: 80),
            child: ElevatedButton(onPressed: (){



            }, child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PickAddress(

                  uid: widget.uid,
                  name:widget.name,
                  phone:widget.phone,
                  neckdesign:widget.neckdesign,
                  wristdesign:widget.wristdesign,
                  designcollar:widget.designcollar,
                  designimageurl:widget.designimageurl,
                  category: widget.category,
                  stitching_price:widget.stitching_price,
                  type: widget.type,
                )));
              },
              child: Container(

                  margin: EdgeInsets.all(10),

                  child: Text("Pick at Home")),
            )),
          ),
        ],
      )
    );
  }
}
