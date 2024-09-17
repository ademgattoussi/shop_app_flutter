import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/screens/registration_screen.dart';
import 'package:cartelly_shop/screens/signin_screen.dart';
import 'package:cartelly_shop/widgets/my_btn.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String screenRoute = "welcome_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WelcomeAppBar(),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 1,),
            Column(
              children: [
                SizedBox(
                  height: 150,
                  child:  const Icon(Icons.support_agent, size: 150, color: kPrimaryColor,),
                ),
                const Text(
                  'Messaging app',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: kPrimaryColor,
                  ),
                ),
        
              ],
            ),
            const SizedBox(height: 50),
            MyBtn(color: kPrimaryColor, title: 'Sign In', OnPressed: () {
              Navigator.pushNamed(context, SigninScreen.screenRoute);
            },),
            MyBtn(color: kSecondaryColor, title: 'Register', OnPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.screenRoute);
            },),
            Spacer( flex: 3,),
          ],
        ),
      ),
    );
  }

  AppBar WelcomeAppBar() {
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
      foregroundColor: Colors.white,
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded, size: 40, color: kSecondaryColor,))
      // ],
    );
  }
}

