import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/models/product.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,  required this.itemIndex, required this.product, required this.press,
  });

  final int itemIndex;
  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding
      ),
      height: 190.0,
      child: InkWell(
        onTap: () => press(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 166.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding) ,
                height: 160,
                width: 200,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                )
              ),
            ),
            Positioned(
              bottom: -10,
              right: 0,
              child: SizedBox(
                height: 163,
                width: size.width - 200,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        product.title,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 26, // Adjust size to fit better
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: Text(
                        textAlign: TextAlign.center,
                        product.subTitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18, // Adjust size if needed
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding / 1.5,
                        vertical: kDefaultPadding / 5,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(22)
                      ),
                      child: Text(
                        "price: ${product.price}€",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16, // Adjust size to match design
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
