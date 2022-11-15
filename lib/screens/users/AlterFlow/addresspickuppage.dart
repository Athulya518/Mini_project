import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/submitmeasure.dart';
import 'package:malabis/widgets/appbutton.dart';

import '../../../models/materialsmennboys.dart';
import '../../../models/materialswomenngirls.dart';
import '../../../widgets/apptext.dart';
import '../../../widgets/colors.dart';
import '../../paymentpage.dart';
import 'bookingPage.dart';
import 'submitmeasurementPage.dart';

class AddressSelectionPage extends StatefulWidget {
  String? category;
var type;
  var uid;
  var name;
  var phone;
  var stitching_price;
  String? designcollar;
  String? neckdesign;
  String? wristdesign;
  String? designimageurl;
  var shopid;
  var shoptype;
// for collar design
  AddressSelectionPage(
      {Key? key,
      this.designimageurl,
      this.category,
      this.uid,
      this.neckdesign,
      this.type,
      this.designcollar,
      this.wristdesign,
      this.phone,
      this.name,
      this.stitching_price,this.shoptype,this.shopid})
      : super(key: key);

  @override
  State<AddressSelectionPage> createState() => _AddressSelectionPageState();
}

class _AddressSelectionPageState extends State<AddressSelectionPage> {
  final _pickupKey = GlobalKey<FormState>();
  final _delKey = GlobalKey<FormState>();
//for pickupaddress
  TextEditingController _addrTextcontroller = TextEditingController();
  TextEditingController _locTextcontroller = TextEditingController();
  TextEditingController _pinTextcontroller = TextEditingController();
  TextEditingController _pickupdateTextcontroller = TextEditingController(); //for pickupdate
  TextEditingController _shoppickupdateTextcontroller = TextEditingController(); //for pickupdate

  //for deivery

  TextEditingController _daddrTextcontroller = TextEditingController();
  TextEditingController _dlocTextcontroller = TextEditingController();
  TextEditingController _dpinTextcontroller = TextEditingController();
  TextEditingController _dpickupdateTextcontroller = TextEditingController();
//sameaddress
  bool sameaddresss = false;

  bool samplegarments=false;
  String? shoporpickup = "shop";
//for store purchase
  var fabrictype;
  var fabricid;
  var price;
  var selectedindex;

  //pickup date
  DateTime date = DateTime.now();
  DateTime delidate = DateTime.now();
  DateTime shopsamplePickdate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarcolor,
          title: Text("Pick and Delivery Details"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text("Select Material Option",style: TextStyle(fontSize: 20),),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: "shop",
                                groupValue: shoporpickup,
                                onChanged: (String? value) {
                                  setState(() {
                                    shoporpickup = value;
                                  });
                                }),
                            Text("Shop Material"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Radio(
                                value: "pickup",
                                groupValue: shoporpickup,
                                onChanged: (String? value) {
                                  setState(() {
                                    shoporpickup = value;
                                  });
                                }),
                            Text("Pickup ")
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              shoporpickup == "pickup"
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: AppText(
                          text: "Pickup Address",
                          size: 18,
                          fw: FontWeight.w700,
                          txtalign: TextAlign.left,
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),
              shoporpickup == "pickup"
                  ? SliverToBoxAdapter(
                      child: Form(
                        key: _pickupKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _addrTextcontroller,
                                decoration: InputDecoration(hintText: "Address"),
                              ),
                              TextFormField(
                                controller: _locTextcontroller,
                                decoration: InputDecoration(hintText: "Location"),
                              ),
                              TextFormField(
                                controller: _pinTextcontroller,
                                decoration: InputDecoration(hintText: "Pin"),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      child: TextFormField(
                                        controller: _pickupdateTextcontroller,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                            hintText: "Pick up Date"),
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
                                            _pickupdateTextcontroller.text =
                                                date.toString();
                                          });
                                        });
                                      },
                                      child: Icon(Icons.date_range)),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:28.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            "Delivery Address Same as Pick-up Address",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                                    Checkbox(
                                        value: sameaddresss,
                                        onChanged: (value) {
                                          setState(() {
                                            if (sameaddresss == true) {
                                              sameaddresss = false;
                                            } else {
                                              sameaddresss = true;
                                            }

                                            print(sameaddresss);
                                          });
                                        })
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shop the Material for Stitching",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18)),
                            SizedBox(
                              height: 20,
                            ),
                            //widget.shoptype == "Men" ||   widget.shoptype == "Boys" ?
                            Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Text(widget.shoptype,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18)),
                                      ),
                                    ],
                                  ),
                                // : Text("Women",
                                //     style: TextStyle(
                                //         color: Colors.black,
                                //         fontWeight: FontWeight.w600,
                                //         fontSize: 18)),
                            widget.shoptype == "Men" || widget.shoptype=='Boys'
                                ? Container(
                                    // color: Color(0xffFAD4D4),
                                    height: 250,

                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: materialsMennboys.length,
                                        itemBuilder: (context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedindex =
                                                    materialsMennboys[index];
                                                fabrictype = "men";
                                                price = materialsMennboys[index]
                                                    .price;
                                                fabricid =
                                                    materialsMennboys[index].id;

                                                print(price);
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                right: 5,
                                              ),
                                              height: 250,
                                              width: 200,
                                              color: Colors.white,
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                      materialsMennboys[index]
                                                          .image),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        height: 45,
                                                        width: 200,
                                                        color: selectedindex !=
                                                                materialsMennboys[
                                                                    index]
                                                            ? Colors.black54
                                                            : Colors.green,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                              "Price: RS. ${materialsMennboys[index].price}/-",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : Container(
                                    // color: Color(0xffFAD4D4),
                                    height: 250,

                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: materialsWomenngirls.length,
                                        itemBuilder: (context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedindex =
                                                    materialsWomenngirls[index];
                                                fabrictype = "women";
                                                print(fabrictype);
                                                price =
                                                    materialsWomenngirls[index]
                                                        .price;
                                                print(price);
                                                fabricid = materialsWomenngirls[index]
                                                    .id;
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                right: 5,
                                              ),
                                              height: 250,
                                              width: 200,
                                              color: Colors.white,
                                              child: Stack(
                                                children: [
                                                  Image.asset(
                                                      materialsWomenngirls[
                                                              index]
                                                          .image),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomCenter,
                                                    child: Container(
                                                        height: 45,
                                                        width: 200,
                                                        color: selectedindex !=
                                                                materialsWomenngirls[
                                                                    index]
                                                            ? Colors.black54
                                                            : Colors.green,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Center(
                                                                child: Text(
                                                              "Price: RS. ${materialsWomenngirls[index].price}/-",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                          ],
                        ),
                      ),
                    ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              sameaddresss == false
                  ? SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top:18.0),
                        child: AppText(
                          text: "Delivery Address",
                          size: 18,
                          fw: FontWeight.w700,
                          txtalign: TextAlign.left,
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),

              sameaddresss == false
                  ? SliverToBoxAdapter(
                      child: Form(
                        key: _delKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top:18.0),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _daddrTextcontroller,
                                decoration: InputDecoration(hintText: "Address"),
                              ),
                              TextFormField(
                                controller: _dlocTextcontroller,
                                decoration: InputDecoration(hintText: "Location"),
                              ),
                              TextFormField(
                                controller: _dpinTextcontroller,
                                decoration: InputDecoration(hintText: "Pin"),
                              ),

                            ],
                          ),
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),


              SliverToBoxAdapter(
                child:  Row(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        width: 100,
                        child: TextFormField(
                          controller: _dpickupdateTextcontroller,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Delivery Date"),
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
                              delidate = newDate;
                              _dpickupdateTextcontroller.text =
                                  delidate.toString();
                            });
                          });
                        },
                        child: Icon(Icons.date_range)),
                  ],
                ),
              ),



              SliverToBoxAdapter(
                child:   Row(
                  children: [
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top:28.0),
                          child: Text(
                              "Providing Sample Garments",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top:28.0),
                      child: Checkbox(
                          value: samplegarments,
                          onChanged: (value) {
                            setState(() {
                              if (samplegarments == true) {
                                samplegarments = false;
                              } else {
                                samplegarments = true;
                              }

                              print(samplegarments);
                            });
                          }),
                    )
                  ],
                ),
              ),

              shoporpickup=="shop" && samplegarments==true?


              SliverToBoxAdapter(
                child:  Row(
                  children: [
                    Expanded(
                      child: Container(
                        //color: Colors.red,
                        width: 100,
                        child: TextFormField(
                          controller: _shoppickupdateTextcontroller,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Garment Pick up Date"),
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
                              shopsamplePickdate = newDate;
                              _shoppickupdateTextcontroller.text =
                                 shopsamplePickdate.toString();
                            });
                          });
                        },
                        child: Icon(Icons.date_range)),
                  ],
                ),
              ):SliverToBoxAdapter(child: SizedBox.shrink(),),

// Payment Type
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top:18.0),
                  child: Row(
                    children: [
                      AppText(
                        text: "Cash on Delivery",
                        txtalign: TextAlign.left,
                      ),
                      price != null
                      && shoporpickup=="shop"
                          ? AppText(
                              color: Colors.red,
                              size: 18,
                              text:
                                  " Amount:${(double.parse(widget.stitching_price.toString()) + double.parse(price.toString()))}",
                              txtalign: TextAlign.left,
                            )
                          : AppText(
                        color: Colors.red,
                        size: 18,
                        text:
                        " Amount:${(double.parse(widget.stitching_price.toString()))}",
                        txtalign: TextAlign.left,
                      )
                    ],
                  ),
                ),
              ),

//Delivery address
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: InkWell(
                    onTap: () {
                      // print(widget.stitching_price);
                      // print(price);

                      if (shoporpickup == "shop") {
                       // print("shop");

                        if(samplegarments!=true){
                          if(_delKey.currentState!.validate()){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubmitMeasurementPage(
                                      shoptype: widget.shoptype,
                                      shopid: widget.shopid,
                                      fabricid:fabricid.toString() ,
                                      pickuporshop: "Shop",
                                      uid: widget.uid,
                                      name: widget.name,
                                      phone: widget.phone,
                                      fabrictype: fabrictype,
                                      materialprice: price,
                                      neckdesign: widget.neckdesign,
                                      wristdesign: widget.wristdesign,
                                      designcollar: widget.designcollar,
                                      designimageurl: widget.designimageurl,
                                      category: widget.category,
                                      stitching_price: widget.stitching_price,
                                      type: widget.type,
                                      delivaddress: _daddrTextcontroller.text,
                                      delivdate:
                                      _dpickupdateTextcontroller.text,
                                      delivlocation: _dlocTextcontroller.text,
                                      delivpin: _dpinTextcontroller.text,
                                      paymentMode: "Cash on Delivery",
                                      pickvaddress: "not set",
                                      pickdate: "not set",
                                      picklocation: "not set",
                                      pickvpin: "not set",
                                      totalprice: (double.parse(widget
                                          .stitching_price
                                          .toString()) +
                                          double.parse(price.toString())),
                                    )));
                          }

                        }
                        else{
                          if(_delKey.currentState!.validate()){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookingPage(
                                      shoptype: widget.shoptype,
                                      shopid: widget.shopid,
                                      fabricid:fabricid.toString() ,
                                      pickuporshop: "Shop",
                                      uid: widget.uid,
                                      name: widget.name,
                                      phone: widget.phone,
                                      fabrictype: fabrictype,
                                      materialprice: price,
                                      neckdesign: widget.neckdesign,
                                      wristdesign: widget.wristdesign,
                                      designcollar: widget.designcollar,
                                      designimageurl: widget.designimageurl,
                                      category: widget.category,
                                      stitching_price: widget.stitching_price,
                                      type: widget.type,
                                      delivaddress: _daddrTextcontroller.text,
                                      delivdate:
                                      _dpickupdateTextcontroller.text,
                                      delivlocation: _dlocTextcontroller.text,
                                      delivpin: _dpinTextcontroller.text,
                                      paymentMode: "Cash on Delivery",
                                      pickvaddress: _daddrTextcontroller.text,
                                      pickdate: _shoppickupdateTextcontroller.text,
                                      picklocation:_dlocTextcontroller.text,
                                      pickvpin: _dpinTextcontroller.text,
                                      totalprice: (double.parse(widget
                                          .stitching_price
                                          .toString()) +
                                          double.parse(price.toString())),
                                    )));
                          }

                        }




                      }





                      else {



                        if(samplegarments!=true){
                          if(sameaddresss==true){

                            print("Jobin");

                            if(_pickupKey.currentState!.validate()){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubmitMeasurementPage(
                                        shoptype: widget.shoptype,
                                        shopid: widget.shopid,
                                        fabricid:fabricid.toString(),
                                        pickuporshop: "Shop",
                                        uid: widget.uid,
                                        name: widget.name,
                                        phone: widget.phone,
                                        fabrictype: fabrictype,
                                        materialprice: price,
                                        neckdesign: widget.neckdesign,
                                        wristdesign: widget.wristdesign,
                                        designcollar: widget.designcollar,
                                        designimageurl: widget.designimageurl,
                                        category: widget.category,
                                        stitching_price: widget.stitching_price,
                                        type: widget.type,
                                        delivaddress: _addrTextcontroller.text,
                                        //to do
                                        delivdate:
                                        _dpickupdateTextcontroller.text,
                                        delivlocation: _locTextcontroller.text,
                                        delivpin: _pinTextcontroller.text,
                                        paymentMode: "Cash on Delivery",
                                        pickvaddress: _addrTextcontroller.text,
                                        pickdate: _pickupdateTextcontroller.text,
                                        picklocation: _locTextcontroller.text,
                                        pickvpin: _pinTextcontroller.text,
                                        totalprice: (double.parse(widget
                                            .stitching_price
                                            .toString()) ),
                                      )));

                            }

                          }

                          else{
                            print("controlhere");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  SubmitMeasurementPage(
                                      fabricid:"not set",
                                      pickuporshop: "Pickup",
                                      shoptype: widget.shoptype,
                                      shopid: widget.shopid,
                                      uid: widget.uid,
                                      name: widget.name,
                                      phone: widget.phone,
                                      fabrictype: fabrictype,
                                      materialprice: price,
                                      neckdesign: widget.neckdesign,
                                      wristdesign: widget.wristdesign,
                                      designcollar: widget.designcollar,
                                      designimageurl: widget.designimageurl,
                                      category: widget.category,
                                      stitching_price: widget.stitching_price,
                                      type: widget.type,
                                      delivaddress: _daddrTextcontroller.text,
                                      delivdate:
                                      _dpickupdateTextcontroller.text,
                                      delivlocation: _dlocTextcontroller.text,
                                      delivpin: _dpinTextcontroller.text,
                                      paymentMode: "Cash on Delivery",
                                      pickvaddress: _addrTextcontroller.text,
                                      pickdate: _pickupdateTextcontroller.text,
                                      picklocation: _locTextcontroller.text,
                                      pickvpin: _pinTextcontroller.text,
                                      totalprice: (double.parse(widget
                                          .stitching_price
                                          .toString()) ),
                                    )));

                          }

                        }

                        else{

                          if(sameaddresss==true){

                            print("Jobin");

                            if(_pickupKey.currentState!.validate()){

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BookingPage(
                                        shoptype: widget.shoptype,
                                        shopid: widget.shopid,
                                        fabricid:fabricid.toString(),
                                        pickuporshop: "Shop",
                                        uid: widget.uid,
                                        name: widget.name,
                                        phone: widget.phone,
                                        fabrictype: fabrictype,
                                        materialprice: price,
                                        neckdesign: widget.neckdesign,
                                        wristdesign: widget.wristdesign,
                                        designcollar: widget.designcollar,
                                        designimageurl: widget.designimageurl,
                                        category: widget.category,
                                        stitching_price: widget.stitching_price,
                                        type: widget.type,
                                        delivaddress: _daddrTextcontroller.text,
                                        //to do
                                        delivdate:
                                        _dpickupdateTextcontroller.text,
                                        delivlocation: _dlocTextcontroller.text,
                                        delivpin: _dpinTextcontroller.text,
                                        paymentMode: "Cash on Delivery",
                                        pickvaddress: _addrTextcontroller.text,
                                        pickdate: _pickupdateTextcontroller.text,
                                        picklocation: _locTextcontroller.text,
                                        pickvpin: _pinTextcontroller.text,
                                        totalprice: (double.parse(widget
                                            .stitching_price
                                            .toString()) ),
                                      )));

                            }

                          }

                          else{
                            print("here");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  BookingPage(

                                      fabricid:"not set",
                                      pickuporshop: "Pickup",
                                      shopid: widget.shopid,
                                      shoptype: widget.shoptype,
                                      uid: widget.uid,
                                      name: widget.name,
                                      phone: widget.phone,
                                      fabrictype: fabrictype,
                                      materialprice: price,
                                      neckdesign: widget.neckdesign,
                                      wristdesign: widget.wristdesign,
                                      designcollar: widget.designcollar,
                                      designimageurl: widget.designimageurl,
                                      category: widget.category,
                                      stitching_price: widget.stitching_price,
                                      type: widget.type,
                                      delivaddress: _daddrTextcontroller.text,
                                      delivdate:
                                      _dpickupdateTextcontroller.text,
                                      delivlocation: _dlocTextcontroller.text,
                                      delivpin: _dpinTextcontroller.text,
                                      paymentMode: "Cash on Delivery",
                                      pickvaddress: _addrTextcontroller.text,
                                      pickdate: _pickupdateTextcontroller.text,
                                      picklocation: _locTextcontroller.text,
                                      pickvpin: _pinTextcontroller.text,
                                      totalprice: (double.parse(widget
                                          .stitching_price
                                          .toString()) ),
                                    )));

                          }




                        }





                      }
                    },
                    child: AppButton(
                      height: 45,
                      width: 250,
                      color: btncolor,
                      textColor: Colors.white,
                      text: "Proceed to Check Out",
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
