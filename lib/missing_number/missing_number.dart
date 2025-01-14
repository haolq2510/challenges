import 'package:flutter/cupertino.dart';

class MissingNumber {
  List<int> list = [3,7,1,2,6,9]; //TODO: change here for testing!!!

  List<int> findMissing() {
    if (list.isEmpty) return List.empty();
    List<int> shadowList=List.empty(growable: true);

    //Find min,max in list
    int minValue = list[0];
    int maxValue = list[0];
    for (var value in list) {
      if (value>maxValue) maxValue=value;
      if (value<minValue) minValue=value;
    }
    debugPrint(maxValue.toString());
    debugPrint(minValue.toString());
    int shadowValue= minValue;

    //Create shadow
    while(shadowValue<=maxValue) {
      shadowList.add(shadowValue);
      shadowValue+=1;
    }

    for (var value in list) {
      shadowList.removeWhere((element)=>element==value);
    }
    return shadowList;
  }
}