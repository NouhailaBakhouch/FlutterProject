import 'package:flutter/material.dart';
import 'package:mohammed/Screens/CartScreen.dart';
import 'package:mohammed/Screens/ProfileScreen.dart';
import 'Home.dart'; // Assurez-vous que ce fichier existe avec HomeScreen
import 'Search.dart'; // Assurez-vous que ce fichier existe avec SearchScreen

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;

  final List<Widget> pageList = [
    const HomeScreen(),
    const SearchScreen(),
    const Cartscreen(),
    const Profilescreen(),
    Scaffold(
      appBar: AppBar(title: Text('Cart Page')),
      body: Center(child: Text('Cart Page')),
    ),
    Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(child: Text('Profile Page')),
    ),
  ];

  void selectPage(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selected,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
