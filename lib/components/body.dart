import 'package:flutter/material.dart';
import 'package:ui_shopapp/components/category.dart';
import 'package:ui_shopapp/components/item_cart.dart';
import 'package:ui_shopapp/constants.dart';
import 'package:ui_shopapp/models/product.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            'Phụ Nữ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        const Category(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) => ItemCart(
                product: products[index],indexproduct: index ,),
          ),
        ))
      ],
    );
  }
}
