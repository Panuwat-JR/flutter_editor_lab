import 'package:flutter/material.dart';
import 'package:flutter_editor_lab/provider/item_provider.dart';
import 'package:flutter_editor_lab/screens/edit_item_screen.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatelessWidget {
  final String routeName = '/';

  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('รายการสินค้า')),
      body: Consumer<ItemProvider>(
        builder: (context, itemProvider, child) {
          return ListView.builder(
            itemCount: itemProvider.items.length,
            itemBuilder: (context, index) {
              final item = itemProvider.items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    EditItemScreen.routeName,
                    arguments: item, 
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
