import 'package:challenges/util/util.dart';
import 'package:flutter/material.dart';

import 'missing_number.dart';

class MissingNumberView extends StatelessWidget {
  MissingNumberView({super.key});

  final MissingNumber instance = MissingNumber();

  @override
  Widget build(BuildContext context) {
    List<int> missingValues = instance.findMissing();
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("List:", style: util.sessionTitle),
            Text(instance.list.toString()),
            Text("Missing number: $missingValues")
          ],
        ),
      ),
    );
  }
}
