import 'package:flutter/material.dart';
import 'package:mohammed/Screens/LaptopScreen.dart';
import 'package:mohammed/Screens/WatchPage.dart';
import 'package:mohammed/Widget/prodwidget.dart';
import 'package:mohammed/Screens/LaptopScreen.dart'; // Importation des pages nécessaires

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.mobile_friendly, 'title': 'Iphone'},
    {'icon': Icons.computer_outlined, 'title': 'Laptop', 'screen': ProdwidgetLaptop()},
    {'icon': Icons.watch, 'title': 'Watches', 'screen': WatchPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo ou icône principale
                Center(
                  child: Icon(
                    Icons.shopping_cart,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),

                // Titre principal
                Center(
                  child: Text(
                    'Welcome to E-Commerce',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // Sous-titre
                Center(
                  child: Text(
                    'Browse and shop your favorite items!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                SizedBox(height: 30),

                // Liste des catégories
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigation vers la page correspondante
                            if (categories[index]['screen'] != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => categories[index]['screen'],
                                ),
                              );
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                categories[index]['icon'],
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              SizedBox(height: 5),
                              Text(
                                categories[index]['title'],
                                style: TextStyle(color: Colors.grey[800]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),

                // Titre de la section des produits
                Text(
                  'Our Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),

                // Grille des produits
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Deux colonnes
                    crossAxisSpacing: 16.0, // Espacement horizontal
                    mainAxisSpacing: 16.0, // Espacement vertical
                    childAspectRatio: 3.5 / 6, // Ratio pour ajuster la taille
                  ),
                  itemCount: 6, // Nombre de produits
                  itemBuilder: (context, index) {
                    return ProdwidgetLaptop(); // Assurez-vous que ce widget existe
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}