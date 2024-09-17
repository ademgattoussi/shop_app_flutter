import 'package:flutter/material.dart';

class Product {
  final int id, price;
  final String title, subTitle, description, image;
  final List<Color> colors;

  Product({
    required this.id,
    required this.price,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.image,
    required this.colors, // Ensure that colors is always provided
  });
}

List<Product> products = [
  Product(
    id: 1,
    price: 120,
    title: "AirPods",
    subTitle: "Écouteurs sans fil élégants",
    image: "assets/product-images/airpod.png",
    description: "Écouteurs sans fil de haute qualité avec une autonomie longue durée et un son cristallin pour une expérience audio immersive.",
    colors: [Colors.white, Colors.black, Colors.blue],
  ),
  Product(
    id: 2,
    price: 850,
    title: "Caméra",
    subTitle: "Caméra professionnelle",
    image: "assets/product-images/camera.png",
    description: "Capturez des moments inoubliables avec cette caméra professionnelle équipée d'un capteur haute résolution et d'un zoom optique puissant.",
    colors: [Colors.black, Colors.grey],
  ),
  Product(
    id: 3,
    price: 499,
    title: "Classique",
    subTitle: "Casque d'écoute haute qualité",
    image: "assets/product-images/class.png",
    description: "Un casque d'écoute classique offrant un son équilibré et des basses profondes, idéal pour les audiophiles et les professionnels du son.",
    colors: [Colors.black, Colors.brown, Colors.grey],
  ),
  Product(
    id: 4,
    price: 250,
    title: "Casque de jeu",
    subTitle: "Casque avec microphone intégré",
    image: "assets/product-images/headset.png",
    description: "Casque de jeu avec un son surround et un microphone intégré pour une communication claire lors de vos sessions de jeu.",
    colors: [Colors.red, Colors.black, Colors.white],
  ),
  Product(
    id: 5,
    price: 699,
    title: "Mobile",
    subTitle: "Smartphone dernier cri",
    image: "assets/product-images/mobile.png",
    description: "Un smartphone élégant avec un écran OLED, un appareil photo exceptionnel et une performance fluide pour toutes vos tâches quotidiennes.",
    colors: [Colors.black, Colors.yellow, Colors.blue],
  ),
  Product(
    id: 6,
    price: 199,
    title: "Enceinte Bluetooth",
    subTitle: "Enceinte portable sans fil",
    image: "assets/product-images/speaker.png",
    description: "Emportez la fête partout avec cette enceinte Bluetooth portable offrant un son puissant et une connectivité sans fil facile.",
    colors: [Colors.black, Colors.red, Colors.blue],
  ),
];
