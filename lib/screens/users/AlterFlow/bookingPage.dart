import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../bottomNavigationPage.dart';

class BookingPage extends StatefulWidget {
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

  String? measurement;
  String? fabricid;
  var shopid;
  var shoptype;

  BookingPage(
      {Key? key,
      this.measurement,
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
      this.fabricid,
      this.picklocation,
      this.pickvaddress,
      this.pickvpin,
      this.shopid,
      this.shoptype})
      : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var uuid = Uuid();

  String paymentMode = "COD";

  var bookingid;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    bookingid = uuid.v1();
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: 850,
          width: double.infinity,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: RadioListTile(
                          value: "COD",
                          groupValue: paymentMode,
                          onChanged: (String? value) {
                            setState(() {
                              paymentMode = value!;
                            });
                          },
                          title: Text("COD"),
                        ),
                      ),
                      Container(
                        child: RadioListTile(
                            value: "Online",
                            groupValue: paymentMode,
                            onChanged: (String? value) {
                              setState(() {
                                paymentMode = value!;
                              });
                            },
                            title: Text("Online")),
                      ),
                    ],
                  ),
                ),
              ),
              paymentMode == "Online"
                  ? SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CreditCardWidget(
                              glassmorphismConfig: useGlassMorphism
                                  ? Glassmorphism.defaultConfig()
                                  : null,
                              cardNumber: cardNumber,
                              expiryDate: expiryDate,
                              cardHolderName: cardHolderName,
                              cvvCode: cvvCode,
                              bankName: 'Axis Bank',
                              showBackView: isCvvFocused,
                              obscureCardNumber: true,
                              obscureCardCvv: true,
                              isHolderNameVisible: true,
                              cardBgColor: Colors.blueGrey,
                              backgroundImage: useBackgroundImage
                                  ? 'assets/images/card_bg.png'
                                  : null,
                              isSwipeGestureEnabled: true,
                              onCreditCardWidgetChange:
                                  (CreditCardBrand creditCardBrand) {},
                              customCardTypeIcons: <CustomCardTypeIcon>[
                                CustomCardTypeIcon(
                                  cardType: CardType.mastercard,
                                  cardImage: Image.asset(
                                    'assets/images/mastercard.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    CreditCardForm(
                                      formKey: formKey,
                                      obscureCvv: true,
                                      obscureNumber: true,
                                      cardNumber: cardNumber,
                                      cvvCode: cvvCode,
                                      isHolderNameVisible: true,
                                      isCardNumberVisible: true,
                                      isExpiryDateVisible: true,
                                      cardHolderName: cardHolderName,
                                      expiryDate: expiryDate,
                                      themeColor: Colors.blue,
                                      textColor: Colors.black,
                                      cardNumberDecoration: InputDecoration(
                                        labelText: 'Number',
                                        hintText: 'XXXX XXXX XXXX XXXX',
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                      ),
                                      expiryDateDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: 'Expired Date',
                                        hintText: 'XX/XX',
                                      ),
                                      cvvCodeDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: 'CVV',
                                        hintText: 'XXX',
                                      ),
                                      cardHolderDecoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: border,
                                        enabledBorder: border,
                                        labelText: 'Card Holder',
                                      ),
                                      onCreditCardModelChange:
                                          onCreditCardModelChange,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    FirebaseFirestore.instance
                                        .collection('booking')
                                        .doc(bookingid)
                                        .set({
                                      'shopid': widget.shopid,
                                      'shoptype': widget.shoptype,
                                      'bookingid': bookingid,
                                      'measurement': widget.measurement,
                                      'shoporpickup': widget.pickuporshop,
                                      'userid': widget.uid,
                                      'category': widget.category,
                                      'type': widget.type,
                                      'wristdesign': widget.wristdesign,
                                      'collardesign': widget.designcollar,
                                      'neckdesign': widget.neckdesign,
                                      'username': widget.name,
                                      'userphone': widget.phone,
                                      'stitchingprice': widget.stitching_price,
                                      'designimgurl': widget.designimageurl,
                                      'fabrictype': widget.fabrictype,
                                      'paymentmode': paymentMode,
                                      'materialprice': widget.materialprice,
                                      'totalprice': widget.totalprice,
                                      'deliveryaddress': widget.delivaddress,
                                      'deliverydate': widget.delivdate,
                                      'deliverylocation': widget.delivlocation,
                                      'deliverypin': widget.delivpin,
                                      'pickupdate': widget.pickdate,
                                      'pickuplocation': widget.picklocation,
                                      'pickupaddress': widget.pickvaddress,
                                      'pickuppin': widget.pickvpin,
                                      'status': 0,
                                      'tailorassigned': 0,
                                      'workcomplete': 0,
                                      'materialpicked': 0,
                                      'cancelled': 0,
                                      'fabricid': widget.fabricid,
                                      'confirmstatus': 0,
                                      'tailorid': "not assigned",
                                      'dboyassigned': 0,
                                      'dboyid': "not set",
                                      'deliverystatus': 0,
                                      'amountreceived': 0.0,
                                      'remarks': "not set",
                                      'paymentStatus':
                                          paymentMode == "Online" ? 0 : 1
                                    }).then((value) =>
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BottomNavigationPage(
                                                          name: widget.name,
                                                          uid: widget.uid,
                                                          phone: widget.phone,
                                                          email: "email",
                                                        )),
                                                (route) => false));
                                  }
                                },
                                child: Center(
                                  child: Container(
                                      height: 45,
                                      width: 450,
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Center(
                                          child: Text(
                                        "Pay Now.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ))),
                                ))
                          ],
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Text("Payment Mode Selected: $paymentMode"),
                          Text("Click to Complete the Order"),
                          InkWell(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('booking')
                                    .doc(bookingid)
                                    .set({
                                  'shopid': widget.shopid,
                                  'shoptype': widget.shoptype,
                                  'bookingid': bookingid,
                                  'measurement': widget.measurement,
                                  'shoporpickup': widget.pickuporshop,
                                  'userid': widget.uid,
                                  'category': widget.category,
                                  'type': widget.type,

                                  'username': widget.name,
                                  'userphone': widget.phone,
                                  'stitchingprice': widget.stitching_price,
                                  'designimgurl': widget.designimageurl,
                                  'fabrictype': widget.fabrictype,
                                  'paymentmode': paymentMode,
                                  'materialprice': widget.materialprice,
                                  'totalprice': widget.totalprice,
                                  'deliveryaddress': widget.delivaddress,
                                  'deliverydate': widget.delivdate,
                                  'deliverylocation': widget.delivlocation,
                                  'deliverypin': widget.delivpin,
                                  'pickupdate': widget.pickdate,
                                  'pickuplocation': widget.picklocation,
                                  'pickupaddress': widget.pickvaddress,
                                  'pickuppin': widget.pickvpin,
                                  'status': 0,
                                  'tailorassigned': 0,
                                  'workcomplete': 0,
                                  'materialpicked': 0,
                                  'cancelled': 0,
                                  'fabricid': widget.fabricid,
                                  'confirmstatus': 0,
                                  'tailorid': "not assigned",
                                  'dboyassigned': 0,
                                  'dboyid': "not set",
                                  'deliverystatus': 0,
                                  'amountreceived': 0.0,
                                  'remarks': "not set",
                                  'paymentStatus':
                                      paymentMode == "Online" ? 0 : 1,


                                }).then((value) => Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BottomNavigationPage(
                                                  name: widget.name,
                                                  uid: widget.uid,
                                                  phone: widget.phone,
                                                  email: "email",
                                                )),
                                        (route) => false));
                              },
                              child: Center(
                                child: Container(
                                    height: 45,
                                    width: 450,
                                    margin: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                        child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ))),
                              ))
                        ],
                      ),
                    )
            ],
          )),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
