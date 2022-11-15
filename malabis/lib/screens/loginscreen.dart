import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/admin/admin_home.dart';
import 'package:malabis/screens/bottomNavigationPage.dart';
import 'package:malabis/screens/deliveryboy/deliveryboyhome.dart';

import 'package:malabis/screens/register.dart';
import 'package:malabis/screens/tailor/tailorhome.dart';
import 'package:malabis/screens/users/homepage_user.dart';
import 'package:malabis/shop/homepage.dart';

import '../widgets/appbutton.dart';
import '../widgets/apptext.dart';
import '../widgets/colors.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffEF9F9F),
      body: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
          decoration: BoxDecoration(
              color: backcolor, borderRadius: BorderRadius.circular(22)),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.85,
          child: Card(
            elevation: 5.0,
            child: Center(
              child: CustomScrollView(




                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(height: 20,),
                  ),


                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/logo.png",scale: 3,),
                        AppText(text: "Malabis",)
                      ],
                    ),
                  ),


                  SliverToBoxAdapter(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: AppText(
                              text: "Welcome Back",
                              size: 28,
                              fw: FontWeight.bold,
                              color: Color(0xff00147E),
                            ),
                          ),
                          Container(
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
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
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
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: BorderSide(color: Colors.teal)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          GestureDetector(
                              onTap: () {
                                if (emailController.text == "admin@gmail.com" &&
                                    passwordController.text == "12345678") {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AdminHomepage()),
                                  );
                                } else {
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((user) => FirebaseFirestore.instance
                                              .collection('login')
                                              .doc(user.user!.uid)
                                              .get()
                                              .then((value) {

                                                print(user.user!.uid);
                                            if (value.data()!['usertype'] ==
                                                    'user' &&
                                                value.data()!['status'] == 1) {
                                              FirebaseFirestore.instance
                                                  .collection('user')
                                                  .doc(user.user!.uid)
                                                  .get()
                                                  .then(
                                                      (value) => Navigator
                                                              .pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        HomePageUser(
                                                                          uid: value
                                                                              .data()!['uid'],
                                                                          name:
                                                                              value.data()!['name'],
                                                                          email:
                                                                              value.data()!['email'],
                                                                          phone:
                                                                              value.data()!['phone'],

                                                                        )),
                                                          ));
                                            } else if (value
                                                        .data()!['usertype'] ==
                                                    'tailor' &&
                                                value.data()!['status'] == 1) {

                                              FirebaseFirestore.instance.collection('tailor').doc(user.user!.uid).get().then((value) {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TailorHomepage(
                                                            name:   value.data()!['name'],
                                                            phone:   value.data()!['phone'],

                                                            email:   value.data()!['email'],
                                                            uid:   value.data()!['uid'],
                                                            tailorid:  value.data()!['tailorid'],

                                                          )),
                                                );

                                              });


                                            } else if (value
                                                        .data()!['usertype'] ==
                                                    'dboy' &&
                                                value.data()!['status'] == 1) {

                                              FirebaseFirestore.instance.collection('dboy').doc(user.user!.uid).get().then((value) {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DeliveryboyHomepage(

                                                            name:   value.data()!['name'],
                                                            phone:   value.data()!['phone'],
                                                            email:   value.data()!['email'],
                                                            uid:   value.data()!['uid'],
                                                           dboyid:  value.data()!['dboyid'],

                                                          )),
                                                );

                                              });


                                            }else if(value
                                                .data()!['usertype'] ==
                                                'shop' &&
                                                value.data()!['status'] == 1){
                                              FirebaseFirestore.instance.collection('shop').doc(user.user!.uid).get().then((value) {

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ShopHomePage(

                                                            name:   value.data()!['shopname'],
                                                            phone:   value.data()!['shopphone'],
                                                            email:   value.data()!['shopemail'],
                                                            uid:   value.data()!['uid'],
                                                            shopid:  value.data()!['shopid'],
                                                            type: value.data()!['type'],




                                                          )),
                                                );

                                              });
                                            }
                                          }));
                                }
                              },
                              child: Container(
                                child: AppButton(
                                  color: btncolor,
                                  text: "Login",
                                  height: 50,
                                  width: 150,
                                  fontWeight: FontWeight.bold,
                                  textColor: Colors.white,
                                  fontSize: 18,
                                ),
                              )
                              ),
                          SizedBox(
                           height: 30,
                          ),
                          AppText(
                            text: "Don't Have an Account",
                            color: Colors.black87,
                          ),
                          SizedBox(
                           height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: AppText(
                              text: "Register",
                              fw: FontWeight.bold,
                              size: 18,
                              color: Color(0xff00147E),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
