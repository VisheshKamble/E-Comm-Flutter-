import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/themes/themeprovider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SwitchListTile(
          title: const Text("Dark Mode"),
          value: themeProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
          activeThumbColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}