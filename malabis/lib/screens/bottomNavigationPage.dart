import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:malabis/screens/homepage.dart';
import 'package:malabis/screens/loginscreen.dart';
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

     HomePage(
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
          backgroundColor: Color(0xffed872d),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(accountName: Text("Shabanu Jabin"), accountEmail: Text("shabanujabinn@gmail.com.com"),

                currentAccountPicture: CircleAvatar(backgroundColor: Colors.grey,child: Text("S",style: TextStyle(fontSize: 40),),),

              ),
              // ListTile(leading:Icon(Icons.logout),title: Text("Logout"),
              //   onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},
              // ),
             ListTile(leading:Icon(Icons.feedback),title:Text("Feedback"))

              ],),
          ),


      appBar: AppBar(

        elevation: 2,
        backgroundColor: appbarcolor,
        //leading: Icon(Icons.menu,color: Colors.black,),
        title: Container(
          height: 149,
          width: 450,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            image: DecorationImage(
              image:AssetImage(
                  "assets/images/malabislogo.png"
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          // Icon(Icons.notifications,color: Colors.black,),
          // SizedBox(width: 10,),
          InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),(route)=>false);
              },
              child: Icon(Icons.logout,color: Colors.black,)),
          SizedBox(width: 10,)
          ,],
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

