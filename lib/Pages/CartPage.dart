import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/models/product.dart';
import 'package:myapp/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Item"),
        content: Text("Remove ${product.name} from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Removed from cart!")),
              );
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void clearCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Clear Cart"),
        content: const Text("Are you sure you want to clear your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final shop = context.read<Shop>();
              shop.cart.clear();
              shop.notifyListeners();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cart cleared!")),
              );
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Cart"),
        actions: [
          if (context.watch<Shop>().cart.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () => clearCart(context),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: context.watch<Shop>().cart.isEmpty
                  ? const Center(
                      child: Text(
                        "Your cart is empty...",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: context.watch<Shop>().cart.length,
                      itemBuilder: (context, index) {
                        final item = context.watch<Shop>().cart[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                item.imagePath,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error, size: 50),
                              ),
                            ),
                            title: Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('₹${item.price.toStringAsFixed(2)}'),
                                Text(
                                  item.description,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => removeItemFromCart(context, item),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            if (context.watch<Shop>().cart.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total: ₹${context.watch<Shop>().cart.fold(0.0, (sum, item) => sum + item.price).toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    MyButton(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Payment feature removed.")),
                        );
                      },
                      child: const Text("Proceed to Pay", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}