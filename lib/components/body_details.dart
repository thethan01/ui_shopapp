import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_shopapp/constants.dart';
import 'package:ui_shopapp/models/product.dart';

class BodyDetail extends StatelessWidget {
  final Product product;

  const BodyDetail({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  height: 520,
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPadding,
                      right: kDefaultPadding),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    children: [
                      colorAndSize(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding),
                        child: Text(
                          product.description,
                          style:
                              const TextStyle(height: 1.5, color: kTextColor),
                        ),
                      ),
                      SizedBox(height: 20,),
                      counterAndHeart(),
                      SizedBox(height: 40,),
                      addToCart()
                    ],
                  ),
                ),
                buildPadding()
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding addToCart() {
    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: kDefaultPadding),
                            height: 50,
                            width: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: product.color)),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/icons/add_to_cart.svg",
                                color: product.color,
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: FlatButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                                ),
                                color: product.color,
                                onPressed: (){},
                                child: const Text("MUA NGAY",style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
  }

  Row counterAndHeart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CouterProduct(),
        Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            color: Color(0xffff6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }

  Row colorAndSize() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Color'),
              Row(
                children: const [
                  DotColor(
                    color: Color(0xff356c95),
                  ),
                  DotColor(
                    color: Color(0xfff8c078),
                  ),
                  DotColor(
                    color: Color(0xffa29b9b),
                  )
                ],
              )
            ],
          ),
        ),
        sizeProduct()
      ],
    );
  }

  Expanded sizeProduct() {
    return Expanded(
      child: RichText(
          text: TextSpan(children: [
        const TextSpan(text: 'Size\n', style: TextStyle(color: kTextColor)),
        TextSpan(
            text: "${product.size}cm",
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold))
      ])),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Túi xách tay ',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(text: 'Giá\n'),
                TextSpan(
                    text: "\$${product.price}",
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold))
              ])),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(
                product.image,
                fit: BoxFit.fill,
              ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class DotColor extends StatelessWidget {
  final Color color;
  const DotColor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 10),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: Colors.black)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class CouterProduct extends StatefulWidget {
  const CouterProduct({Key? key}) : super(key: key);
  @override
  State<CouterProduct> createState() => _CouterProductState();
}

class _CouterProductState extends State<CouterProduct> {
  int num = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 32,
          width: 40,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              setState(() {
                if (num > 1) {
                  num--;
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            num.toString().padLeft(2, '0'),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 32,
          width: 40,
          child: OutlineButton(
            padding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            onPressed: () {
              setState(() {
                num++;
              });
            },
            child: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
