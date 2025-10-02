import 'package:flutter/material.dart';
import 'package:myapp/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/product.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove from cart 
  void removeItemFromCart(BuildContext context, Product product){
     showDialog(context: context , 
     builder: (context) => AlertDialog(
      content: const Text("Remove this item From your cart?"),
      actions: [
        //cancel button
        MaterialButton(onPressed: ()=> Navigator.pop(context),
        child: const Text("Cancel"),
        ),  

        //add button
         MaterialButton(onPressed: ()  {
         //pop the dialog box 
          Navigator.pop(context);
          //add to the cart
          context.read<Shop>().removeFromCart(product);
         },
        child: Text("Yes"),
     )],
     ));
  }

  @override
  Widget build(BuildContext context) {

    //get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                //get individual item in the cart and return as a tile
                final item = cart[index];

                //return list tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    onPressed:()=> removeItemFromCart(context , item),
                    icon: Icon(Icons.remove),
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
