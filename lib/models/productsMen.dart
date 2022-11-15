import 'package:flutter/material.dart';
class ProductMen{
   final String image,title;
  final int price,id;
  final Color color;
  ProductMen(
   {
     required this.id,
     required this.image,
     required this.title,
     required this.price,
     required this.color
}
      );
}
List<ProductMen>productsMen=[
  ProductMen(id: 1,
      image: "assets/images/shirt.jpg",
      title:" Shirt",
      price: 350,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 2,
      image: "assets/images/tshirt.jpg",
      title:"TShirt",
      price: 300,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 3,
      image: "assets/images/pant.jpg",
      title:"Pant",
      price: 450,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 4,
      image: "assets/images/suit.jpg",
      title:"Suit",
      price: 800,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 5,
      image: "assets/images/jeans.jpg",
      title:"Jeans",
      price: 700,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 6,
      image: "assets/images/jacket.jpg",
      title:"Jacket",
      price: 600,
      color: Color(0xFF3DB2AE)),
  ProductMen(id: 7,
      image: "assets/images/denimjacket.jpg",
      title:"Denim Jacket",
      price: 600,
      color: Color(0xFF3DB2AE)),
  ];