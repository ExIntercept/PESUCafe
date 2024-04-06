// main.dart
import 'package:flutter/material.dart';
import 'package:pesucafe/screens/home_screen.dart';
import 'package:pesucafe/screens/cart_screen.dart';
import 'package:pesucafe/screens/account_screen.dart';
import 'package:pesucafe/models/cart.dart'; // Import the Cart class

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Cart(); // Create an instance of Cart

    return MaterialApp(
      title: 'Pesu Cafe',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(cart: cart), // Pass the cart instance to MyHomePage
      routes: {
        '/cart': (context) => CartScreen(cart: cart), // Pass the cart instance to CartScreen
        '/account': (context) => AccountScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Cart cart; // Declare cart as a property

  MyHomePage({required this.cart}); // Receive the cart instance

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define a method to build the list of widget options
  List<Widget> _buildWidgetOptions() {
    return [
      HomeScreen(cart: widget.cart), // Pass the cart instance to HomeScreen
      // Add other screens here
    ];
  }

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.pushNamed(context, '/cart');
    } else if (index == 3) {
      Navigator.pushNamed(context, '/account');
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = _buildWidgetOptions(); // Build the list of widget options here

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
