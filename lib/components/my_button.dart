import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child; 

  const MyButton({
    super.key, 
    required this.onTap, 
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding : const  EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}