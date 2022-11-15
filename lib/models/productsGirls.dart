import 'package:flutter/material.dart';
class ProductGirls{
  final String image,title;
  final int price,id;
  final Color color;
  ProductGirls(
      {
        required this.id,
        required this.image,
        required this.title,
        required this.price,
        required this.color
      }
      );
}
List<ProductGirls>productsGirls=[
  ProductGirls(id: 1,
      image: "assets/images/girlsnormalfrock.jpg",
      title:"Normal Frock",
      price: 350,
      color: Color(0xFF3DB2AE)),
  ProductGirls(id: 2,
      image: "assets/images/girlsjeans.jpg",
      title:"Jeans",
      price: 300,
      color: Color(0xFF3DB2AE)),
  ProductGirls(id: 3,
      image: "assets/images/girlslehenga.jpg",
      title:"Lehenga",
      price: 550,
      color: Color(0xFF3DB2AE)),
  ProductGirls(id: 4,
      image: "assets/images/girlsnightdress.jpg",
      title:"Night Dress",
      price: 200,
      color: Color(0xFF3DB2AE)),
  ProductGirls(id: 5,
      image: "assets/images/frockgirls.jpg",
      title:"Frock",
      price: 400,
      color: Color(0xFF3DB2AE)),
  ProductGirls(id: 6,
      image: "assets/images/girlsfullfrock.jpg",
      title:"Full Frock",
      price: 600,
      color: Color(0xFF3DB2AE)),

  ProductGirls(id: 7,
      image: "assets/images/girlstop.jpg",
      title:"Top",
      price: 250,
      color: Color(0xFF3DB2AE)),



];