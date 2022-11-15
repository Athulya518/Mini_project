import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/adminmaterialdescription.dart';

import '../../models/materialsmennboys.dart';
import '../../models/materialswomenngirls.dart';
class AdminMaterials extends StatefulWidget {
  const AdminMaterials({Key? key}) : super(key: key);

  @override
  _AdminMaterialsState createState() => _AdminMaterialsState();
}

class _AdminMaterialsState extends State<AdminMaterials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffef9f9f),
      ),


      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,

          children: [





            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Center(child: Text("Material for Stitching",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18))),
            ),



            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Men",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),

                ],
              ),
            ),

            Container(
              color: Color(0xffef9f9f),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: materialsMennboys.length,
                  itemBuilder: (context,int index){

                    return InkWell(
                      onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminmaterialDescription(




                        )));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5,),
                        height: 250,
                        width: 200,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Image.asset(materialsMennboys[index].image),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(

                                  height: 45,
                                  width: 200,
                                  color: Colors.black54,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child:Text("Price: RS. ${materialsMennboys[index].price}/meter",style: TextStyle(color: Colors.white),)
                                      ),
                                    ],
                                  )),
                            ),

                          ],
                        ),
                      ),
                    );

                  }

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,top: 40),
              child: Text("Women",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
            ),

            Container(
              color: Color(0xffef9f9f),
              height: 250,
              margin: EdgeInsets.only(left: 20,top: 10),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: materialsWomenngirls.length,
                  itemBuilder: (context,int index){

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminmaterialDescription(



                        )));
                      },
                      child: Container(

                        margin: EdgeInsets.only(right: 5,),
                        height: 250,
                        width: 200,
                        color: Colors.white,
                        child: Stack(
                          children: [
                            Image.asset(materialsWomenngirls[index].image),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(

                                  height: 45,
                                  width: 200,
                                  color: Colors.black54,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child:Text("Price: RS. ${materialsWomenngirls[index].price}/meter",style: TextStyle(color: Colors.white),)
                                      ),

                                    ],
                                  )),
                            ),

                          ],
                        ),
                      ),
                    );

                  }

              ),
            ),
            SizedBox(height: 60,)
          ],
        ),
      ),

    );
  }
}
