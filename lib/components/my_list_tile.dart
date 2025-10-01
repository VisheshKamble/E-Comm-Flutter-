import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon; 
  final String text;
  final VoidCallback? onTap;

  const MyListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(text),
      onTap: onTap,
    );
  }
}
