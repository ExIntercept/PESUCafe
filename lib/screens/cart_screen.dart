import 'package:flutter/material.dart';
import 'package:pesucafe/models/cart.dart'; // Import the cart model
import 'package:pesucafe/models/item.dart';
import 'package:pesucafe/screens/payment_screen.dart';

class CartScreen extends StatefulWidget {
  final Cart cart; // Receive the cart instance

  CartScreen({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cart.items.length,
        itemBuilder: (context, index) {
          final MapEntry<Item, int> entry = widget.cart.items.entries.toList()[index];
          final Item item = entry.key; // Get the item from the map entry
          final int quantity = entry.value; // Get the quantity from the map entry
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Quantity: $quantity'), // Display the quantity
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                setState(() {
                  widget.cart.removeItem(item); // Remove the item from the cart map
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \₹${widget.cart.totalAmount.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 16.0),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the payment screen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(totalAmount: widget.cart.totalAmount,),
                    ),
                  );
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
