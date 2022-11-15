import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';


class ProfilePage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
 ProfilePage({Key? key,this.uid, required this.name, required this.email, required this.phone }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  TextEditingController phoneController=TextEditingController();
  void initState() {
    nameController.text=widget.name;
    phoneController.text=widget.phone;
    emailController.text=widget.email;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepOrange.shade200, borderRadius: BorderRadius.circular(40)),
          width: 300,
          height: 700,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right:15,bottom:15,top:40),
                    child: AppText(
                      text: "My Account",
                      fw: FontWeight.bold,
                      color: Color(0xff00147E),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter a Valid Name";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          hintText: "Name",

                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: phoneController,
                        validator: (value) {
                          if (value!.length != 10 ||
                              num.tryParse(value) == null) {
                            return 'Phone Number should contains 10 digits';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          ),
                          hintText: "Phone No.",

                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: TextFormField(
                        controller: emailController,
                        validator: (value) {
                          String pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value!)) {
                            return 'Email format is invalid';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          hintText: "Email id",

                        ),
                      ),
                    ),
                  ),

SizedBox(height: 30,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,



                    onPressed: (){


                      if(_formKey.currentState!.validate()){
                        FirebaseFirestore.instance.collection('user').doc(widget.uid).update({



                          'phone':phoneController.text,
                          'name':nameController.text,


                          'status':1,
                        }).then((value) => showsnackbar("Updated"));

                      }

                    },

                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text("Edit",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,color: Colors.white
                          ),),
                      ),
                    ),





                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void showsnackbar(var msg)
  {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg)
        ));
  }

}
