import 'package:flutter/material.dart';

class Prodwidget extends StatelessWidget {
  final String productName; // Nom du produit
  final String productPrice; // Prix du produit
  final String productImage; // URL de l'image du produit

  const Prodwidget({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Product Box
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Action for Add button
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      // Action for Favorite button
                    },
                    icon: const Icon(Icons.favorite),
                  ),
                ],
              ),
              Image.asset(
                productImage, // Image dynamically passed to widget
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8.0),
              Text(
                productName, // Product name dynamically passed to widget
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                productPrice, // Product price dynamically passed to widget
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0), // Space between product boxes
      ],
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Liste de produits pour la recherche
  List<Map<String, String>> allProducts = [
    {
      'name': 'iPhone 13',
      'price': 'mad 4300.00',
      'image': 'assets/iphone13promax.jpg',
    },
    {
      'name': 'Samsung Galaxy S21',
      'price': 'mad 3500.00',
      'image': 'assets/samsung galaxy.jpg',
    },
    {
      'name': 'Redmi Note 10',
      'price': 'mad 2500.00',
      'image': 'assets/redmi.jpg',
    },
    {
      'name': 'Huawei P40',
      'price': 'mad 3000.00',
      'image': 'assets/huawei.jpg',
    },
  ];

  List<Map<String, String>> filteredProducts = []; // Liste filtrée
  TextEditingController _searchController = TextEditingController(); // Contrôleur pour la recherche

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts; // Par défaut, afficher tous les produits
    _searchController.addListener(_filterProducts); // Listener pour la recherche
  }

  void _filterProducts() {
    setState(() {
      // Filtrer les produits en fonction du texte saisi
      filteredProducts = allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search Products'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Champ de recherche
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for product...',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              // Affichage des produits filtrés
              filteredProducts.isEmpty
                  ? const Center(child: Text('No products found', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
                  : Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                          childAspectRatio: 3.5 / 6,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return Prodwidget(
                            productName: filteredProducts[index]['name']!,
                            productPrice: filteredProducts[index]['price']!,
                            productImage: filteredProducts[index]['image']!,
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
