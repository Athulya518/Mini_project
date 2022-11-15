import 'package:flutter/material.dart';
import 'package:malabis/models/collarwomen.dart';
import 'package:malabis/screens/designwristwomen.dart';
import 'package:malabis/screens/measurement.dart';
import 'package:malabis/screens/users/AlterFlow/addresspickuppage.dart';

import '../widgets/apptext.dart';
import '../widgets/colors.dart';

class CollarstyleWomen extends StatefulWidget {
  String? wristdesign;
  String? neckdesign;
  var stitching_price;
  var uid;
  var name;
  var phone;
  String? category;
  String? type;
  String? designimageurl;
  var shopid;
  var shoptype;

  CollarstyleWomen(
      {Key? key,
      this.designimageurl,
      this.neckdesign,
      this.category,
      this.type,
      this.wristdesign,
      this.uid,
      this.name,
      this.phone,
      this.stitching_price,
      this.shoptype,
      this.shopid})
      : super(key: key);

  @override
  _CollarstyleWomenState createState() => _CollarstyleWomenState();
}

class _CollarstyleWomenState extends State<CollarstyleWomen> {
  String? collarStyle;
  int? selectedindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffed872d),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Text("Choose your Design",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Collar Style",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 400,
                width: 200,
                margin: EdgeInsets.only(left: 20, top: 10),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: collarwomenStyle.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        onTap: () {
                          collarStyle =
                              _selectStyle(index, widget.type.toString());
                          print(collarStyle);
                        },
                        child: Container(
                          height: 222,
                          width: 252,
                          color:
                              selectedindex == index ? Color(0xffed872d) : null,
                          child: Container(
                            margin: EdgeInsets.only(
                              right: 5,
                            ),
                            height: 300,
                            width: 250,
                            child: Center(
                              child: Stack(
                                children: [
                                  Image.asset(collarwomenStyle[index].image),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                margin: EdgeInsets.all(8),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        width: 200,
                        height: 45,
                        child: GestureDetector(
                            onTap: () {
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
                                    designimageurl: "not set",
                                    neckdesign: widget.neckdesign,
                                    wristdesign: widget.wristdesign,
                                    designcollar: collarStyle,
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 228.0),
                              child: Container(
                                  height: 60,
                                  width: 100,
                                  color: Colors.deepOrange,
                                  child: Center(
                                      child: Text(
                                    "Next",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ))),
                            )),
                      ),
                    ),

                    //
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeasurementOptionPage(
                        shoptype: widget.shoptype,
                        shopid: widget.shopid,
                        uid: widget.uid,
                        name: widget.name,
                        phone: widget.phone,
                        stitching_price: widget.stitching_price,
                        designcollar: collarStyle,
                        neckdesign: widget.neckdesign,
                        wristdesign: widget.wristdesign,
                        category: widget.category,
                        type: widget.type,
                        designimageurl: widget.designimageurl,
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Text("Next"),
                ),
              ),
            ]))));
  }

  String _selectStyle(int index, String type) {
    if (widget.type == "women" || widget.type == "girls") {
      if (index == 0) {
        setState(() {
          selectedindex = index;
        });

        return "collar1";
      }
      if (index == 1) {
        setState(() {
          selectedindex = index;
        });
        return "collar2";
      }
      if (index == 2) {
        setState(() {
          selectedindex = index;
        });
        return "collar3";
      }
      if (index == 3) {
        setState(() {
          selectedindex = index;
        });
        return "collar4";
      }
      if (index == 4) {
        setState(() {
          selectedindex = index;
        });
        return "collar5";
      }
    }
    return "null";
  }
}
