

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../widgets/appbutton.dart';
import '../../../widgets/apptext.dart';
import '../../../widgets/colors.dart';
import '../../materialoption.dart';
import 'addresspickuppage.dart';
class MeasurementPage extends StatefulWidget {
  var uid;
  var name;
  var phone;
  var stitching_price;
  String? category;
  String? type;
  String? designimageurl;
  String? neckdesign;
  String? wristdesign;
  String? designcollar;
   MeasurementPage({Key? key,this.wristdesign,this.neckdesign,this.designimageurl,this.uid,this.name,this.phone,this.stitching_price,this.designcollar,this.type,this.category}) : super(key: key);

  @override
  _MeasurementPageState createState() => _MeasurementPageState();
}

class _MeasurementPageState extends State<MeasurementPage> {
  final _spickupKey = GlobalKey<FormState>();
  final _subKey = GlobalKey<FormState>();

//for sample garment pickupaddress
  TextEditingController _saddrTextcontroller = TextEditingController();
  TextEditingController _slocTextcontroller = TextEditingController();
  TextEditingController _spinTextcontroller = TextEditingController();
  TextEditingController _spickupdateTextcontroller =
  TextEditingController(); //for pickupdate

  //for submit measurement

  TextEditingController _submitTextcontroller = TextEditingController();



  String? callorsubmitorsample = "Call for Measurement";

  //pickup date
  DateTime date = DateTime(2022, 08, 24);

  String? imageurl;
  String? fburl;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          title: Text("Measurement Details"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text("Select Measurement Option"),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: "Call for Measurement",
                                  groupValue: callorsubmitorsample,
                                  onChanged: (String? value) {
                                    setState(() {
                                      callorsubmitorsample = value;
                                    });
                                  }),
                              Text("Call for Measurement"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: "Submit Measurement",
                                  groupValue: callorsubmitorsample,
                                  onChanged: (String? value) {
                                    setState(() {
                                      callorsubmitorsample = value;
                                    });
                                  }),
                              Text("Submit Measurement ")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                  value: "Sample Garment",
                                  groupValue: callorsubmitorsample,
                                  onChanged: (String? value) {
                                    setState(() {
                                      callorsubmitorsample = value;
                                    });
                                  }),
                              Text("Sample Garment")
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              callorsubmitorsample == "Sample Garment"
                  ? SliverToBoxAdapter(
                child: AppText(
                  text: "Pickup Address",
                  size: 18,
                  fw: FontWeight.w700,
                  txtalign: TextAlign.left,
                ),
              )
                  : SliverToBoxAdapter(
                child: SizedBox.shrink(),
              ),
              callorsubmitorsample == "Sample Garment"
                  ? SliverToBoxAdapter(
                child: Form(
                  key: _spickupKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _saddrTextcontroller,
                        decoration: InputDecoration(hintText: "Address"),
                      ),
                      TextFormField(
                        controller: _slocTextcontroller,
                        decoration: InputDecoration(hintText: "Location"),
                      ),
                      TextFormField(
                        controller: _spinTextcontroller,
                        decoration: InputDecoration(hintText: "Pin"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 100,
                              child: TextFormField(
                                controller: _spickupdateTextcontroller,
                                readOnly: true,
                                decoration: InputDecoration(
                                    hintText: "Pickup Date"),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () async {
                                DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100));
                                if (newDate == null) return;
                                setState(() {
                                  setState(() {
                                    date = newDate;
                                    _spickupdateTextcontroller.text =
                                        date.toString();
                                  });
                                });
                              },
                              child: Icon(Icons.date_range)),
                        ],
                      ),

                    ],
                  ),
                ),
              )
              :SliverToBoxAdapter(
               child: SingleChildScrollView(
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Submit Measurement",
                           style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w600,
                               fontSize: 18)),
                       SizedBox(
                         height: 20,
                       ),
                       Center(
                         child: Form(
                           key: _subKey,
                           child: SingleChildScrollView(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 20,top: 30),
                                   child: Text("Submit your Measurement",style:TextStyle(color:Colors.black,fontWeight:FontWeight.w600,fontSize:18)),
                                 ),
                                 SizedBox(height: 50,),

                                 Padding(
                                   padding: const EdgeInsets.only(top: 50.0,left: 10,right: 10),
                                   child: TextFormField(
                                     controller: _submitTextcontroller,
                                     validator: (value) {
                                       if (value!.isEmpty || value == "") {
                                         return "Enter a Valid measurement";
                                       }
                                     },
                                     minLines: 5,
                                     maxLines: 10,
                                     keyboardType: TextInputType.multiline,
                                     decoration: InputDecoration(
                                         hintText: "Enter Custom Measurement",
                                         hintStyle: TextStyle(
                                           color: Colors.grey,

                                         ),
                                         border: OutlineInputBorder(
                                           borderRadius: BorderRadius.all(Radius.circular(25),),


                                         )
                                     ),
                                   ),
                                 ),
                                 SizedBox(
                                   height: 60,
                                 ),
                                 ElevatedButton(onPressed: (){
                                   if(_subKey.currentState!.validate()){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) =>MaterialOption(

                                       // uid: widget.uid,
                                       // name:widget.name,
                                       // phone:widget.phone,
                                       // neckdesign:widget.neckdesign,
                                       // wristdesign:widget.wristdesign,
                                       // designcollar:widget.designcollar,
                                       // designimageurl:widget.designimageurl,
                                       // submit_measurement:_mTextcontroller.text,
                                       // category: widget.category,
                                       // stitching_price:widget.stitching_price,
                                       // type: widget.type,
                                     )));
                                   }

                                   setState(() {
                                     _submitTextcontroller.notifyListeners();
                                   });

                                 }, child: Text("Submit"),

                                 ),

                                 SizedBox(height: 50,),



                               ],
                             ),
                           ),
                         ),
                       ),
                     ]

                 ),
               ),
              ),


         SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Call for Measurement",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        color: Colors.black26,
                        height: 300,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: GestureDetector(
                          onTap: () {
                            showimage();
                          },
                          child: Center(
                            child: Container(
                              height: 350,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.all(20),
                              color: Colors.transparent,
                              child: _image != null
                                  ? ClipRRect(
                                  child: Image.file(
                                    File(_image!.path),
                                    fit: BoxFit.cover,
                                  ))
                                  : Center(
                                child: Container(
                                  child: Icon(
                                    Icons.upload_file,
                                    size: 70,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: Container(
                          width: 200,
                          height: 45,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(btncolor)),
                              onPressed: () {
                                print(_image!.path.toString());

                                String fileName = DateTime.now().toString();

                                var ref = FirebaseStorage.instance
                                    .ref()
                                    .child("designs/$fileName");

                                UploadTask uploadTask = ref.putFile(File(_image!.path));

                                uploadTask.then((res) async {
                                  imageurl = (await ref.getDownloadURL()).toString();

                                  print(imageurl);
                                }).then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddressSelectionPage(
                                            // uid: widget.uid,
                                            // name: widget.name,
                                            // phone: widget.phone,
                                            // stitching_price: widget.stitching_price,
                                            // category: widget.category,
                                            // type: widget.type,
                                            // designimageurl: imageurl,
                                            // neckdesign: "not set",
                                            // wristdesign: "not set",
                                            // designcollar: "not set",
                                          )));

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>MeasurementOptionPage(
                                  //
                                  //   uid: widget.uid,
                                  //
                                  //   name:widget.name,
                                  //
                                  //   phone:widget.phone,
                                  //
                                  //   stitching_price:widget.stitching_price,
                                  //
                                  //   category: widget.category,
                                  //
                                  //   type: widget.type,
                                  //
                                  //   designimageurl: imageurl,
                                  //
                                  //   neckdesign: "not set",
                                  //   wristdesign: "not set",
                                  //   designcollar: "not set",
                                  //
                                  //
                                  //
                                  // )));
                                });
                              },
                              child: AppText(text:"Next",color: Colors.white,size: 16,)),
                        ),
                      )
                    ],
    ),
    ),
              ),


      ],
    ),
    ),
    );
  }

  showimage() {
    showModalBottomSheet(
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.pink,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _imagefromcamera();
                        },
                        icon: Icon(Icons.camera_alt_rounded,
                            color: Colors.white),
                        iconSize: 20,
                        splashRadius: 40,
                      ),
                    ),
                    Text("Camera"),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.purple,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _imagefromgallery();
                        },
                        icon: Icon(Icons.photo),
                        color: Colors.white,
                        iconSize: 20,
                        splashRadius: 40,
                      ),
                    ),
                    Text("Gallery"),
                  ],
                ),
              ],
            ),
          ),
        );
      },


              // SliverToBoxAdapter(
              //   child: SizedBox(
              //     height: 20,
              //   ),
              // ),


                    // child: AppButton(
                    //   height: 45,
                    //   width: 250,
                    //   color: btncolor,
                    //   textColor: Colors.white,
                    //   text: "Proceed to Check Out",
                    // ),


    );
  }
  _imagefromgallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _imagefromcamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = photo;
    });
  }
}
