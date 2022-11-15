import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:malabis/screens/measurement.dart';
import 'package:malabis/screens/users/AlterFlow/addresspickuppage.dart';
import 'package:malabis/widgets/colors.dart';

import '../widgets/apptext.dart';
import 'users/AlterFlow/measurementPage.dart';

class KnowDesign extends StatefulWidget {
  var uid;
  var name;
  var phone;
  var stitching_price;
  String? category;
  String? type;
  var shopid;
  var shoptype;

  KnowDesign(
      {Key? key,
      this.category,
      this.type,
      this.stitching_price,
      this.phone,
      this.name,
      this.uid,this.shopid,this.shoptype})
      : super(key: key);

  @override
  _KnowDesignState createState() => _KnowDesignState();
}

class _KnowDesignState extends State<KnowDesign> {
  String? imageurl;
  String? fburl;
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    printData();
  }

  printData() {
    print(widget.type);
    print(widget.category);
    print(widget.uid);
    print(widget.name);
    print(widget.phone);
    print(widget.stitching_price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: "Upload Design ",
          color: Colors.white,
        ),
        backgroundColor: appbarcolor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                                    uid: widget.uid,
                                    name: widget.name,
                                    phone: widget.phone,
                                    stitching_price: widget.stitching_price,
                                    category: widget.category,
                                    type: widget.type,
                                    designimageurl: imageurl,
                                shopid: widget.shopid,
                                    shoptype: widget.shoptype,
                                    neckdesign: "not set",
                                    wristdesign: "not set",
                                    designcollar: "not set",
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
        });
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
