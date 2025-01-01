import 'package:flutter/material.dart';

class ProdwidgetLaptop extends StatelessWidget {
  const ProdwidgetLaptop({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Ajout de SingleChildScrollView pour permettre le défilement
      child: Column(
        children: [
          // Laptop 1 Product Box
          ProductCard(
            imagePath: 'assets/laptop1.jpg',
            productName: 'Laptop HP Pavilion',
            productPrice: 'MAD 5500.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Laptop HP Pavilion',
                    productPrice: 'MAD 5500.00',
                    productDescription: 'Powerful HP Pavilion with latest specs.',
                    imagePath: 'assets/laptop1.jpg',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Laptop 2 Product Box
          ProductCard(
            imagePath: 'assets/laptop2.jpg',
            productName: 'Laptop Dell Inspiron',
            productPrice: 'MAD 4800.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Laptop Dell Inspiron',
                    productPrice: 'MAD 4800.00',
                    productDescription: 'Affordable Dell Inspiron with great features.',
                    imagePath: 'assets/laptop2.jpg',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Laptop 3 Product Box
          ProductCard(
            imagePath: 'assets/laptop3.jpg',
            productName: 'Lenovo ThinkPad',
            productPrice: 'MAD 6200.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Lenovo ThinkPad',
                    productPrice: 'MAD 6200.00',
                    productDescription: 'Premium business laptop from Lenovo.',
                    imagePath: 'assets/laptop3.jpg',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Laptop 4 Product Box
          ProductCard(
            imagePath: 'assets/laptop4.jpg',
            productName: 'Acer Aspire 5',
            productPrice: 'MAD 4200.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Acer Aspire 5',
                    productPrice: 'MAD 4200.00',
                    productDescription: 'Affordable Acer Aspire 5 with solid specs.',
                    imagePath: 'assets/laptop4.jpg',
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Laptop 5 Product Box
          ProductCard(
            imagePath: 'assets/laptop5.jpg',
            productName: 'Asus ZenBook',
            productPrice: 'MAD 7000.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Asus ZenBook',
                    productPrice: 'MAD 7000.00',
                    productDescription: 'Sleek and powerful Asus ZenBook.',
                    imagePath: 'assets/laptop5.jpg',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final VoidCallback onTap;

  const ProductCard({
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              imagePath,
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(
              productName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final String imagePath;

  const ProductDetailsPage({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              productName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              productPrice,
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Description: $productDescription',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
