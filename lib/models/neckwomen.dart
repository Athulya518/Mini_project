import 'package:flutter/material.dart';
class NeckStyle{
  final String image;
  final int id;
  final Color color;
  NeckStyle(
      {
        required this.id,
        required this.image,


        required this.color
      }
      );
}
List<NeckStyle>neckStyle=[
  NeckStyle(id: 1,

      image: "assets/images/neck1.jpg",
      color: Color(0xFF3DB2AE)),
  NeckStyle(id: 2,
      image: "assets/images/neck2.jpg",
      color: Color(0xFF3DB2AE)),
  NeckStyle(id: 3,
      image: "assets/images/neck3.jpg",

      color: Color(0xFF3DB2AE)),
  NeckStyle(id: 4,
      image: "assets/images/neck4.jpg",
      color: Color(0xFF3DB2AE)),
 NeckStyle(id: 5,
      image: "assets/images/neck5.jpg",
      color: Color(0xFF3DB2AE)),


];