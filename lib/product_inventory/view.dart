import 'package:challenges/product_inventory/inventory.dart';
import 'package:challenges/util/util.dart';
import 'package:flutter/material.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  late bool checkProduct;
  late Inventory inventory;

  @override
  void initState() {
    checkProduct=false;
    inventory = Inventory();
    inventory.updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Total inventory value:",style: util.sessionTitle),
            Text(inventory.sumValue().toString()),
            util.lnSpacing,
            Text("Most expensive product:",style: util.sessionTitle),
            Text(inventory.mostExpensive()),
            util.lnSpacing,
            Row(
              children: [
                Text("Check product existence: ",style: util.sessionTitle),
                Expanded(child: TextField(onChanged: searchProduct,))
              ],
            ),
            Text(checkProduct?"True":"False"),
          ],
        ),
      )
    );
  }

  void searchProduct(String value) {
    setState(() {
      checkProduct=inventory.checkItem(value);
    });
  }
}
