// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ui_challenge/config/size_config.dart';
import 'package:ui_challenge/config/style.dart';
import 'package:ui_challenge/model/product_model.dart';
import 'package:ui_challenge/views/detail.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    void goToDetailSreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(product: product),
        ),
      );
    }

    SizeConfig().init(context);
    return GestureDetector(
      onTap: () => goToDetailSreen(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: SizeConfig.blockHorizontal! * 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Image.asset(
              product.image,
              height: SizeConfig.blockHorizontal! * 40,
            ),
            Text(product.name, style: productTextStyle),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ ${product.price}", style: priceStyle),
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
