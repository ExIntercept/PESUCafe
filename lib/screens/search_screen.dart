import 'package:flutter/material.dart';
import 'package:pesucafe/models/cafe.dart';
import 'package:pesucafe/models/item.dart';

class SearchScreen extends StatefulWidget {
  final List<Cafe> cafes;

  SearchScreen({required this.cafes});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;
  late List<Item> _searchResults;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchResults = [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchItems(String query) {
    List<Item> results = [];
    for (var cafe in widget.cafes) {
      for (var item in cafe.menu) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          results.add(item);
        }
      }
    }
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: _searchItems,
          decoration: InputDecoration(
            hintText: 'Search items...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          Item item = _searchResults[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: ₹${item.price}'),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }
}
