import 'package:flutter/material.dart';
class MaterialsMennboys{
  final String image;
  final int price,id;
  final Color color;
  MaterialsMennboys(
      {
        required this.id,
        required this.image,
        required this.price,
        required this.color
      }
      );
}
List<MaterialsMennboys>materialsMennboys=[
  MaterialsMennboys(id: 1,
      image: "assets/images/shirtm1.jpg",

      price: 200,
      color: Color(0xFF3DB2AE)),



  MaterialsMennboys(id: 2,
      image: "assets/images/pant1.jpg",

      price: 150,
      color: Color(0xFF3DB2AE)),

MaterialsMennboys(id: 3,
      image: "assets/images/tshirtm1.jpg",

      price: 150,
      color: Color(0xFF3DB2AE)),

  MaterialsMennboys(id: 4,
      image: "assets/images/jeansm1.jpg",

      price: 250,
      color: Color(0xFF3DB2AE)),


  MaterialsMennboys(id: 5,
      image: "assets/images/suitm1.jpg",

      price: 250,
      color: Color(0xFF3DB2AE)),


 MaterialsMennboys(id: 6,
      image: "assets/images/jacket1.jpg",

      price: 300,
      color: Color(0xFF3DB2AE)),

  MaterialsMennboys(id: 7,
      image: "assets/images/denim1.jpg",

      price: 300,
      color: Color(0xFF3DB2AE)),


];