import 'package:flutter/material.dart';
import 'cartpag.dart'; // Ensure '13.dart' contains the CartPage implementation.

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HairOilPage(),
  ));
}

class HairOilPage extends StatelessWidget {
  const HairOilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button and Favorite Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.pink),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Product Image with Best Seller Tag
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.pink, width: 2),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'images/hair detail.png', // Ensure correct path
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'BEST SELLER',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Expanded widget to adjust to available space
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Product Name and Price
                    const Text(
                      'Hanuven Hair Nourishing Oil',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '₹ 399',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Product Description
                    Text(
                      'Hanuven Hair Oil, enriched with Ayurvedic herbs like Amla and Bhringraj, nourishes your scalp, strengthens hair, and reduces hair fall. It promotes healthy growth, fights dandruff, and adds shine naturally. Free from chemicals, it\'s a gentle, effective solution for strong, beautiful hair.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    // Tags Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTag('Cruelty Free'),
                        const SizedBox(width: 8),
                        _buildTag('Vegan'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Other Benefits Dropdown
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Other benefits',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.pink,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.pink),
                      ],
                    ),
                  ],
                ),
              ),
              // Add to Bag Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(
                          newItem: {
                            'title': 'Hair Nourishing Oil',
                            'price': 399,
                            'quantity': 1,
                            'image': 'images/hair detail.png', // Updated path
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Add to bag',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
