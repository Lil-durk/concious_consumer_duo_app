import 'package:concious_consumer_duo_app/product_details.dart';
import 'package:concious_consumer_duo_app/scan_product.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

@override
class _HomePageState extends State<HomePage> {
  Color primary = const Color(0xff0f3f3c);
  late PageController pageController;
  int selectedPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          homeWidgets(),
        ],
      ),
    );
  }

  Widget homeWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 80.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hello, Itunuoluwa',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'images/avatar.jpg',
                  scale: 6,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ScanProductPage();
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0))),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SCAN A PRODUCT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                  Icon(
                    Icons.qr_code_scanner,
                    color: Colors.white,
                    size: 85.0,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          const Text(
            'Recently Scanned Products',
            style: TextStyle(fontSize: 22.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ProductDetailsPage();
                    }));
                  },
                  child: Container(
                    width: 190.0,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            color: Colors.white,
                          ),
                          child: Image.asset(
                            'images/milk.jpg',
                            height: 60.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(
                          width: 110.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'De Zaanse Hoeve semi-skimmed milk',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '€1,95',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Container(
                  width: 190.0,
                  decoration: BoxDecoration(
                      color: primary,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          'images/milk.jpg',
                          height: 60.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        width: 110.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'De Zaanse Hoeve semi-skimmed milk',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '€1,95',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ExpandablePageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (val) {
              setState(() {
                selectedPage = val;
              });
            },
            children: [
              for (int i = 0; i < 3; i++) ...{
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 5, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0))),
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Fun Fact',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            SizedBox(
                              width: 190.0,
                              child: Text(
                                'Over 11 million tonnes of plastic waste enter our oceans every year. Without action, this may triple by 2040.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'images/plastic.png',
                          height: 100.0,
                          fit: BoxFit.fitWidth,
                        )
                      ],
                    ),
                  ),
                ),
              }
            ],
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 3,
              position: selectedPage,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(50.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 90.0,
          ),
        ],
      ),
    );
  }
}
