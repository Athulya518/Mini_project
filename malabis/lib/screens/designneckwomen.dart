import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/models/collarmen.dart';
import 'package:malabis/screens/customizeorderPage.dart';
import 'package:malabis/screens/designwristwomen.dart';
import 'package:malabis/screens/measurement.dart';
import 'package:malabis/screens/users/AlterFlow/addresspickuppage.dart';

import '../models/neckwomen.dart';
import '../widgets/appbutton.dart';
class DesignMyselfPage extends StatefulWidget {

  String? category;
  var uid;
  var name;
  var phone;
  String?type;
  var stitching_price;
 var shopid;
 var shoptype;

   DesignMyselfPage({Key? key,this.category,this.uid,this.type,this.name,this.phone,this.stitching_price,this.shoptype,this.shopid}) : super(key: key);

  @override
  _DesignMyselfPageState createState() => _DesignMyselfPageState();
}

class _DesignMyselfPageState extends State<DesignMyselfPage> {
  String? collarStyle;

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
             widget.type=="women" || widget.type=="girls"?
             Text("Neck Style",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),):
             Text("Collar Style",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),),
              SizedBox(
                height: 40,
              ),
              Container(


                height: 400,

                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: neckStyle.length,
                    itemBuilder: (context,int index){

    return
    InkWell(
      onTap: (){

        collarStyle=_selectStyle(index,widget.type.toString());
        print(collarStyle);


      },
      child: Container(
        height:222,
        width: 252,
        color: selectedindex==index?Color(0xffed872d):null,
        child: Container(



        margin: EdgeInsets.only(right: 5,),
        height:220,
        width: 250,

        child: Stack(

        children: [

        widget.type=="women"?Center(child: Image.asset(neckStyle[index].image)):Center(child: Image.asset(collarmenStyle[index].image)),


        ],



        ),

        ),
      ),
    );

    }

                      ),


                      ),
                SizedBox(height: 30,),

                Container(
                  margin: EdgeInsets.all(8),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [




                    GestureDetector(


                        onTap: (){

                      widget.type!="men"&&widget.type!="boys"?

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WristcuffStyle(
                        neckdesign:collarStyle,
                        uid:widget.uid,
                        name:widget.name,
                        phone:widget.phone,
                        category: widget.category,
                        stitching_price:widget.stitching_price,
                        type: widget.type,
                        designimageurl:"not set",
                        shoptype: widget.shoptype,
                        shopid: widget.shopid,

                      ))):Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressSelectionPage(

                        uid: widget.uid,
                        name:widget.name,
                        phone:widget.phone,
                        neckdesign:collarStyle,
                        category: widget.category,
                        stitching_price:widget.stitching_price,
                        type: widget.type,
                        shoptype: widget.shoptype,
                        shopid: widget.shopid,
                        designimageurl:"not set",



                      )));
                    }, child: Padding(
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

    if(widget.type=="men" || widget.type=="boys"){
      if(index==0 ){

        setState(() {
          selectedindex=index;
        });

        return "Bandcollar";

      }
      if(index==1 ){
        setState(() {
          selectedindex=index;
        });
        return "Button-downcollar";

      }
      if(index==2 ){
        setState(() {
          selectedindex=index;
        });
        return "Spreadcollar";

      }
      if(index==3 ){
        setState(() {
          selectedindex=index;
        });
        return "Straightpointcollar";

      }
      if(index==4 ){
        setState(() {
          selectedindex=index;
        });
        return "Wingcollar";

      }



    }

    else if(widget.type=="women" || widget.type=="girls"){
      if(index==0 ){
        setState(() {
          selectedindex=index;
        });
        return "neck1";

      }
      if(index==1 ){
        setState(() {
          selectedindex=index;
        });
        return "neck2";

      }
      if(index==2 ){
        setState(() {
          selectedindex=index;
        });
        return "neck3";

      }
      if(index==3 ){
        setState(() {
          selectedindex=index;
        });
        return "neck4";

      }
      if(index==4 ){
        setState(() {
          selectedindex=index;
        });
        return "neck5";

      }
    }


    return "null";
  }
}
