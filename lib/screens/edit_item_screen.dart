import 'package:flutter/material.dart';
import 'package:flutter_editor_lab/provider/item_provider.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';

class EditItemScreen extends StatefulWidget {
  static const routeName = '/edit-item';
  const EditItemScreen({super.key});

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late Item _item;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    _item = item;

    
    _nameController = TextEditingController(text: _item.name);
    _descriptionController = TextEditingController(text: _item.description);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveForm() {
    
    context.read<ItemProvider>().updateItem(
      _item.id,
      _nameController.text,
      _descriptionController.text,
    );
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('แก้ไข: ${_item.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'ชื่อสินค้า'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'คำอธิบาย'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveForm,
              child: const Text('บันทึกการเปลี่ยนแปลง'),
            ),
          ],
        ),
      ),
    );
  }
}
