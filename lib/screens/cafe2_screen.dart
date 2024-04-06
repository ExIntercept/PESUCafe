import 'package:flutter/material.dart';
import 'package:pesucafe/models/cafe.dart';
import 'package:pesucafe/models/item.dart';
import 'package:pesucafe/models/cart.dart'; // Import the Cart model

class Cafe2Screen extends StatelessWidget {
  final Cart cart; // Pass the cart instance to the screen

  Cafe2Screen({required this.cart}); // Receive the cart instance in the constructor

  @override
  Widget build(BuildContext context) {
    // Retrieve Cafe data
    Cafe cafe = Cafe(
      name: 'Cantina',
      imageURL: 'https://i.imgur.com/345Ijva.jpeg',
      menu: [
        Item(
          name: 'Mango Milkshake',
          price: 80, // Updated cost
          rating: 4.5, // Updated rating
          imageURL: 'https://i.imgur.com/mIHPjlu.jpeg',
        ),
        Item(
          name: 'Masala Dosa',
          price: 100,
          rating: 4.6, // Updated rating
          imageURL: 'https://i.imgur.com/zKgdN5x.jpeg',
        ),
        Item(
          name: 'Paneer Butter Masala',
          price: 150, // Updated cost
          rating: 4.3,
          imageURL: 'https://i.imgur.com/mdsJad1.jpeg',
        ),
        Item(
          name: 'Vanilla Pastry',
          price: 50, // Updated cost
          rating: 4.2, // Updated rating
          imageURL: 'https://i.imgur.com/KixAeXZ.jpeg',
        ),
        Item(
          name: 'Plain Rice',
          price: 30, // Updated cost
          rating: 4.8, // Updated rating
          imageURL: 'https://i.imgur.com/xtUlwRB.jpeg',
        ),
        Item(
          name: 'Rajma',
          price: 120, // Updated cost
          rating: 4.4, // Updated rating
          imageURL: 'https://i.imgur.com/wTSBGYR.jpeg',
        ),
        Item(
          name: 'Shawarma',
          price: 90, // Updated cost
          rating: 4.7, // Updated rating
          imageURL: 'https://i.imgur.com/YscwtzT.jpeg',
        ),
        Item(
          name: 'Seekh Kebabs',
          price: 110, // Updated cost
          rating: 4.6, // Updated rating
          imageURL: 'https://i.imgur.com/I1a0cbz.jpeg',
        ),
        // Add more items as needed
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text(cafe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox( // Wrap the GridView.builder with a SizedBox
          height: double.infinity, // Set the height to fill available space
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3.25, // Adjusted child aspect ratio
            ),
            itemCount: cafe.menu.length,
            itemBuilder: (context, index) {
              Item item = cafe.menu[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 3, // Adjusted flex value
                      child: Container(
                        color: Colors.grey[300],
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                          child: Image.network(
                            item.imageURL,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: Center(
                                  child: Icon(Icons.image_not_supported, size: 50),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2, // Adjusted flex value
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Rating: ${item.rating} ⭐'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\₹${item.price}'),
                                IconButton(
                                  icon: Icon(Icons.add_shopping_cart),
                                  onPressed: () {
                                    // Add item to the cart when the button is pressed
                                    cart.addItem(item);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
