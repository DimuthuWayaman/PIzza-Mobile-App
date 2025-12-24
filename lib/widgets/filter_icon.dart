import 'package:flutter/material.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle filter icon tap
      },
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.filter_list,
          color: Colors.black,
        ),
      ),
    );
  }
}
