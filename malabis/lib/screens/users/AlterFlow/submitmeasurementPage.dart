import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/materialoption.dart';
import 'package:malabis/screens/measurement.dart';
import 'package:malabis/screens/users/AlterFlow/bookingPage.dart';

import '../../../widgets/colors.dart';

class SubmitMeasurementPage extends StatefulWidget {
  String? designimageurl;
  String? designcollar;
  String? category;
  String? type;
  var uid;
  var name;
  var phone;
  String? neckdesign;
  String? wristdesign;

  var stitching_price;
  var fabrictype;
  var materialprice;
  var totalprice;
  String? delivaddress;
  String? delivlocation;
  String? delivpin;
  String? delivdate;
  String? pickvaddress;
  String? picklocation;
  String? pickvpin;
  String? pickdate;
  String? paymentMode;
  String? pickuporshop;
  String?fabricid;
var shopid;
var shoptype;
  SubmitMeasurementPage(
      {Key? key,
        this.shoptype,
        this.shopid,
        this.fabricid,

        this.pickuporshop,
      this.uid,
      this.category,
      this.type,
      this.wristdesign,
      this.designcollar,
      this.neckdesign,
      this.name,
      this.phone,
      this.stitching_price,
      this.designimageurl,
      this.fabrictype,
      this.paymentMode,
      this.materialprice,
      this.totalprice,
      this.delivaddress,
      this.delivdate,
      this.delivlocation,
      this.delivpin,
      this.pickdate,
      this.picklocation,
      this.pickvaddress,
      this.pickvpin})
      : super(key: key);

  @override
  _SubmitMeasurementPageState createState() => _SubmitMeasurementPageState();
}

class _SubmitMeasurementPageState extends State<SubmitMeasurementPage> {
  final _mKey = GlobalKey<FormState>();

  TextEditingController _mTextcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarcolor,
      ),
      body: Center(
        child: Form(
          key: _mKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //(_Textcontroller.value.text.isEmpty)?Text("Please enter measurement"):Text("submit:${_Textcontroller.value.text}"),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Text("Submit your Measurement",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: 50,
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 10, right: 10),
                  child: TextFormField(
                    controller: _mTextcontroller,
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    if (_mKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookingPage(
                                shoptype: widget.shoptype,
                                shopid: widget.shopid,

                                fabricid: widget.fabricid.toString(),
                                measurement: "not set",
                                pickuporshop: widget.pickuporshop,
                                uid: widget.uid,
                                name: widget.name,
                                phone: widget.phone,
                                fabrictype: widget.fabrictype,
                                materialprice: widget.materialprice,
                                neckdesign: widget.neckdesign,
                                wristdesign: widget.wristdesign,
                                designcollar: widget.designcollar,
                                designimageurl: widget.designimageurl,
                                category: widget.category,
                                stitching_price: widget.stitching_price,
                                type: widget.type,
                                delivaddress: widget.delivaddress,
                                delivdate:
                               widget.delivdate,
                                delivlocation: widget.delivlocation,
                                delivpin:widget.delivpin,
                                paymentMode: widget.paymentMode,
                                pickvaddress: widget.pickvaddress,
                                pickdate: widget.pickdate,
                                picklocation: widget.picklocation,
                                pickvpin: widget.pickvpin,
                                totalprice: widget.totalprice,
                              )
                          ));
                    }

                    setState(() {
                      _mTextcontroller.notifyListeners();
                    });
                  },
                    child:Padding(
                      padding: const EdgeInsets.only(left:228.0),
                      child: Container(
                          height: 60,
                          width: 100,
                          color: Colors.deepOrange,

                          child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))),
                    )
                ),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
