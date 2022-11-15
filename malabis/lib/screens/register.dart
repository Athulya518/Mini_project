import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malabis/shop/register.dart';

import '../widgets/appbutton.dart';
import '../widgets/apptext.dart';
import '../widgets/colors.dart';
import 'loginscreen.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmpasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(40)),
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
                    padding: const EdgeInsets.all(15.0),
                    child: AppText(
                      text: "Register",
                      fw: FontWeight.bold,
                      color: Color(0xff00147E),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          ),
                      child: TextFormField(validator: (value) {
                        if (value!.length != 10 ||
                            num.tryParse(value) == null) {
                          return 'Phone Number should contains 10 digits';
                        } else {
                          return null;
                        }
                      },
                        keyboardType: TextInputType.number,
                        controller: phoneController,

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

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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

                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


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
                          'usertype':'user',
                          'status':1,
                        }).then((value) =>FirebaseFirestore.instance.collection('user').doc(user.user!.uid).set({
                          'uid':user.user!.uid,

                          'email':emailController.text,
                         'phone':phoneController.text,
                          'name':nameController.text,
                          
                          
                          'status':1,
                        }) )).then((value) => showsnackbar('Registered'));

                      }

                    },
                    // shape: RoundedRectangleBorder(
                    //     side: BorderSide(
                    //       color: Colors.black,
                    //
                    //     ),
                    //     borderRadius: BorderRadius.circular(50)
                    // ),
                      child: Container(
                        child: AppButton(
                          color: btncolor,
                          text: "Register",
                          height: 50,
                          width: 150,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                          fontSize: 18,
                        ),
                      )





                  ),
                  SizedBox(height: 20,),
                  AppText(
                    text: "Already Have an Account",
                    fw: FontWeight.w400,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Container(
                      height: 60,
                      width: 100,
                      child: Center(
                        child: AppText(
                          text: "Login",
                          fw: FontWeight.bold,
                          color: Color(0xff00147E),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShopRegister()));
                    },
                    child: Container(
                      height: 60,
                      width: 200,
                      child: Center(
                        child: AppText(
                          text: " Register as shop",
                          fw: FontWeight.bold,
                          color: Color(0xff00147E),
                          size: 20,
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
