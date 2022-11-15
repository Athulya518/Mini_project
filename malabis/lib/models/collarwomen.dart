import 'package:flutter/material.dart';
class CollarwomenStyle{
  final String image;
  final int id;
  final Color color;
 CollarwomenStyle(
      {
        required this.id,
        required this.image,
        required this.color
      }
      );
}
List<CollarwomenStyle>collarwomenStyle=[
  CollarwomenStyle(id: 1,
      image: "assets/images/collar1.jpg",
      color: Color(0xFF3DB2AE)),
  CollarwomenStyle(id: 2,
      image: "assets/images/collar2.jpg",
      color: Color(0xFF3DB2AE)),
  CollarwomenStyle(id: 3,
      image: "assets/images/collar3.jpg",
      color: Color(0xFF3DB2AE)),
  CollarwomenStyle(id: 4,
      image: "assets/images/collar4.jpg",
      color: Color(0xFF3DB2AE)),
  CollarwomenStyle(id: 5,
      image: "assets/images/collar5.jpg",
      color: Color(0xFF3DB2AE)),



];