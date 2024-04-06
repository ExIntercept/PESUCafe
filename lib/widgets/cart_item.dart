import 'package:flutter/material.dart';
import '../models/item.dart';

class CartItem extends StatelessWidget {
  final Item item;

  CartItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.remove),
        onPressed: () {
          // Remove item from cart logic here
        },
      ),
    );
  }
}
