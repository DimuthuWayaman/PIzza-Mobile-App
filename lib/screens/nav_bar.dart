import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pizza_app/screens/home_screen.dart';
import 'package:pizza_app/screens/profile_screen.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final List<Widget> _tabs = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    ProfileScreen(),
  ];
  final List<GButton> bottomNavBarItems = const [
    GButton(icon: Icons.home, text: 'Home'),
    GButton(icon: Icons.favorite, text: 'Favorites'),
    GButton(icon: Icons.shopping_cart, text: 'Cart'),
    GButton(icon: Icons.person, text: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          IndexedStack(index: selectedIndex, children: _tabs),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(-2, 4),
                  ),
                ],
              ),
              child: GNav(
                tabs: bottomNavBarItems,
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                style: GnavStyle.google,
                activeColor: Colors.white,
                gap: 8.0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 400),
                tabBackgroundGradient: const LinearGradient(
                  colors: [Colors.redAccent, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                haptic: true,
                tabBorderRadius: 12.0,
                tabMargin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                color: Colors.grey[600],
                rippleColor: Colors.redAccent.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.all(8.0),
      //   clipBehavior: Clip.antiAlias,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(16.0),
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(0.3),
      //         blurRadius: 8,
      //         offset: const Offset(0, 4),
      //       ),
      //     ],
      //   ),
      //   child: GNav(
      //     tabs: bottomNavBarItems,
      //     selectedIndex: selectedIndex,
      //     onTabChange: (index) {
      //       setState(() {
      //         selectedIndex = index;
      //       });
      //     },
      //     style: GnavStyle.google,
      //     activeColor: Colors.white,
      //     gap: 8.0,
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      //     curve: Curves.easeInOut,
      //     duration: const Duration(milliseconds: 400),
      //     tabBackgroundGradient: const LinearGradient(
      //       colors: [Colors.redAccent, Colors.deepOrange],
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //     ),
      //     haptic: true,
      //     tabBorderRadius: 12.0,
      //     tabMargin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      //     color: Colors.grey[600],
      //     rippleColor: Colors.redAccent.withOpacity(0.2),
      //   ),
      // ),

    );
  }
}
