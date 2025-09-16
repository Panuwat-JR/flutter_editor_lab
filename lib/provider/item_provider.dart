import 'package:flutter/foundation.dart';
import '../models/item.dart';

class ItemProvider extends ChangeNotifier {
  
  final List<Item> _items = [
    Item(id: '1', name: 'MacBook Pro', description: 'Apple M3 Pro Chip'),
    Item(id: '2', name: 'Dell XPS 15', description: 'Intel Core i9, 32GB RAM'),
    Item(id: '3', name: 'Logitech MX Master 3S', description: 'Wireless Mouse'),
  ];

 
  List<Item> get items => _items;

 
  void updateItem(String id, String newName, String newDescription) {
    final itemIndex = _items.indexWhere((item) => item.id == id);
    if (itemIndex >= 0) {
      _items[itemIndex].name = newName;
      _items[itemIndex].description = newDescription;
      notifyListeners(); 
    }
  }
}
