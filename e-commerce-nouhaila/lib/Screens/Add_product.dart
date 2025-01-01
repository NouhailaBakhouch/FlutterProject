import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProduct> {
  File? pickedImage;

  void uploadImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  String category = 'iphone';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey, // Associe le formulaire à la clé
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo ou titre principal
                  const Icon(
                    Icons.shopping_cart,
                    size: 80,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to E-Commerce',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Add a new product!',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 30),

                  // Champ de saisie pour le titre
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Title',
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Title is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Champ de saisie pour la description
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description',
                      prefixIcon: const Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Champ de saisie pour le prix
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Price',
                      prefixIcon: const Icon(Icons.money),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Price is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Liste déroulante pour la catégorie
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: category,
                      hint: const Text('Select a category'),
                      onChanged: (value) {
                        setState(() {
                          category = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          child: Text('iPhone'),
                          value: 'iphone',
                        ),
                        DropdownMenuItem(
                          child: Text('Laptop'),
                          value: 'laptop',
                        ),
                        DropdownMenuItem(
                          child: Text('Watch'),
                          value: 'watch',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bouton pour sélectionner une image
                  TextButton(
                    onPressed: () {
                      uploadImage();
                    },
                    child: pickedImage == null
                        ? const Text('Choose Image')
                        : Image.file(pickedImage!),
                  ),

                  const SizedBox(height: 30),

                  // Bouton d'upload
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Si le formulaire est valide
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Successful uploading')),
                          );
                        }
                      },
                      child: const Text(
                        'Upload',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
