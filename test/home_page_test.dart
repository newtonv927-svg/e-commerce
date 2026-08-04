import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('filterProducts', () {
    test(
      'returns only products matching the selected category and search query',
      () {
        final products = [
          Product(
            name: 'MacBook Air M2',
            image: 'https://example.com/macbook.jpg',
            price: 1200,
            category: 'Laptops',
          ),
          Product(
            name: 'Nike Air Max',
            image: 'https://example.com/shoes.jpg',
            price: 120,
            category: 'Shoes',
          ),
        ];

        final filtered = filterProducts(products, 'Laptops', 'mac');

        expect(filtered.length, 1);
        expect(filtered.single.name, 'MacBook Air M2');
      },
    );
  });
}
