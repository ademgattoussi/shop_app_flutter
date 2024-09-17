import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/models/product.dart';
import 'package:cartelly_shop/screens/chat_screen.dart';
import 'package:cartelly_shop/screens/details_screen.dart';
import 'package:cartelly_shop/screens/welcome_screen.dart';
import 'package:cartelly_shop/widgets/home/product_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: kDefaultPadding / 2),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) => ProductCard(
                      itemIndex: index,
                      product: products[index],
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: products[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
                );
              },
              child: const Icon(Icons.support_agent, size: 30),
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
              elevation: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
