import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String screenRoute = "home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kSecondaryColor,
      title: Image.asset(
        "assets/Cartelly-Logo-NavBar-NoBG-white-orange.png",
        width: 400,
      ),
      // Text(
      //   'Cartelly Shop',
      //   style: GoogleFonts.permanentMarker(
      //     textStyle: const TextStyle(
      //       fontSize: 30,  // Set the font size here
      //       color: kSecondaryColor,  // You can also set other properties like color
      //     ),
      //   ),
      // ),
      centerTitle: true,
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded, size: 40, color: kSecondaryColor,))
      // ],
    );
  }
}
