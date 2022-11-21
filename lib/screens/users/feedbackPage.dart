import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  String?uid;
FeedBackPage({Key? key,this.uid}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {


  TextEditingController titleController =TextEditingController();
  TextEditingController subController =TextEditingController();


  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Feedback "),
      ),

      body: Center(
        child: Card(
          child: Container(
            height: 300,
            color: Colors.white60,
            padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Text("Feedback Page"),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: titleController,
                  validator: (value){

                    if(value!.isEmpty){

                      return "Enter a title";
                    }
                  },
                    decoration: InputDecoration(
                      hintText: "Subject",

                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()

                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller:subController ,
                    validator: (value){

                      if(value!.isEmpty){

                        return "Enter a message";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Message",

                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder()

                    ),
                  ),
                  SizedBox(height: 20),
                  
                  InkWell(

                    onTap: (){

                      if(_formkey.currentState!.validate()){


                        FirebaseFirestore.instance.collection('feedback').doc(widget.uid).set(
                            {
                              'shopid':widget.uid,
                              'title':titleController.text,
                              'message':subController.text
                            }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submited"))));
                      }
                    },
                    child: Container(

                      height: 45,
                      width: 250,

                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
