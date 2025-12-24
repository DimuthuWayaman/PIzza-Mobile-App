import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final ValueChanged<String>? onCategorySelected;
  const CategoryList({super.key, this.onCategorySelected});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // Dummy list of pizza categories
  final List<String> categories = [
    'All',
    'Margherita',
    'Pepperoni',
    'BBQ Chicken',
    'Veggie',
    'Hawaiian',
    'Meat Lovers',
    'Supreme',
  ];
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onCategorySelected?.call(categories[index]);
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.0, left: index == 0 ? 16 : 0,bottom: 12.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.redAccent : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: Colors.redAccent.withOpacity(0.5),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
