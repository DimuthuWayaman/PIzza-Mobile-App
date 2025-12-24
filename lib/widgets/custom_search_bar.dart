import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              icon: Icon(CupertinoIcons.search, color: Colors.grey[600]),
              hintText: 'Search your pizza here...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
