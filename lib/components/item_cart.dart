import 'package:flutter/material.dart';
import 'package:ui_shopapp/components/details_screen.dart';
import 'package:ui_shopapp/constants.dart';
import 'package:ui_shopapp/models/product.dart';

class ItemCart extends StatelessWidget {
  final Product product;
  final dynamic indexproduct;
  const ItemCart({Key? key, required this.product, this.indexproduct})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  product: products[indexproduct],
                )));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: 180,
            width: 160,
            child:
                Hero(tag: "${product.id}", child: Image.asset(product.image)),
            decoration: BoxDecoration(
                color: product.color, borderRadius: BorderRadius.circular(16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              product.title,
              style: const TextStyle(color: kTextlightColor),
            ),
          ),
          Text(
            '\$${product.price}',
            style:
                const TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          )
        ],
      ),
    );
  }
}
