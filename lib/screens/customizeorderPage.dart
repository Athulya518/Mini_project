import 'package:flutter/material.dart';
import 'package:malabis/screens/knowdesign.dart';
import 'package:malabis/screens/measurement.dart';
import 'package:malabis/screens/users/AlterFlow/addresspickuppage.dart';
import 'package:malabis/widgets/colors.dart';

import 'designneckwomen.dart';

class CustomizeOrderPage extends StatefulWidget {
  var uid;
  var name;
  var phone;
  String? category;
  var stitching_price;
  String? type;
  var shopid;
  var shoptype;
  CustomizeOrderPage(
      {Key? key,
      this.category,
      this.type,
      this.uid,
      this.phone,
      this.name,
      this.stitching_price,
      this.shopid,
      this.shoptype})
      : super(key: key);

  @override
  _CustomizeOrderPageState createState() => _CustomizeOrderPageState();
}

class _CustomizeOrderPageState extends State<CustomizeOrderPage> {
  List _category = ["Pant", "Skirt", "Jeans", "Leggings"];

  @override
  void initState() {
    printData();
    super.initState();
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
        backgroundColor: appbarcolor,
        title: Text("${widget.type.toString().toUpperCase()} Customization"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "How do you want to customize your Dress?",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KnowDesign(
                      uid: widget.uid,
                      name: widget.name,
                      phone: widget.phone,
                      stitching_price: widget.stitching_price,
                      category: widget.category,
                      type: widget.type,
                      shoptype: widget.shoptype,
                      shopid: widget.shopid,
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I know my design ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Text(
                      "Upload image",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                  ],
                )),
                decoration: BoxDecoration(
                  color: btncolor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // InkWell(
            //   onTap: () {
            //     _category.contains(widget.category)
            //         ? Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => AddressSelectionPage(
            //                 uid: widget.uid,
            //                 name: widget.name,
            //                 phone: widget.phone,
            //                 stitching_price: widget.stitching_price,
            //                 category: widget.category,
            //                 type: widget.type,
            //                 shoptype: widget.shoptype,
            //                 shopid: widget.shopid,
            //               ),
            //             ),
            //           )
            //         : Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => DesignMyselfPage(
            //                 uid: widget.uid,
            //                 name: widget.name,
            //                 phone: widget.phone,
            //                 category: widget.category,
            //                 stitching_price: widget.stitching_price,
            //                 type: widget.type,
            //                 shoptype: widget.shoptype,
            //                 shopid: widget.shopid,
            //               ),
            //             ),
            //           );
            //   },
            //   child: Container(
            //     height: 100,
            //     width: MediaQuery.of(context).size.width,
            //     child: Center(
            //         child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           "Choose your design",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w400,
            //               fontSize: 16),
            //         ),
            //       ],
            //     )),
            //     decoration: BoxDecoration(
            //       color: btncolor.withOpacity(0.5),
            //       borderRadius: BorderRadius.circular(16),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
