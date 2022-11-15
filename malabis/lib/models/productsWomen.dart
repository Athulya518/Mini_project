import 'package:flutter/material.dart';
class ProductWomen{
  final String image,title;
  final int price,id;
  final Color color;
  ProductWomen(
      {
        required this.id,
        required this.image,
        required this.title,
        required this.price,
        required this.color
      }
      );
}
List<ProductWomen>productsWomen=[
  ProductWomen(id: 10,
      image: "assets/images/ladiestop.jpg",
      title:"Top",
      price: 350,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 11,
      image: "assets/images/skirtladies.jpg",
      title:"Skirt",
      price: 400,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 12,
      image: "assets/images/salwarladies.jpg",
      title:"Salwar",
      price: 500,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 13,
      image: "assets/images/partywear.jpg",
      title:"Party Wear",
      price: 800,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 14,
      image: "assets/images/lehenga.jpg",
      title:"Lehenga",
      price: 800,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 15,
      image: "assets/images/leggingsladies.jpg",
      title:"Leggings",
      price: 150,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 16,
      image: "assets/images/ladies.jpg",
      title:"Jeans",
      price: 600,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 17,
      image: "assets/images/kurthinpalasso.jpg",
      title:"Kurtha Palasso",
      price: 800,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 18,
      image: "assets/images/kurthi.jpg",
      title:"Kurthi",
      price: 350,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 19,
      image: "assets/images/gown.jpg",
      title:"Frock",
      price: 1000,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 20,
      image: "assets/images/churidar.jpg",
      title:"Churidar",
      price: 400,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 21,
      image: "assets/images/blouseladies.jpg",
      title:"Blouse",
      price: 400,
      color: Color(0xFF3DB2AE)),
  ProductWomen(id: 22,
      image: "assets/images/abayaladies.jpg",
      title:"Abaya",
      price: 800,
      color: Color(0xFF3DB2AE)),








];