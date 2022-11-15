import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';
class RegisterDeliveryBoy extends StatefulWidget {
  const RegisterDeliveryBoy({Key? key}) : super(key: key);

  @override
  _RegisterDeliveryBoyState createState() => _RegisterDeliveryBoyState();
}

class _RegisterDeliveryBoyState extends State<RegisterDeliveryBoy> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAD4D4),

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffEF9F9F), borderRadius: BorderRadius.circular(40)),
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
                    padding: const EdgeInsets.only(top: 50.0,left: 15,right: 15,bottom: 15),
                    child: AppText(
                      text: "Register",
                      fw: FontWeight.bold,
                      color: Color(0xff00147E),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0,left: 8,right: 8,bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
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
                          hintText: "Delivery Boy Name",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
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
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                      ),
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
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

                          focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password should contains atleast 8 characters';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Password",

                          focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,left: 8,right: 8,bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: confirmpasswordController,
                        validator: (value) {
                          if (passwordController.text!=value) {
                            return 'Password mismatch';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          hintText: "Confirm Password",

                          focusedBorder: OutlineInputBorder(

                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 50,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,



                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((user) =>
                            FirebaseFirestore.instance.collection('login').doc(user.user!.uid).set({
                              'uid':user.user!.uid,

                              'email':emailController.text,
                              'password':passwordController.text,
                              'usertype':'dboy',
                              'status':1,
                            }).then((value) =>FirebaseFirestore.instance.collection('dboy').doc(user.user!.uid).set({
                              'uid':user.user!.uid,

                              'email':emailController.text,
                              'phone':phoneController.text,
                              'name':nameController.text,

                              'dboyid':'DBY-${nameController.text}',


                              'status':1,
                            }) )).then((value) => showsnackbar('Registered'));

                      }


                    },




                    child: Padding(
                      padding: const EdgeInsets.only(bottom:50.0,),
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffFAD4D4)),
                        child: Center(
                          child: Text("Register",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,color: Colors.black
                            ),
                          ),
                        ),
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
