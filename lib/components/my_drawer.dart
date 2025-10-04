import 'package:flutter/material.dart';
import 'my_list_tile.dart'; 

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // Drawer header logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Shop tile
          MyListTile(
            icon: Icons.home,
            text: "Shop",
            onTap: () => Navigator.pop(context),
          ),

          // Cart tile
          MyListTile(
            icon: Icons.shopping_cart,
            text: "Cart",
            onTap: () {
              //first pop drawer
              Navigator.pop(context);
              //go to cart page
              Navigator.pushNamed(context, '/cart_page');
            },
          ),

          // Settings tile
          MyListTile(
            icon: Icons.settings,
            text: "Settings",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings_page');
            },
          ),

          // Exit shop
          MyListTile(
            icon: Icons.logout,
            text: "Exit",
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route)=> false);
            },
          ),
        ],
      ),
    );
  }
}