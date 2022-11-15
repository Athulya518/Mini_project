import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/homepage.dart';
import 'package:malabis/screens/loginscreen.dart';
import 'package:malabis/screens/users/homepage_user.dart';
import 'package:malabis/screens/users/myorders.dart';
import 'package:malabis/screens/users/profile.dart';
import 'package:malabis/widgets/colors.dart';



class BottomNavigationPage extends StatefulWidget {
  var uid;
  var name;
  var email;
  var phone;
var shoptype;
var shopid;

   BottomNavigationPage({Key? key,this.uid,this.name,this.email,this.phone,this.shopid,this.shoptype}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  // final _formKeyuserfeedback = GlobalKey<FormState>();
  // TextEditingController usermessagecontroller=TextEditingController();
  int selectedindex=0;

  var uid;
  var _widgetOptions;
  var name;
  var email;
  var phone;
  setdata()
  {
    uid=widget.uid;
    name=widget.name;
    email=widget.email;
    phone=widget.phone;
  }


  void initState() {
   setdata();
   _widgetOptions=[

     HomePageUser(
       uid: uid,
       name: name,
       email: email,
       phone: phone,

     ),
     MyOrders(
       uid: uid,
       name: name,
       email: email,
       phone: phone,),
     ProfilePage(
       uid: uid,
       name: name,
       email: email,
       phone: phone,
     ),

   ];
    // TODO: implement initState
    super.initState();
  }


  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color(0xff5b5b59),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(

                decoration: BoxDecoration(color: Colors.white60),
                accountName: Text(widget.name), accountEmail: Text(widget.email),

                currentAccountPicture: CircleAvatar(backgroundColor: Colors.grey,child: Text("S",style: TextStyle(fontSize: 40),),),

              ),
              // ListTile(leading:Icon(Icons.logout),title: Text("Logout"),
              //   onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
              // ),
             ListTile(leading:Icon(Icons.feedback),title:Text("Feedback")),
             ListTile(

                 onTap: (){},
                 leading:Icon(Icons.history),title:Text("View Orders"))

              ],),
          ),


       appBar: AppBar(
      elevation: 2,
      backgroundColor: appbarcolor,
      //leading: Icon(Icons.menu,color: Colors.black,),
      title: Text("Malabis"),
      actions: [
        // Icon(Icons.notifications,color: Colors.black,),
        // SizedBox(width: 10,),
        InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(
              Icons.logout,
              color: Colors.black,
            )),
        SizedBox(
          width: 10,
        ),
      ],
    ),
      bottomNavigationBar:_customBottomBar() ,

      body: _widgetOptions.elementAt(selectedindex)
    );
  }


  _customBottomBar(){


    return BottomNavigationBar(

      currentIndex:selectedindex,
      onTap: (value){

          setState(() {
            selectedindex=value;
          });

      },
 backgroundColor:Color(0xffed872d),
        selectedItemColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,

        items: [

          BottomNavigationBarItem(

              icon: Icon(Icons.home),
              label: "Home"


          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.shop_2),
              label: "Orders"


          ),
          BottomNavigationBarItem(

              icon: Icon(Icons.person),
              label: "My Account"


          )

        ]

    );
  }

}
class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  _FeedbackDialogState createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

