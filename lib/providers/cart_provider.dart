import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  String name = 'pizza';
  String topping = 'tomato';
  String base = 'regular';

  String get getTopping => topping;
  String get getBase => base;

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setBase(String base) {
    this.base = base;
    notifyListeners();
  }

  void setTopping(String topping) {
    this.topping = topping;
    notifyListeners();
  }

  String get placeOrder =>
      'Order placed for $name , topping is $topping , base is $base';
}
