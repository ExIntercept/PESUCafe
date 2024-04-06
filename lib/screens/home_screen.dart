// home_screen.dart
import 'package:flutter/material.dart';
import 'package:pesucafe/screens/cafe1_screen.dart'; // Import the individual cafe screens
import 'package:pesucafe/screens/cafe2_screen.dart';
import 'package:pesucafe/screens/cafe3_screen.dart';
import 'package:pesucafe/models/cart.dart'; // Import the Cart model

class HomeScreen extends StatelessWidget {
  final Cart cart; // Pass the cart instance to HomeScreen

  HomeScreen({required this.cart}); // Receive the cart instance in the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.yellow,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesu Cafe',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Pes University',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: NetworkImage('https://i.imgur.com/fRcj3OF.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150.0,
              margin: EdgeInsets.only(bottom: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'SHOP BY CAFETERIA',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: 3, // Total number of cafes
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cafe1Screen(cart: cart),
                            ),
                          );
                          break;
                        case 1:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cafe2Screen(cart: cart),
                            ),
                          );
                          break;
                        case 2:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Cafe3Screen(cart: cart),
                            ),
                          );
                          break;
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.network(
                          // Provide different images for each cafe
                          index == 0
                              ? 'https://i.imgur.com/4PegvoN.jpeg' // Image for Cafe 1
                              : index == 1
                                  ? 'https://i.imgur.com/DeEXgXT.jpeg' // Image for Cafe 2
                                  : 'https://i.imgur.com/345Ijva.jpeg', // Image for Cafe 3
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
