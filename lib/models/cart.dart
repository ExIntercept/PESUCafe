import 'package:pesucafe/models/item.dart';

class Cart {
  Map<Item, int> items = {}; // Map to store items and their quantities

  // Method to remove an item from the cart
  void removeItem(Item item) {
    if (items.containsKey(item)) {
      if (items[item] == 1) {
        items.remove(item); // Remove the item if it's the last one
      } else {
        items.update(item, (value) => value - 1); // Decrement quantity
      }
    }
  }

  // Method to add an item to the cart
  void addItem(Item item) {
    items.update(item, (value) => value + 1, ifAbsent: () => 1); // Increment quantity or add new item
  }

  // Calculate total number of occurrences of an item in the cart
  int getItemCount(Item item) {
    return items[item] ?? 0; // Return the quantity of the specified item, or 0 if it doesn't exist
  }

  // Calculate total amount of items in the cart
  double get totalAmount {
    return items.entries.fold(0, (previousValue, entry) => previousValue + entry.key.price * entry.value);
  }
}
