import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final Map<String, dynamic> newItem;

  const CartPage({super.key, required this.newItem});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _addToCart(widget.newItem);
  }

  void _addToCart(Map<String, dynamic> newItem) {
    // Check if the item is already in the cart
    final index =
        _cartItems.indexWhere((item) => item['title'] == newItem['title']);
    if (index >= 0) {
      setState(() {
        _cartItems[index]['quantity'] += newItem['quantity'];
      });
    } else {
      setState(() {
        _cartItems.add(newItem);
      });
    }
  }

  int _calculateTotal() {
    return _cartItems.fold(
      0,
      (total, item) =>
          total + ((item['price'] as int) * (item['quantity'] as int)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Back Button and Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const Text(
                    "Your Cart",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Cart Items
              Expanded(
                child: _cartItems.isEmpty
                    ? Center(
                        child: Text(
                          'Your cart is empty!',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _cartItems.length,
                        itemBuilder: (context, index) {
                          final item = _cartItems[index];
                          return _buildCartItem(item);
                        },
                      ),
              ),
              // Total and Checkout Button
              if (_cartItems.isNotEmpty) ...[
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹ ${_calculateTotal()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                    onPressed: () {},
                    child: const Text(
                      'Proceed to Checkout',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(item['image'], width: 50, height: 50),
        title: Text(item['title']),
        subtitle: Text('₹ ${item['price']} x ${item['quantity']}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (item['quantity'] > 1) {
                    item['quantity']--;
                  } else {
                    _cartItems.remove(item);
                  }
                });
              },
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text('${item['quantity']}'),
            IconButton(
              onPressed: () {
                setState(() {
                  item['quantity']++;
                });
              },
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ),
    );
  }
}
