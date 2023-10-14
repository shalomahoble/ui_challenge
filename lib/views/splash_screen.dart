import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ui_challenge/components/next_button.dart';
import 'package:ui_challenge/config/size_config.dart';
import 'package:ui_challenge/config/style.dart';
import 'package:ui_challenge/views/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();

  bool started = false;

  List<String> imageList = [
    "assets/images/01.png",
    "assets/images/05.png",
    "assets/images/06.png",
    "assets/images/02.png",
  ];

  void skip() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }

  void nextImage() {
    _pageController.addListener(() {
      if (_pageController.page == imageList.length - 1) {
        setState(() {
          started = !started;
        });
      }
    });
    _pageController.nextPage(
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kbackgroung,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: SizeConfig.blockHorizontal! * 20),
                SizedBox(
                  height: SizeConfig.blockHorizontal! * 100,
                  child: PageView.builder(
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
                // SizedBox(height: SizeConfig.blockHorizontal! * 0.1),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: imageList.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Kgreen,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: skip,
              child: const SkpiButton(),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Enjoy You",
                    style: welcomeStyle,
                    textAlign: TextAlign.start,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Life With ",
                      style: welcomeStyle,
                      children: [
                        TextSpan(
                          text: " Plants",
                          style: welcomeStyle.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0.85),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  started
                      ? OutlinedButton(
                          onPressed: skip,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Kgreen),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry?>(
                              const EdgeInsets.all(20),
                            ),
                          ),
                          child: Text("Get Started", style: btnTextStyle),
                        )
                      : NextButton(onTap: nextImage),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SkpiButton extends StatelessWidget {
  const SkpiButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: const AlignmentDirectional(1, -1),
        child: Text("Skip", style: skipStyle),
      ),
    );
  }
}
