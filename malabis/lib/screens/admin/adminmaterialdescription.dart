import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AdminmaterialDescription extends StatefulWidget {
  const AdminmaterialDescription({Key? key}) : super(key: key);

  @override
  _AdminmaterialDescriptionState createState() => _AdminmaterialDescriptionState();
}

class _AdminmaterialDescriptionState extends State<AdminmaterialDescription> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffEF9F9F),),
      body: ListView(
        children: [
          Padding(
            padding:EdgeInsets.all(16),

            child: Image.asset("assets/images/shirtm1.jpg"),


          ),
          Arc(),
        ],
      ),
    );
  }
}
class Arc extends StatelessWidget {


   Arc({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

     height: 30,


      child:Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 50,bottom: 20),
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text("Shirt Material",style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.bold),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Text("Description",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text("Material",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)
                        ,),
                      SizedBox(width: 10,),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,

                              ),
                              ],
                            ),
                            child: CircleAvatar(child: Text("1m")),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,

                              ),
                              ],
                            ),
                            child: CircleAvatar(child: Text("2m")),
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 8,

                              ),
                              ],
                            ),
                            child: CircleAvatar(child: Text("3m")),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("\$200/meter",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold,color: Colors.black ),),

                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),

          )

      ),

    );
  }
}



