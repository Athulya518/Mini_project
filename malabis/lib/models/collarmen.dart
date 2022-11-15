import 'package:flutter/material.dart';
class CollarmenStyle{
  final String image;
  final int id;
  final Color color;
  CollarmenStyle(
      {
        required this.id,
        required this.image,
        required this.color
      }
      );
}
List<CollarmenStyle>collarmenStyle=[
  CollarmenStyle(id: 1,
      image: "assets/images/Bandcollar.png",
      color: Color(0xFF3DB2AE)),
  CollarmenStyle(id: 2,
      image: "assets/images/Button-downcollar.png",
      color: Color(0xFF3DB2AE)),
  CollarmenStyle(id: 3,
      image: "assets/images/Spreadcollar.png",
      color: Color(0xFF3DB2AE)),
  CollarmenStyle(id: 4,
      image: "assets/images/Straightpointcollar.png",
      color: Color(0xFF3DB2AE)),
  CollarmenStyle(id: 5,
      image: "assets/images/Wingcollar.png",
      color: Color(0xFF3DB2AE)),



];