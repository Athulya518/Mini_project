import 'package:flutter/material.dart';
class TailorOrderDetails extends StatefulWidget {
  const TailorOrderDetails({Key? key}) : super(key: key);

  @override
  _TailorOrderDetailsState createState() => _TailorOrderDetailsState();
}

class _TailorOrderDetailsState extends State<TailorOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 50,
            width: 100,
            child: TextButton(onPressed: (){},child: Text("Completed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
          )
        ],
      ),
    );
  }
}
