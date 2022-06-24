import 'package:flutter/material.dart';
import 'package:ui_shopapp/components/body_details.dart';
import 'package:ui_shopapp/models/product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: product.color,
      body: BodyDetail(product: product,),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}

