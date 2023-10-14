// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:ui_challenge/config/style.dart';
import 'package:ui_challenge/model/product_model.dart';

import '../config/size_config.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

final PageController _pageController = PageController();

List<String> imageList = [
  "assets/images/01.png",
  "assets/images/05.png",
  "assets/images/06.png",
  "assets/images/02.png",
];

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kbackgroung,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderDetails(),
            const CarrousselImage(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.name,
                    style: productTextStyle.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product.description,
                    style: productTextStyle,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: SizeConfig.blockHorizontal! * 50,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                color: Kgreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const DetailTemperature(),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total price",
                            style: detailtyle.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$ ${widget.product.price}",
                            style: detailtyle.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: KgreenSecond,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          "Add to Cart",
                          style: detailtyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailTemperature extends StatelessWidget {
  const DetailTemperature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailIcon(
            firstText: "Heigth",
            secondtext: "30cm - 40cm",
            iconData: Icons.dew_point,
          ),
          DetailIcon(
            firstText: "Temperature",
            secondtext: "30 C  to  40 C",
            iconData: Icons.thermostat,
          ),
          DetailIcon(
            firstText: "Pot",
            secondtext: "Ciramic Pot",
            iconData: Icons.local_florist,
          ),
        ],
      ),
    );
  }
}

class DetailIcon extends StatelessWidget {
  const DetailIcon({
    Key? key,
    required this.firstText,
    required this.secondtext,
    required this.iconData,
  }) : super(key: key);

  final String firstText;
  final String secondtext;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(height: 5),
        Text(firstText, style: detailtyle),
        const SizedBox(height: 10),
        Text(
          secondtext,
          style:
              detailtyle.copyWith(fontWeight: FontWeight.normal, fontSize: 10),
        ),
      ],
    );
  }
}

class CarrousselImage extends StatelessWidget {
  const CarrousselImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: SizeConfig.blockVertical! * 40,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: imageList.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Image.asset(
                imageList[index],
                fit: BoxFit.contain,
              );
            },
          ),
        ),
        Positioned(
          top: 330,
          right: 50,
          child: Transform.rotate(
            angle: 1.5708, // 90 degrés en radians
            child: SmoothPageIndicator(
              controller: _pageController,
              count: imageList.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Kgreen,
                dotColor: Colors.grey,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, size: 30),
          ),
        ],
      ),
    );
  }
}
