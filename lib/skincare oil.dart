import 'package:flutter/material.dart';
import 'cartpag.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SkincareOil(),
  ));
}

class SkincareOil extends StatelessWidget {
  const SkincareOil({super.key});

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
                    icon: Icon(Icons.arrow_back, color: Colors.pink),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.pink),
                  ),
                ],
              ),
              SizedBox(height: 16),
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
                        'images/skin detail.png', // Ensure this path is correct
                        height: 300, // Adjust as needed
                        width: double.infinity, // Ensures it stretches to the container width
                        fit: BoxFit.cover, // Adjusts how the image fits within the container
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
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
              SizedBox(height: 40),
              // Product Name, Price, and Description
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Hanuven Skin Care Oil',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '₹ 399',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Hanuven Skin Care Oil combines Ayurvedic ingredients like Turmeric, Sandalwood, and Neem to nourish and rejuvenate your skin. Free from harsh chemicals.',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
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
                            'title': 'Hanuven Skin Care Oil',
                            'price': 399,
                            'quantity': 1,
                            'image': 'images/skin detail.png',
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Add to Bag',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
