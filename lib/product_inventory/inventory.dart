import 'inventory_item.dart';

class Inventory {
  List<InventoryItem> list=List.empty(growable: true);
  
  updateList() {
    list.clear();
    list.add(InventoryItem(name: "laptop", price: 999.99, quantity: 5));
    list.add(InventoryItem(name: "smartphone", price: 499.99, quantity: 10));
    list.add(InventoryItem(name: "tablet", price: 299.99, quantity: 0));
    list.add(InventoryItem(name: "smartwatch", price: 199.99, quantity: 3));
  }

  getList() { //PSEUDO get data from database
    return list;
  }

  @override
  String toString() { //limit printing only several products
    String result = "Product List:\n\n";
    for (InventoryItem item in list) {
      if (result.length<1000) {
        result+="$item\n";
      } else break;
    }
    return result;
  }

  double sumValue() {
    dynamic retrievedInventory = getList();
    double result=0;
    for(InventoryItem item in retrievedInventory) {
      result+=item.price*item.quantity;
    }
    return result;
  }

  String mostExpensive() {
    dynamic retrievedInventory = getList();
    if (retrievedInventory.isEmpty) return "No item in database.";
    double maxPrice = retrievedInventory[0].price;
    String result=retrievedInventory[0].name;
    for (InventoryItem item in retrievedInventory) {
      if (item.price>maxPrice) {
        maxPrice=item.price;
        result=item.name;
      }
    }
    return result;
  }

  bool checkItem(String value) {
    dynamic retrievedInventory = getList();
    for (InventoryItem item in retrievedInventory) {
      if (item.name==value.toLowerCase()) return true;
    }
    return false;
  }
}