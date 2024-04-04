import 'package:concious_consumer_duo_app/faq.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Barcode Scanner App'),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            ProductDetailsPage(),
            ScanProductPage(),
            FaqPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
