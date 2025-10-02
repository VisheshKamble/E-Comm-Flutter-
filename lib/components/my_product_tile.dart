import 'package:flutter/material.dart';
import 'package:myapp/models/shop.dart';
import 'package:myapp/models/product.dart';
import 'package:provider/provider.dart';


class MyProductTile extends StatelessWidget{
  final Product product ;
  const MyProductTile({super.key , required this.product});

  //add to cart button pressed

  void addToCart(BuildContext context){
    //show dialog box to confirm user to add to cart
    showDialog(context: context,
     builder: (context) => AlertDialog(
      content: Text("Add this item to your cart?"),
      actions: [
        //cancel button
        MaterialButton(onPressed: ()=> Navigator.pop(context),
        child: Text("Cancel"),
        ),  

        //add button
         MaterialButton(onPressed: ()  {
         //pop the dialog box 
          Navigator.pop(context);
          //add to the cart
          context.read<Shop>().addToCart(product);
         },
        child: Text("Yes"),
     )],
     ));
  }

  @override
  Widget build(BuildContext context) {
   return Container(
    decoration: BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.all(10),
    padding : const EdgeInsets.all(25),
    width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        //image
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
            ),

            width: double.infinity,
            padding: const EdgeInsets.all(25),
            child: Image.asset(product.imagePath))
        ),

        const SizedBox(height: 25),
      
        //name 
        Text(product.name , 
        
        style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20 ,),),

       const SizedBox(height: 10),
        //product description
        Text(product.description , 
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          ],
        ),
     

        //product price + add to cart button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\₹' + product.price.toStringAsFixed(2)),

            //add to cart button
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12)
              ),
              child: IconButton(onPressed : () => addToCart(context),
               icon: const Icon(Icons.add) ),
            )

          ],
        )

      ],
    ),
   );
  }
}