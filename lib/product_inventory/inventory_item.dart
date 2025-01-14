import 'dart:core';

class InventoryItem {
  String name;
  double price;
  int quantity;

  InventoryItem({
    required this.name,
    required this.price,
    required this.quantity
  });

  @override
  String toString(){
    String firstLetter = name[0];
    String keep = name.replaceFirst(firstLetter, '');
    return "$firstLetter$keep : price $price, quantity $quantity";
  }
}