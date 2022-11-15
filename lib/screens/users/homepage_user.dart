import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/bottomNavigationPage.dart';
import 'package:malabis/screens/homepage.dart';
import 'package:malabis/screens/loginscreen.dart';
import 'package:malabis/screens/users/boypage.dart';
import 'package:malabis/screens/users/girlpage.dart';
import 'package:malabis/screens/users/men.dart';
import 'package:malabis/screens/users/womenpage.dart';
import 'package:malabis/widgets/apptext.dart';
import 'package:malabis/widgets/colors.dart';

class HomePageUser extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;

  HomePageUser({Key? key, this.phone, this.name, this.email, this.uid})
      : super(key: key);

  @override
  _HomePageUserState createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 10, top: 20, bottom: 10),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    child: AppText(
                      text: "View all Shops",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .where('status', isEqualTo: 1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data?.docs.length == 0)
                            return Center(child: Text("No data found"));

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]['type'] ==
                                        'Men') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Women') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WomenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Boys') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BoyPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Girls') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GirlPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? Colors.blueGrey.withOpacity(0.6)
                                            : Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AppText(
                                        color: Colors.white,
                                        text: snapshot.data!.docs[index]
                                            ['name']),
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: AppText(
                      text: "Shop by Category",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    child: AppText(
                      text: "Men",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .where('type', isEqualTo: "Men")
                            .where('status', isEqualTo: 1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data?.docs.length == 0)
                            return Center(child: Text("No data found"));

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]['type'] ==
                                        'Men') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Women') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WomenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Boys') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BoyPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Girls') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GirlPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AppText(
                                      text: snapshot.data!.docs[index]['name'],
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    child: AppText(
                      text: "Women",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .where('type', isEqualTo: "Women")
                            .where('status', isEqualTo: 1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data?.docs.length == 0)
                            return Center(child: Text("No data found"));

                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]['type'] ==
                                        'Men') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Women') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WomenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Boys') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BoyPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Girls') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GirlPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xffed872d),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AppText(
                                        text: snapshot.data!.docs[index]
                                            ['name']),
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    child: AppText(
                      text: "Boys",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .where('type', isEqualTo: "Boys")
                            .where('status', isEqualTo: 1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data?.docs.length == 0)
                            return Center(child: Text("No data found"));
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]['type'] ==
                                        'Men') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Women') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WomenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Boys') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BoyPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Girls') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GirlPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.withOpacity(0.8),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AppText(
                                        color: Colors.white,
                                        text: snapshot.data!.docs[index]
                                            ['name']),
                                  ),
                                );
                              });
                        }),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 30),
                    child: AppText(
                      text: "Girls",
                      size: 22,
                      txtalign: TextAlign.left,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(right: 10),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('shop')
                            .where('type', isEqualTo: "Girls")
                            .where('status', isEqualTo: 1)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.data?.docs.length == 0)
                            return Center(child: Text("No data found"));
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (snapshot.data!.docs[index]['type'] ==
                                        'Girls') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => GirlPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Women') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => WomenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Boys') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => BoyPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    } else if (snapshot.data!.docs[index]
                                            ['type'] ==
                                        'Men') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MenPage(
                                                    uid: widget.uid,
                                                    name: widget.name,
                                                    email: widget.email,
                                                    phone: widget.phone,
                                                    type: snapshot.data!
                                                        .docs[index]['type'],
                                                    shopid: snapshot.data!
                                                        .docs[index]['shopid'],
                                                  )));
                                    }
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.teal.withOpacity(0.6),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: AppText(
                                        color: Colors.white,
                                        text: snapshot.data!.docs[index]
                                            ['name']),
                                  ),
                                );
                              });
                        }),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
