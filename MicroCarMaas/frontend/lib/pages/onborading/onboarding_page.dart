import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/constants/appColors.dart';
import 'package:frontend/pages/onborading/onboarding_items.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage(
      {super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Scaffold(
      body: PageView.builder(
          onPageChanged: (index) =>
              setState(() => isLastPage = controller.items.length - 1 == index),
          itemCount: controller.items.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 165,
                  ),
                  Container(
                    width: deviceWidth,
                    child: Image.asset(controller.items[index].image),
                  ),
                  //Image.asset(controller.items[index].image),
                  const SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      controller.items[index].title,
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 25),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Container(
                      child: isLastPage
                          ? getStarted()
                          : Column(
                              children: [
                                SmoothPageIndicator(
                                  controller: pageController,
                                  count: controller.items.length,
                                  onDotClicked: (index) =>
                                      pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 600),
                                          curve: Curves.easeIn),
                                  effect: const WormEffect(
                                    dotHeight: 12,
                                    dotWidth: 12,
                                    dotColor: Color.fromRGBO(55, 149, 143, 0.5),
                                    activeDotColor:
                                        Color.fromRGBO(55, 149, 143, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),

                                //Next Button
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30),
                                  child: Container(
                                      height: 55,
                                      width: deviceWidth,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              elevation: 15,
                                              backgroundColor: Color.fromRGBO(
                                                  53, 149, 143, 1)),
                                          onPressed: () {
                                            pageController.nextPage(
                                                duration: const Duration(
                                                    milliseconds: 600),
                                                curve: Curves.easeIn);
                                          },
                                          child: Text(
                                            "DEVAM ET",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ))),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget getStarted() {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                dotColor: Color.fromRGBO(55, 149, 143, 0.5),
                activeDotColor: Color.fromRGBO(55, 149, 143, 1),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 11,
                    backgroundColor: Color.fromRGBO(53, 149, 143, 1)),
                onPressed: () async {
                  final pres = await SharedPreferences.getInstance();
                  pres.setBool("onboarding", true);
                  if (!mounted) return;
                  context.goNamed("Login");
                },
                child: const Text(
                  "BİTTİ",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
