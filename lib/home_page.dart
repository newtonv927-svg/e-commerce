import 'package:e_commerce/pages/Favourites.dart';
import 'package:e_commerce/pages/cart.dart';
import 'package:e_commerce/pages/profile.dart';
import 'package:e_commerce/widgets/category_item.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'models/product.dart';

List<Product> filterProducts(
  List<Product> products,
  String selectedCategory,
  String query,
) {
  final normalizedQuery = query.trim().toLowerCase();

  return products.where((product) {
    final matchesCategory =
        selectedCategory == 'All' ||
        product.category.toLowerCase() == selectedCategory.toLowerCase();
    final matchesQuery =
        normalizedQuery.isEmpty ||
        product.name.toLowerCase().contains(normalizedQuery) ||
        product.category.toLowerCase().contains(normalizedQuery);

    return matchesCategory && matchesQuery;
  }).toList();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> categories = [
    'All',
    'Shoes',
    'Phones',
    'Laptops',
    'Clothes',
    'Watches',
    'Bags',
  ];

  String selectedCategory = 'All';

  final List<Product> products = [
    Product(
      name: 'Nike Air Max',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      price: 120,
      category: 'Shoes',
    ),
    Product(
      name: 'iPhone 15 Pro',
      image: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
      price: 950,
      category: 'Phones',
    ),
    Product(
      name: 'MacBook Air M2',
      image: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
      price: 1200,
      category: 'Laptops',
    ),
    Product(
      name: 'Apple Watch Series 9',
      image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      price: 399,
      category: 'Watches',
    ),
    Product(
      name: 'Nike Air Force 1',
      image: 'https://images.unsplash.com/photo-1549298916-b41d501d3772',
      price: 180,
      category: 'Shoes',
    ),
    Product(
      name: 'Samsung Galaxy S24',
      image: 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5',
      price: 850,
      category: 'Phones',
    ),
    Product(
      name: 'Dell XPS 13',
      image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
      price: 1100,
      category: 'Laptops',
    ),
    Product(
      name: 'Garmin Venu 3',
      image: 'https://images.unsplash.com/photo-1546868871-7041f2a55e12',
      price: 320,
      category: 'Watches',
    ),
    Product(
      name: 'Sony WH-1000XM5',
      image: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
      price: 299,
      category: 'Bags',
    ),
    Product(
      name: 'Lenovo ThinkPad X1',
      image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
      price: 1350,
      category: 'Laptops',
    ),
    Product(
      name: 'Puma Running Shoes',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      price: 95,
      category: 'Shoes',
    ),
    Product(
      name: 'Google Pixel 8',
      image: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97',
      price: 700,
      category: 'Phones',
    ),
    Product(
      name: 'ASUS Zenbook 14',
      image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8',
      price: 999,
      category: 'Laptops',
    ),
    Product(
      name: 'Amazfit Bip 5',
      image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      price: 120,
      category: 'Watches',
    ),
    Product(
      name: 'Jordan Retro 1',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      price: 220,
      category: 'Shoes',
    ),
    Product(
      name: 'OnePlus 12',
      image: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
      price: 780,
      category: 'Phones',
    ),
    Product(
      name: 'HP Spectre x360',
      image: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
      price: 1450,
      category: 'Laptops',
    ),
    Product(
      name: 'Samsung Galaxy Watch 7',
      image: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
      price: 350,
      category: 'Watches',
    ),
    Product(
      name: 'New Balance 990v5',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      price: 170,
      category: 'Shoes',
    ),
    Product(
      name: 'Xiaomi 14',
      image: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9',
      price: 650,
      category: 'Phones',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = filterProducts(
      products,
      selectedCategory,
      _searchController.text,
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('E-Commerce'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _searchController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: 'Search products',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        label: Text(category),
                        backgroundColor: isSelected
                            ? Colors.blue
                            : Colors.blue.shade100,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(
                      child: Text('No products found for this search.'),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];

                        return Card(
                          elevation: 4,
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                '\$${product.price}',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Buy'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      
        );
      
  }
}
