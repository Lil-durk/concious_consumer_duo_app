import 'package:concious_consumer_duo_app/faq_page.dart';
import 'package:concious_consumer_duo_app/home_page.dart';
import 'package:concious_consumer_duo_app/product_details.dart';
import 'package:concious_consumer_duo_app/scan_product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: const Color(0xff0f3f3c),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff0f3f3c),
          secondary: const Color(0xff0f3f3c),
        ),
      ),
      routes: {
        '/home': (context) => const HomePage(),
      },
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            HomePage(),
            ProductDetailsPage(),
            ScanProductPage(),
            FaqPage(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xff0f3f3c),
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff0f3f3c),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.production_quantity_limits),
                  label: 'Product details',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.barcode_reader),
                  label: 'Scan',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer),
                  label: 'FAQ',
                ),
              ],
              currentIndex: currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
