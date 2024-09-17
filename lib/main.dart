import 'package:cartelly_shop/screens/chat_screen.dart';
import 'package:cartelly_shop/screens/home_screen.dart';
import 'package:cartelly_shop/screens/registration_screen.dart';
import 'package:cartelly_shop/screens/signin_screen.dart';
import 'package:cartelly_shop/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:cartelly_shop/models/constants.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartelly store',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.screenRoute,
      routes: {
        HomeScreen.screenRoute: (context) => const HomeScreen(),
        WelcomeScreen.screenRoute: (context) => const WelcomeScreen(),
        SigninScreen.screenRoute: (context) => const SigninScreen(),
        RegistrationScreen.screenRoute: (context) => const RegistrationScreen(),
        ChatScreen.screenRoute: (context) => const ChatScreen(),
        },
    );
  }
}