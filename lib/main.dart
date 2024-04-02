import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Wrap Scaffold with MaterialApp
      home: Scaffold(
        appBar: AppBar(
          title: Text('Barcode Scanner App'),
        ),
        body: Center(
          child: Text('This is the main screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.scanner),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
          currentIndex: 0, // Set the initial selected item
          selectedItemColor: Colors.blue, // Color for selected item
          unselectedItemColor: Colors.grey, // Color for unselected items
          onTap: (int index) {
            // Handle item selection
            switch (index) {
              case 0:
                // Navigate to home screen
                break;
              case 1:
                // Navigate to scan screen
                break;
              case 2:
                // Navigate to history screen
                break;
            }
          },
        ),
      ),
    );
  }
}
