import 'package:flutter/material.dart';
import 'package:flutter_editor_lab/provider/item_provider.dart';
import 'package:flutter_editor_lab/screens/edit_item_screen.dart';
import 'package:flutter_editor_lab/screens/item_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: ItemListScreen().routeName,
      routes: {
        ItemListScreen().routeName: (context) => const ItemListScreen(),
        EditItemScreen.routeName: (context) => const EditItemScreen(),
      },
    );
  }
}
