import 'package:flutter/material.dart';

import 'package:malabis/models/wristwomen.dart';



import 'designcollarwomen.dart';
import 'designneckwomen.dart';
class WristcuffStyle extends StatefulWidget {

  String? neckdesign;
  var uid;
  var name;
  var phone;
  String? category;
  var stitching_price;
  String?type;
  String? designimageurl;
var shopid;
var shoptype;


  WristcuffStyle({Key? key,this.designimageurl,this.neckdesign,this.type,this.category,this.uid,this.phone,this.name,this.stitching_price,this.shopid,this.shoptype}) : super(key: key);

  @override
  _WristcuffStyleState createState() => _WristcuffStyleState();
}

class _WristcuffStyleState extends State<WristcuffStyle> {
  String? wristStyle;
  int? selectedindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffed872d),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top
            : 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 10),
                child: Text("Choose your Design",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
              ),
              SizedBox(height: 20,),
              Text("Wrist Cuff Style",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),),
              SizedBox(
                height: 40,
              ),
              Container(

                height: 400,
                width: 200,

                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: wristcuffStyles.length,
                    itemBuilder: (context,int index){

                      return
                        InkWell(
                          onTap: (){
                            wristStyle=_selectStyle(index,widget.type.toString());
                            print(wristStyle);
                          },
                      child: Container(
                      height:222,
                      width: 252,
                      color: selectedindex==index?Color(0xffed872d):null,
                      child: Container(




                            margin: EdgeInsets.only(right: 5,),
                            height:300,
                            width: 250,

                            child: Center(
                              child: Stack(

                                children: [

                                  Image.asset(wristcuffStyles[index].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                        );

                    }

                ),


              ),

              Container(
                margin: EdgeInsets.all(8),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [




                    GestureDetector(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CollarstyleWomen(
                        uid:widget.uid,
                        name:widget.name,
                        phone:widget.phone,
                        wristdesign:wristStyle,
                        neckdesign:widget.neckdesign,
                        stitching_price:widget.stitching_price,
                        category: widget.category,
                        type: widget.type,
                        designimageurl:"not set",
                        shoptype: widget.shoptype,
                        shopid: widget.shopid,


                      )));
                    },child: Padding(
                      padding: const EdgeInsets.only(left:228.0),
                      child: Container(
                          height: 60,
                          width: 100,
                          color: Colors.deepOrange,

                          child: Center(child: Text("Next",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))),
                    )),
                  ],),

              ),
            ],
          ),
        ),
      ),
    );
  }
  String _selectStyle(int index, String type){
    if(widget.type=="women" || widget.type=="girls"){
      if(index==0 ){

        setState(() {
          selectedindex=index;
        });

        return "wrist1";

      }
      if(index==1){
        setState(() {
          selectedindex=index;
        });
        return "wrist2";

      }
      if(index==2){
        setState(() {
          selectedindex=index;
        });
        return "wrist3";

      }
      if(index==3){
        setState(() {
          selectedindex=index;
        });
        return "wrist4";
      }
    }
    return "null";
  }
}

