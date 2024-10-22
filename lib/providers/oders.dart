import 'package:flutter/material.dart';
import 'package:localmarket/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> orderedProducts;
  final DateTime datetime;

  OrderItem({
    required this.id, // Usar `required` en lugar de `@required`
    required this.amount,
    required this.orderedProducts,
    required this.datetime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.add(OrderItem(
      amount: total,
      datetime: DateTime.now(),
      id: DateTime.now().toString(),
      orderedProducts: cartProducts,
    ));

    notifyListeners();
  }

  void clearAll() {
    _orders = [];
    notifyListeners();
  }
}
