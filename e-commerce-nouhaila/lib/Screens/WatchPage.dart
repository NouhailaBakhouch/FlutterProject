import 'package:flutter/material.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watches')),
      body: ListView(
        children: [
          // Montre 1
          ProductCard(
            imagePath: 'assets/watch1.jpg', // Remplacez par l'image de votre choix
            productName: 'Watch Rolex',
            productPrice: 'MAD 15000.00',
            onTap: () {
              // Redirection vers la page des détails
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch Rolex',
                    productPrice: 'MAD 15000.00',
                    productDescription: 'Luxury Rolex watch with high precision.',
                    imagePath: 'assets/watch1.jpg', // Remplacez par l'image de votre choix
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Montre 2
          ProductCard(
            imagePath: 'assets/watch2.jpg', // Remplacez par l'image de votre choix
            productName: 'Watch Omega',
            productPrice: 'MAD 12000.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch Omega',
                    productPrice: 'MAD 12000.00',
                    productDescription: 'Elegant Omega watch with classic design.',
                    imagePath: 'assets/watch2.jpg', // Remplacez par l'image de votre choix
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Montre 3
          ProductCard(
            imagePath: 'assets/watch3.jpg', // Remplacez par l'image de votre choix
            productName: 'Watch Casio',
            productPrice: 'MAD 500.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch Casio',
                    productPrice: 'MAD 500.00',
                    productDescription: 'Casio watch with digital display.',
                    imagePath: 'assets/watch3.jpg', // Remplacez par l'image de votre choix
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Montre 4
          ProductCard(
            imagePath: 'assets/watch4.jpg', // Remplacez par l'image de votre choix
            productName: 'Watch TAG Heuer',
            productPrice: 'MAD 20000.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch TAG Heuer',
                    productPrice: 'MAD 20000.00',
                    productDescription: 'Premium TAG Heuer watch for luxury lovers.',
                    imagePath: 'assets/watch4.jpg', // Remplacez par l'image de votre choix
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Montre 5
          ProductCard(
            imagePath: 'assets/watch5.jpg', // Remplacez par l'image de votre choix
            productName: 'Watch Fossil',
            productPrice: 'MAD 800.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch Fossil',
                    productPrice: 'MAD 800.00',
                    productDescription: 'Stylish Fossil watch with classic appeal.',
                    imagePath: 'assets/watch5.jpg', // Remplacez par l'image de votre choix
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 16.0),

          // Montre 6
          ProductCard(
            imagePath: 'assets/watch6.png', // Remplacez par l'image de votre choix
            productName: 'Watch Seiko',
            productPrice: 'MAD 1200.00',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(
                    productName: 'Watch Seiko',
                    productPrice: 'MAD 1200.00',
                    productDescription: 'Seiko automatic watch with great durability.',
                    imagePath: 'assets/watch6.png', // Remplacez par l'image de votre choix
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
      onTap: onTap, // Make the entire card clickable
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
        ),
        child: Column(
          children: [
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
