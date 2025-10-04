import 'package:flutter/material.dart';
import 'package:myapp/components/my_drawer.dart';
import 'package:myapp/components/my_product_tile.dart';
import 'package:myapp/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Shop"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover Premium Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 15),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}