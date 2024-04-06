import 'package:pesucafe/models/item.dart';

class Cafe {
  final String name;
  final String imageURL;
  final List<Item> menu; // Add this property to hold menu items
  

  Cafe({
    required this.name,
    required this.imageURL,
    required this.menu,
  });
}
