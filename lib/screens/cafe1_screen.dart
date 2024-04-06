import 'package:flutter/material.dart';
import 'package:pesucafe/models/cafe.dart';
import 'package:pesucafe/models/item.dart';
import 'package:pesucafe/models/cart.dart'; // Import the Cart model

class Cafe1Screen extends StatelessWidget {
  final Cart cart; // Pass the cart instance to the screen

  Cafe1Screen({required this.cart}); // Receive the cart instance in the constructor

  @override
  Widget build(BuildContext context) {
    // Retrieve Cafe data
    Cafe cafe = Cafe(
      name: 'Food Court',
      imageURL: 'https://i.imgur.com/345Ijva.jpeg',
      menu: [
        Item(
          name: 'Pizza',
          price: 120, // Updated cost
          rating: 4.8, // Updated rating
          imageURL: 'https://i.imgur.com/jVyOcAe.jpeg',
        ),
        Item(
          name: 'Biryani',
          price: 100,
          rating: 4.5,
          imageURL: 'https://i.imgur.com/tIRixHG.jpeg',
        ),
        Item(
          name: 'Burger',
          price: 70,
          rating: 4.3,
          imageURL: 'https://i.imgur.com/UhqcpOW.jpeg',
        ),
        Item(
          name: 'Butter Naan',
          price: 40, // Updated cost
          rating: 4.2, // Updated rating
          imageURL: 'https://i.imgur.com/zLAtDiC.jpeg',
        ),
        Item(
          name: 'Chicken Curry',
          price: 60,
          rating: 4.0,
          imageURL: 'https://i.imgur.com/bStaEsO.jpeg',
        ),
        Item(
          name: 'Cold Coffee',
          price: 55,
          rating: 4.5,
          imageURL: 'https://i.imgur.com/usSSHzl.jpeg',
        ),
        Item(
          name: 'Chocolate Icecream',
          price: 80, // Updated cost
          rating: 3.5, // Updated rating
          imageURL: 'https://i.imgur.com/WWziSSY.jpegg',
        ),
        
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
