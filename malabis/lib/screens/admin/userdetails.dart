import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../widgets/apptext.dart';
class UserDetails extends StatefulWidget {
  var uid;
  String? name;
  String? phone;
  String? type;
  UserDetails({Key? key,this.phone,this.name,this.uid,this.type}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final _formKey = GlobalKey<FormState>();
  String? dropdownvalue;
  var categories = ["Men", "Women", "Boys", "Girls"];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  @override
  void initState() {
    nameController.text=widget.name!;
    phoneController.text=widget.phone!;
    dropdownvalue=widget.type;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffEF9F9F),
              borderRadius: BorderRadius.circular(40)),
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
                    padding: const EdgeInsets.only(
                        top: 50.0, left: 15, right: 15, bottom: 15),
                    child: AppText(
                      text: "User Details",
                      fw: FontWeight.bold,
                      color: Color(0xff00147E),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 8, right: 8, bottom: 8),
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
                          hintText: "User Name",
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 10.0, left: 8, right: 8, bottom: 8),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //     ),
                  //     child: DropdownButtonFormField(
                  //       decoration: InputDecoration(
                  //         prefixIcon: Icon(
                  //           Icons.category,
                  //           color: Colors.black,
                  //         ),
                  //         hintText: "Type",
                  //         filled: true,
                  //         fillColor: Colors.white,
                  //         focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.teal)),
                  //       ),
                  //       value: dropdownvalue,
                  //       dropdownColor: Colors.grey,
                  //       elevation: 2,
                  //       icon: Icon(Icons.arrow_drop_down),
                  //       iconSize: 26,
                  //       isExpanded: true,
                  //       items: categories.map((String categories) {
                  //         return DropdownMenuItem(
                  //             value: categories, child: Text(categories));
                  //       }).toList(),
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           dropdownvalue = newValue.toString();
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  //
                  //
                  //
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        //minWidth: double.infinity,

                        height: 60,

                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                            FirebaseFirestore.instance.collection('user').doc(widget.uid).update({

                              'phone':phoneController.text,
                              'name':nameController.text,
                              'type':dropdownvalue,


                            }).then((value) => showsnackbar("Updated"));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 50.0,
                          ),
                          child: Container(
                            height: 50,
                            width: 110,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFAD4D4)),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),

                      MaterialButton(
                        //minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                            FirebaseFirestore.instance.collection('tailor').doc(widget.uid).update({

                              'status':0


                            }).then((value) => showsnackbar("Updated"));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: 50.0,
                          ),
                          child: Container(
                            height: 50,
                            width: 125,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFAD4D4)),
                            child: Center(
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
