import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/loginscreen.dart';
import 'package:malabis/widgets/appbutton.dart';
import 'package:malabis/widgets/apptext.dart';
import 'package:malabis/widgets/colors.dart';
class ShopRegister extends StatefulWidget {
  const ShopRegister({Key? key}) : super(key: key);

  @override
  _ShopRegisterState createState() => _ShopRegisterState();
}

class _ShopRegisterState extends State<ShopRegister> {
  final _formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  var categories = ["Men", "Women", "Boys", "Girls"];
  TextEditingController shopnameController=TextEditingController();
  TextEditingController _imageUrlController=TextEditingController();
  TextEditingController shopidController=TextEditingController();
  TextEditingController shopcategoryController=TextEditingController();
  TextEditingController shoplocController=TextEditingController();
  TextEditingController shopaddressController=TextEditingController();
  TextEditingController pinController=TextEditingController();
  TextEditingController shopemailController=TextEditingController();
  TextEditingController shopphoneController=TextEditingController();
  TextEditingController shoppasswordController=TextEditingController();
  TextEditingController shopconfirmpasswordController=TextEditingController();


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
                        controller: shopnameController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter a Valid Name";
                          }
                        },
                        decoration: InputDecoration(

                          hintText: "Shop Name",

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
                        controller: shopemailController,
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
                        controller: shopphoneController,

                        decoration: InputDecoration(

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
                        controller: shoppasswordController,
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Password should contains atleast 8 characters';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(

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
                        controller: shopconfirmpasswordController,
                        validator: (value) {
                          if (shoppasswordController.text!=value) {
                            return 'Password mismatch';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(

                          hintText: "Confirm Password",

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
                       decoration: InputDecoration(
                         label:Text("Image URL"),
                       ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
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
                        controller: shopidController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter a Valid Id";
                          }
                        },
                        decoration: InputDecoration(

                          hintText: "Shop ID",

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 8, right: 8, bottom: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(

                          hintText: "Type",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal)),
                        ),
                        value: dropdownvalue,
                        dropdownColor: Colors.grey,
                        elevation: 2,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 26,
                        isExpanded: true,
                        items: categories.map((String categories) {
                          return DropdownMenuItem(
                              value: categories, child: Text(categories));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue.toString();
                          });
                        },
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
                        controller: shoplocController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter location";
                          }
                        },
                        decoration: InputDecoration(

                          hintText: "Location",

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
                        controller: shopaddressController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter address";
                          }
                        },
                        decoration: InputDecoration(

                          hintText: "Address",

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
                        controller: pinController,
                        validator: (value) {
                          if (value!.isEmpty || value == "") {
                            return "Enter a Valid pin";
                          }
                        },
                        decoration: InputDecoration(

                          hintText: "PinCode",

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
                          FirebaseAuth.instance.createUserWithEmailAndPassword(email: shopemailController.text, password: shoppasswordController.text).then((user) =>
                              FirebaseFirestore.instance.collection('login').doc(user.user!.uid).set({
                                'uid':user.user!.uid,

                                'email':shopemailController.text,
                                'password':shoppasswordController.text,
                                'usertype':'shop',
                                'status':1,
                              }).then((value) =>FirebaseFirestore.instance.collection('shop').doc(user.user!.uid).set({
                                'uid':user.user!.uid,


                                'email':shopemailController.text,
                                'phone':shopphoneController.text,
                                'name':shopnameController.text,
                                'shopid':shopidController.text,
                                'type':dropdownvalue,


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

