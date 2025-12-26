import 'package:flutter/material.dart';

import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import 'grocery_list.dart';

class FilterGroceries extends StatefulWidget {
  const FilterGroceries({super.key});

  @override
  State<FilterGroceries> createState() => _FilterGroceriesState();
}

class _FilterGroceriesState extends State<FilterGroceries> {
  String searchKey = '';

  List<Grocery> get filteredItems {
    return dummyGroceryItems
        .where((g) => g.name.toLowerCase().contains(searchKey.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Search grocery',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(() {
                searchKey = value;
              });
            },
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return GroceryTile(grocery: filteredItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
