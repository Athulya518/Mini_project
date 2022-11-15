import 'package:flutter/material.dart';
class AppButton extends StatelessWidget {
  Color? color;
  String? text;
  double? height;
  double? width;
  Color? textColor;
  BoxDecoration? deco;
 FontWeight? fontWeight;
 int? fontSize;
   AppButton({Key? key,required this.text ,
    this.color = Colors.white,
    this.height = 50,
    this.width = 200,
    this.textColor=Colors.black,
     this.fontWeight=FontWeight.bold,
    this.deco, this.fontSize=16 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),

      ),

      height: height,
      width: width,
      child: Center(child: Text(text!,style:TextStyle(color: textColor),)),
    );
  }
}
