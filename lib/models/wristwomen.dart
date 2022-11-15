import 'package:flutter/material.dart';
class WristCuffStyle{
  final String image;
  final int id;
  final Color color;
  WristCuffStyle(
      {
        required this.id,
        required this.image,
        required this.color
      }
      );
}
List<WristCuffStyle>wristcuffStyles=[
  WristCuffStyle(id: 1,
      image: "assets/images/wrist1.jpg",
      color: Color(0xFF3DB2AE)),
  WristCuffStyle(id: 2,
      image: "assets/images/wrist2.jpg",
      color: Color(0xFF3DB2AE)),
  WristCuffStyle(id: 3,
      image: "assets/images/wrist3.jpg",
      color: Color(0xFF3DB2AE)),
  WristCuffStyle(id: 4,
      image: "assets/images/wrist4.jpg",
      color: Color(0xFF3DB2AE)),


];