import 'package:flutter/material.dart';

import '../models/collarmen.dart';
import 'customizeorderPage.dart';
import 'measurement.dart';
class DesignmyselfMen extends StatefulWidget {

  String? category;
  var uid;
  var name;
  var phone;
  String?type;
  var stitching_price;

   DesignmyselfMen({Key? key,this.category,this.type,this.stitching_price,this.phone,this.name,this.uid}) : super(key: key);

  @override
  _DesignmyselfMenState createState() => _DesignmyselfMenState();
}

class _DesignmyselfMenState extends State<DesignmyselfMen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Color(0xffFAD4D4),
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
              Text("Collar Style men",style: TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18),),
              SizedBox(
                height: 40,
              ),
              Container(

                height: 400,

                margin: EdgeInsets.only(left: 20,top: 10),

                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: collarmenStyle.length,
                    itemBuilder: (context,int index){

                      return
                        Container(



                          margin: EdgeInsets.only(right: 5,),
                          height:220,
                          width: 250,

                          child: Stack(

                            children: [

                              Image.asset(collarmenStyle[index].image),


                            ],



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




                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MeasurementOptionPage(

                        uid: widget.uid,
                        name:widget.name,
                        phone:widget.phone,
                        category: widget.category,
                        stitching_price:widget.stitching_price,
                        type: widget.type,

                      )));
                    }, child: Text("Next")),
                  ],),

              ),












            ],
          ),
        ),
      ),);
  }
}
