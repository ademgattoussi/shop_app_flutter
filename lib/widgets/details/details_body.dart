import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/models/product.dart';
import 'package:cartelly_shop/screens/chat_screen.dart';
import 'package:cartelly_shop/screens/welcome_screen.dart';
import 'package:cartelly_shop/widgets/details/color_dot.dart';
import 'package:cartelly_shop/widgets/details/order_button.dart';
import 'package:cartelly_shop/widgets/details/product_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody({super.key, required this.product});
  final _auth = FirebaseAuth.instance;

  final Product product;

  @override
  Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          // height: 300.0,
          decoration: const BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: ProductImage(size: size, image: product.image,)),
              ColorSelect(colors: product.colors),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
              ),
              Row(
                children: [
                  Text(
                    "Prix : ${product.price}€",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  Container(
            padding: const EdgeInsets.only(
              left: 50,
            ),
            child: OrderNowBtn(
              product: product,
            ),)
                ],
                
              ),
              const SizedBox(
                height: kDefaultPadding ,
              ),

            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kDefaultPadding /2),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding *1.5,
            vertical: kDefaultPadding / 2,
          ),
          child: Text(
            product.description,
            style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding *1.5,
              vertical: kDefaultPadding / 2,
            ),
            child:ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,  // Ensures the button doesn't take up full width
                children: const [
                  Icon(Icons.support_agent, size: 40),  // Add the support icon
                  SizedBox(width: 8),  // Add some space between the icon and the text
                  Text(
                    "Ask Support",
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),

          ),
        ),
        ],
    );
  }
}
