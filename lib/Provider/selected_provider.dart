import 'package:flutter/foundation.dart';

class SelectedItems with ChangeNotifier {
  final List<int> _selectedItems = [];
  List<int> get selectedItems => _selectedItems;
  void addItems(int value) {
    selectedItems.add(value);
    notifyListeners();
  }

  void removeItems(int value) {
    selectedItems.remove(value);
    notifyListeners();
  }
}
