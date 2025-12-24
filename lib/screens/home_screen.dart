import 'package:flutter/material.dart';
import 'package:pizza_app/widgets/category_list.dart';
import 'package:pizza_app/widgets/custom_search_bar.dart';
import 'package:pizza_app/widgets/filter_icon.dart';
import 'package:pizza_app/widgets/pizza_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [CustomSearchBar(), SizedBox(width: 8), FilterIcon()],
              ),
            ),
            SizedBox(height: 16),
            CategoryList(
              onCategorySelected: (cat) {
                setState(() {
                  selectedCategory = cat;
                });
              },
            ),
            SizedBox(height: 8),
            PizzaGrid(selectedCategory: selectedCategory),
          ],
        ),
      ),
    );
  }
}
