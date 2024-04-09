import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final List<String> nutritionalValues = [
    'Calories: 365 kcal',
    'Fat: 3g',
    'Saturated fat: 1.5g',
    'Carbohydrates: 12g',
    'Sugars: 5g',
    'Protein: 3g',
  ];

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/ecoscore.png',
                    width: 90,
                    height: 100,
                  ),
                  const SizedBox(width: 16.0),
                  Image.asset(
                    'images/milk.jpg',
                    width: 100,
                    height: 200,
                  ),
                  const SizedBox(width: 16.0),
                  Image.asset(
                    'images/nutriscore.png',
                    width: 80,
                    height: 100,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Zaanse Hoeve halfvolle milk',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    '\€1,95',
                    style: TextStyle(fontSize: 16.0, color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () => showNutritionalInfo(context),
                  ),
                  const Text('Nutritional Values'),
                ],
              ),
              const SizedBox(height: 8.0),
              Wrap(
                runSpacing: 16.0,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/vegan.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text('Vegan'),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/betterfor.gif',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text('Better for cow, nature and farmer'),
                    ],
                  ),
                  const SizedBox(width: 20.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/glutenfree.avif',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text('Gluten free'),
                    ],
                  ),
                  const SizedBox(width: 50.0),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'images/weidemelk.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text('Weidemelk'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNutritionalInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Nutritional Information'),
        children: nutritionalValues
            .map((value) => ListTile(
                  title: Text(value),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedValue = value;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
