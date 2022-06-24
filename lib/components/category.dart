
import 'package:flutter/material.dart';
import 'package:ui_shopapp/constants.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _Category createState() => _Category();
}

class _Category extends State<Category> {
  List<String> category = ["Túi xách tay", "Đồ trang sức", "Giầy dép", "Váy đầm"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:20 ),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectIndex = index ;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category[index],
              style:  TextStyle(fontWeight: FontWeight.bold,
                  color: selectIndex == index ? kTextColor : kTextlightColor),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: selectIndex == index ? kTextColor : kTextlightColor,
            )
          ],
        ),
      ),
    );
  }
}
