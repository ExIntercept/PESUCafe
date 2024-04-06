import 'package:flutter/material.dart';
import '../models/item.dart';

class CafeItem extends StatelessWidget {
  final Item item;

  CafeItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          // Add item to cart logic here
        },
      ),
    );
  }
}
