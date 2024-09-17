import 'package:cartelly_shop/models/constants.dart';
import 'package:cartelly_shop/models/product.dart';
import 'package:cartelly_shop/widgets/details/details_body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailsAppBar(), 
      body: DetailsBody(product: product,),
      backgroundColor: kPrimaryColor,
    );
  }

  AppBar detailsAppBar() {
    return AppBar(
      foregroundColor: kPrimaryColor,
      backgroundColor: kBackgroundColor,
      // leading: IconButton(
      //   padding: EdgeInsets.only(right: kDefaultPadding),
      //   icon: Icon(Icons.arrow_back,
      //   color: kPrimaryColor,), onPressed: () {  },
      //   ),
      title: const Text("Product Details"),
    );
  }
}
