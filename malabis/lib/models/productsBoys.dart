import 'package:flutter/material.dart';
class ProductBoys{
  final String image,title;
  final int price,id;
  final Color color;
  ProductBoys(
      {
        required this.id,
        required this.image,
        required this.title,
        required this.price,
        required this.color
      }
      );
}
List<ProductBoys>productsBoys=[
  ProductBoys(id: 1,
      image: "assets/images/boyshirt.jpg",
      title:" Shirt",
      price: 250,
      color: Color(0xFF3DB2AE)),
  ProductBoys(id: 2,
      image: "assets/images/boystshirt.jpg",
      title:" TShirt",
      price: 250,
      color: Color(0xFF3DB2AE)),
  ProductBoys(id: 3,
      image: "assets/images/boysjeans.jpg",
      title:"Jeans",
      price: 450,
      color: Color(0xFF3DB2AE)),
  ProductBoys(id: 4,
      image: "assets/images/boyssuit.jpg",
      title:"Suit",
      price: 600,
      color: Color(0xFF3DB2AE)),
  ProductBoys(id: 5,
      image: "assets/images/boyskurthi.jpg",
      title:"Kurthi",
      price: 500,
      color: Color(0xFF3DB2AE)),
  ProductBoys(id: 6,
      image: "assets/images/boysthreefourth.jpg",
      title:"Trouser",
      price: 200,
      color: Color(0xFF3DB2AE)),

];